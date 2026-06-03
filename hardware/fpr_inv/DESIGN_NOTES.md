# fpr_inv Design Notes

## Overview
[Brief description of module purpose and functionality (1–3 sentences)]
Link to corresponding C code function: `software/file.c: Zf(function_name)`

## Design Decisions
- **Parallelism**: [description], controlled by parameter `PARALLELISM = X`
- **Pipeline**: [Y] stages, latency = [Z] cycles
- **Key optimization**: [e.g., "merged multiply-add to reduce latency"]
- Tradeoffs considered and rejected

## Performance Summary

| Metric | Value | Notes |
|--------|-------|-------|
| **Throughput** | X cycles/iteration | |
| **Latency** | Y cycles | Clock cycles from input valid to output valid |
| **Pipeline Stages** | Z | |
| **Area** | ~A mm² (gate) | From synthesis report |
| **Power** | ~B mW @ C MHz | From synthesis report |
| **Critical Path** | D ns | From timing report |

## Interface & Timing

| Signal | Direction | Bits | Timing | Notes |
|--------|-----------|------|--------|-------|
| `clk` | in | 1 | — | System clock |
| `rst_n` | in | 1 | async | Active-low reset |
| `in_valid` | in | 1 | combinational | Strobe |
| `out_valid` | out | 1 | registered | Latency [Z] cycles |

## Design Parameters

```systemverilog
parameter PARALLELISM = 4;
parameter LOGN = 9;
```

Performance vs. Parameters:
- [Table of synthesis results for key parameter combinations]

## Test Coverage
- [ ] Functional correctness (RTL sim vs. C reference)
- [ ] Timing closure at [frequency] MHz
- [ ] Gate-level simulation (vs. RTL golden)

## Known Issues & Limitations
- None currently.

## References
- Paper: doc/FalconSign (section X.Y.Z)
- C reference: software/file.c, function `Zf(...)` (lines X–Y)
