# MODP_NTT2

> [!NOTE]  
> See source code [keygen.c](/software/keygen.c#L983) at line 983-1021.

```verilog
module MODP_NTT2 #(
    parameter MAX_9
)(
    // Input signals
    clk,
    rst_n,
    in_valid,
    a_i,
    logn,
    p,
    p0i,
    isMQ,
    s_bus,
    // Output signals
    out_valid,
    a_o,
    tw_idx_bus
);
```

## Description

Current NTT implement radix-2 unit in a stage, with logn as argument. Twiddle value is fetched from outside of the module.

## Latency

|  `logn`   | `9` | `8` | `6` | `5` | `4` | `3` | `2` | `1` |
| :-------: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: |
| **CYCLE** | 539 | 280 | 82  | 47  | 28  | 17  | 10  |  5  |

## Performance

|            |     40nm      |
| :--------: | :-----------: |
| **Period** |     2.0ns     |
| **#GATE**  |     26473     |
|  **AREA**  | 264183.890590 |

## Future Optimization

1. stall is not working
