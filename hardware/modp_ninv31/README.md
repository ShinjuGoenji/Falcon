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
| **CYCLE** |  4  |

## Performance

|            |     40nm     |
| :--------: | :----------: |
| **Period** |    2.0ns     |
| **#GATE**  |     1897     |
|  **AREA**  | 18930.315273 |

## Future Optimization

1. less pipeline stages.
