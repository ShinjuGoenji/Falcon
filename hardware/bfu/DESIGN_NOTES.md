# BFU Design Notes

## Overview
Unified Butterfly Unit (BFU) — a pipelined, 64-bit IEEE-754 complex-arithmetic
DSP that accelerates all butterfly operations required by Falcon-512 signature
generation.  Supports five modes in one physical datapath: FFT/Merge, iFFT,
Split FFT, Vector FMS, and Vector ADD.
C-model references: `software/fft.c` (FFT/iFFT/split/merge), `software/sign.c`
~L396 (FMS / Vector ADD — ffSampling Phase-2/3).

## Mode Encoding

| `bfu_mode` | Operation | Datapath | Notes |
|------------|-----------|----------|-------|
| `3'b000` | FFT / Merge FFT | mul-first | `X=x+y·W, Y=x−y·W` |
| `3'b001` | iFFT | add/sub-first, conj(W) | `X=x+y, Y=(x−y)·conj(W)` |
| `3'b010` | Split FFT | add/sub-first, conj(W), ×0.5 | folded at registered inputs |
| `3'b011` | Vector FMS | add/sub-first, raw W | `X=(x−y)·W` (Phase-2) |
| `3'b100` | Vector ADD | add-first, delay-align | `X=x+y` (Phase-3) |

## Design Decisions

- **3 FPC submodules (FPC_MUL / FPC_ADD / FPC_SUB)** share one physical datapath;
  the mode selects whether mul-first or add/sub-first sequencing is used.
- **Latency:** `TOTAL_LATENCY = MUL_LATENCY + ADDSUB_LATENCY = 3 + 3 = 6` internal
  pipeline stages; testbench observes 8 cycles (1 input edge + 6 + 1 output reg).
- **Twiddle conjugation** for iFFT/Split is done at the *registered* `w_delay` input
  (sign-bit inversion ahead of a flop — essentially free).  FMS uses raw W
  (`do_conj_in` flag gates it).
- **Split ×0.5** is folded into the *registered* delay-line inputs (exponent
  decrement via `half()`):  `0.5·(x+y)` → data delay line,
  `0.5·conj(W)` → twiddle delay line.  The output stage is a **pure select MUX**
  — no scaling logic on any combinational datapath.  This was the key fix to
  restore retiming budget after synthesis slack went from 0.00 → −0.06.
- **Vector FMS** zero-cost reuses the iFFT sub-then-mul path with conjugation and
  ×0.5 disabled.  `is_fms_out` routes `mul_out` to the X port.
- **Vector ADD** reuses the *existing* `delay_line` (depth `MUL_LATENCY = 3`) as
  its alignment shift register: `add_out` is ready at stage 3 and shifts to
  stage 6 (= TOTAL_LATENCY) with no new flops.  The constraint `addsub_first_out`
  routes `delay_out` to X.
- **`bfu_mode` must stay static** during a pattern's full pipeline flight.  The
  input-side muxes (conjugation, ×0.5, datapath select) use the *current* mode;
  the output select uses `bfu_mode_reg[0]` (pipelined, depth TOTAL_LATENCY).

## Performance Summary

| Metric | Value | Notes |
|--------|-------|-------|
| **Latency** | 8 cycles (TB view) | 6 internal + 1 in + 1 out reg |
| **Pipeline stages** | 6 (`TOTAL_LATENCY`) | MUL_LATENCY 3 + ADDSUB_LATENCY 3 |
| **Area** | 90,246 µm² | TSMC 40nm, ss/0.81V/125°C |
| **Setup slack** | 0.00 ns (MET) | @ 1.2 ns (833 MHz); target 530 MHz |
| **Hold slack** | +0.01 ns (MET) | |
| **Critical path** | internal FPC_MUL retimed regs | output X/Y regs are not on worst path |

## FP Semantics — bit-exact golden methodology

The custom Verilog FP (FPC.sv `fpr_mul`/`fpr_add`) **truncates** (round-toward-zero,
no subnormal/overflow handling).  The C reference rounds-to-nearest so it cannot
serve as a direct golden.  Fix: `software/bfu_trunc.h` + `#ifdef BFU_TRUNC` in
`fpr.h` routes `fpr_add/sub/mul` through a C port of the Verilog logic, producing
bit-exact vectors.  `software/fft.c` + `hardware/bfu/golden/bfu_extract_main.c`
extract stimulus/golden from live Falcon arithmetic under this emulation.

## Test Coverage

- [x] RTL simulation 5632/5632 bit-exact (all 5 modes, uniform latency 8)
- [x] Synthesis timing closure @ 1.2 ns, slack 0.00 MET
- [ ] Gate-level simulation (next step)

## Interface

| Signal | Dir | Bits | Notes |
|--------|-----|------|-------|
| `clk` | in | 1 | |
| `rst_n` | in | 1 | async active-low |
| `in_valid` | in | 1 | 1-cycle strobe |
| `bfu_mode` | in | 3 | mode encoding (see table above) |
| `x_re/x_im` | in | 64 | complex operand x |
| `y_re/y_im` | in | 64 | complex operand y |
| `w_re/w_im` | in | 64 | twiddle / multiplier (non-conjugated) |
| `out_valid` | out | 1 | registered, 8 cycles after in_valid |
| `X_re/X_im` | out | 64 | result X |
| `Y_re/Y_im` | out | 64 | result Y (don't-care for FMS/VecADD) |

## References
- Paper: `doc/FalconSign`
- C reference: `software/fft.c`, `software/sign.c`
- FP primitives: `hardware/fpc/01_RTL/FPC.sv`
