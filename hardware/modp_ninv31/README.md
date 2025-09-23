# MODP_NINV31

> [!NOTE]  
> See source code [keygen.c](/software/keygen.c#L654) at line 654-665.

```verilog
module MODP_NINV31 ( 
    // Input signals
    clk, 
    rst_n,
    in_valid,
    p,
    // Output signals
    out_valid,
    p0i
);
```

## Description

This module implement 4-stage pipelined MODP_NINV31.

## Latency

|           |     |
| :-------: | :-: |
| **CYCLE** |     |

## Performance

|            |     40nm     |
| :--------: | :----------: |
| **Period** |    2.0ns     |
| **#GATE**  |     3619     |
|  **AREA**  | 36117.672287 |

## Future Optimization

