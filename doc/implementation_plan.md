# Zf(sign_dyn) Hardware Implementation Plan (v2 — Confirmed Version)

## 1. Design Decision Summary

| Item | Decision |
|------|----------|
| Platform | ASIC (TSMC 28nm HPC, ARM Artisan Physical IP) |
| Verification Flow | VCS RTL sim → Design Compiler Synthesis → VCS Gate sim |
| SRAM / RF | ARM Artisan Physical IP (Single-Port, ASIC version) |
| FP64 Resources | **Shared Multiplexing** (All modules share the same FP Unit via time-division) |
| Throughput Target | Paper *Sign_Dynamic*: **264k cycles @ 158MHz on FPGA; ASIC target ≈ 0.71mm² @ 530MHz** |
| Max Retries | Parameterized `MAX_RETRY = 5` (adjustable parameter) |
| Recursion Unrolling | Paper *Dynamic Task Update*: State-Transition-Based, 4 states (RIGHT-DOWN / RIGHT-UP / LEFT-DOWN / LEFT-UP) + level/index registers |
| Design Language | SystemVerilog |

## 2. Paper Target Specifications (ASIC Falcon-512 Sign_Dynamic)

| Metric | Value |
|--------|-------|
| Area | 0.71 mm² (759K gates + 136.3KB SRAM) |
| Frequency | 530 MHz (*Sign_Tree*); slightly lower for *Sign_Dynamic* due to div/sqrt |
| Cycles | ~264k cycles (Estimated) |
| Power | 62 mW (*Sign_Tree*); *Sign_Dynamic* is slightly higher |
| SamplerZ | 74 cycles/sample |
| BFU Parallelism | 4 BFU |

## 3. Data Memory Planning (ARM Artisan Single-Port SRAM)

| Bank | Content | Size |
|------|---------|------|
| Bank0 | b00, b01, t0, tmp0 | 16KB |
| Bank1 | b10, b11, t1, tmp1 | 16KB |
| Bank2 | g00, g01, g11, l10_stack | 16KB |
| Bank3 | z0, z1, tmp2, Twiddle ROM | 16KB + 8KB ROM |

## 4. Module Specifications

### Total Control (Main FSM + Task Scheduler)
- **Task Format (68 bits):** `src_addr_A`, `src_addr_B`, `dst_addr`, `vector_len`, `opcode`, `level`, `index`.
- **Opcode Support:** FFT, IFFT, SPLIT, MERGE, LDL, MULSELFADJ, MULADJ, MUL, ADD, SUB, NEG, MULCONST, SQRT_NORM, SAMPLE, INT2FPR, FPR2INT.

### FPU (Floating-Point Processing Unit)
- **Core:** 4 × BFU (Butterfly Unit) in parallel.
- **Shared Strategy:** FPU, LDL, and Sampler share the same 4 BFU cluster.
- **Optimizations:** No support for Inf/NaN/Subnormal.

### ffSampling Control (Dynamic Task Update FSM)
- **4 States:** `RIGHT_DOWN`, `RIGHT_UP`, `LEFT_DOWN`, `LEFT_UP`.
- **Additional Tasks:** LDL step needs `fp64_div` and leaf node (level 9) needs `fp64_sqrt`.

### SamplerZ (Discrete Gaussian Sampler)
- 74 cycles/sample, pipeline design.
- Components: BaseSamp, BerExp, Pipeline Logic.

## 5. Implementation Roadmap

| Timeline | Milestone |
|----------|-----------|
| Weeks 1-3 | FP64 units (add/mul/div/sqrt) |
| Weeks 4-6 | Twiddle ROM, BFU, FFT/IFFT/Split/Merge engine |
| Weeks 7-8 | `poly_ops_engine` (LDL), ChaCha20, SamplerZ pipeline |
| Weeks 9-10 | 4-bank SRAM interface, Total Control FSM |
| Weeks 11-12 | Remaining modules (SHAKE256, HashToPoint, etc.) & Integration |
| Weeks 13-15 | Simulation, Synthesis, and Timing Closure |
