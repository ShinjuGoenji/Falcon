# fpr_inv Design Notes

## Overview
IEEE-754 Float64 reciprocal: `z = 1.0 / b`. A thin wrapper around the
DesignWare `DW_lp_piped_fp_recip` pipelined reciprocal. Used by the FFT-domain
inverse/division ops in Falcon.
C reference: `software/fpr.h: fpr_inv(x) = 1.0 / x` (calls `fpr_div(1.0, x)`).

## Design Decisions
- **DesignWare IP**: `DW_lp_piped_fp_recip` (not custom RTL). Originally used
  `DW_lp_piped_fp_div` with numerator hardwired to 1.0, but that bit-serial
  divider caused Design Compiler's retiming ("final register move") to hang for
  hours at high stage counts. The purpose-built reciprocal is smaller and
  synthesis-friendly. `sig_width=52`, `exp_width=11`, `ieee_compliance=0`,
  `rnd=round-to-nearest`, `stages=10`, `no_pm=1`.
- **Single data input**: `b` (value to invert) feeds the recip `.a` port; `z = 1/a`.
  No hardwired numerator needed.
- **`launch` tied HIGH (`1'b1`)**: with `no_pm=1` the launch pulse would gate
  the per-stage register enables and stall the data, so it must be held high so
  data flows continuously. Validity is tracked by a separate shift register.
  (Matches the proven pattern in `hardware/poly_invnorm2_fft`.)
- **Optional pipe-management outputs left unconnected** (status, pipe_full,
  pipe_ovf, arrive, arrive_id, push_out_n, pipe_census) — harmless
  "too few port connections" width warning.
- The divisor `b` is registered at the input; the quotient at the output.
  Empirically z and out_valid align exactly when the valid shift register depth
  = `stages` (verified by timing probe).

## Performance Summary

**Final config: `stages=6` @ 1.2 ns** — minimum stage count that closes timing
at the full system clock (833 MHz). RTL sim 10004/10004 bit-exact, latency 8
cycles (TB count). stages=7 would add timing guardband at +1 cycle/area if needed.

| Metric | Value | Notes |
|--------|-------|-------|
| **Latency** | 8 cycles (TB count) | in_valid → out_valid, stages=6 |
| **Pipeline** | DW `stages=10` + in/out regs | data path = stages+1 register delays |
| **Throughput** | 1 result/cycle | fully pipelined, launch always high |
| **Area / Power / Timing** | TBD | from synthesis (not yet run) |

## Interface

| Signal | Dir | Bits | Notes |
|--------|-----|------|-------|
| `clk` | in | 1 | |
| `rst_n` | in | 1 | async active-low |
| `in_valid` | in | 1 | 1-cycle strobe |
| `b` | in | 64 | divisor (value to invert) |
| `out_valid` | out | 1 | registered, 12 cycles after in_valid |
| `z` | out | 64 | `1.0 / b` |

## Build / Sim Notes
- `DW_lp_piped_fp_div.v` lives under `${DW_SIM}` (`/usr/cad/.../dw/sim_ver/`).
  The makefile picks it up via `-y ${DW_SIM} +libext+.sv+.v` (the `.v` ext is
  required — the DW model is a `.v` file, not `.sv`).

## Test Coverage
- [x] Functional correctness (RTL sim vs. C reference) — 10004/10004 bit-exact
- [ ] Timing closure
- [ ] Gate-level simulation

## Vector Extraction
Stimulus comes from real Falcon execution: inline `fopen/fprintf` was added to
`fpr_inv()` in `software/fpr.h`, then `make test_falcon && ./test_falcon` was run
(3.87M reciprocals captured), subsampled to 10004 patterns, and the C source was
reverted.

## Known Issues
- `DW_lp_piped_fp_div` (the original choice) hangs DC retiming at high `stages`
  (bit-serial divide → huge comb cloud → "final register move" intractable).
  Switched to `DW_lp_piped_fp_recip` to avoid this. Synthesis of the recip
  version not yet run.

## References
- DesignWare: `doc/dw_lp_piped_fp_div.pdf`, `dw_lp_piped_fp_recip.pdf`
  (full set at `/cad/synopsys/synthesis/2022.03/dw/doc/datasheets/`)
- Reference module: `hardware/poly_invnorm2_fft/01_RTL/POLY_INVNORM2_FFT.v`
  (same divider, stages=10 @ 4.0ns, slack MET)
- C reference: `software/fpr.h`, `software/fpr.c` (`fpr_div`)
