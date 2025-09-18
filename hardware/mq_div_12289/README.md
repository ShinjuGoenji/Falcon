# MQ_DIV_12289

> [!NOTE]  
> See source code [vrfy.c](/software/vrfy.c#L438) at line 438-499.

```verilog
module MQ_DIV_12289 (
    // Input signals
    clk,
    rst_n,
    in_valid,
    x_i,
    y_i,
    // Output signals
    out_valid,
    z_o
);
```

## Description

This module implement 20-stage pipelined MQ_MONTYMUL, while each MQ_MONTYMUL has 1 cycle latency.

## Latency

|           |     |
| :-------: | :-: |
| **CYCLE** | 41  |

## Performance

|            |     40nm     | 90nm |     |
| :--------: | :----------: | :--: | :-: |
| **Period** |    2.0ns     |      |     |
| **#GATE**  |     3619     |      |     |
|  **AREA**  | 36117.672287 |      |     |

## Future Optimization

1. reduce pipeline stages.
