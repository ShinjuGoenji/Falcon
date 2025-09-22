# MQ_NTT

> [!NOTE]  
> See source code [vrfy.c](/software/vrfy.c#L504) at line 504-532.

```verilog
module MQ_NTT #(
    parameter logn = 9
)(
    // Input signals
    clk,
    rst_n,
    in_valid,
    a_i,
    // Output signals
    out_valid,
    a_o
);
```

## Description

Current NTT implement radix-2 unit in a stage. Twiddle value is implemented with LUT.

## Latency

|           |     |
| :-------: | :-: |
| **CYCLE** | 539 |

## Performance

|            |     40nm     | 90nm |     |
| :--------: | :----------: | :--: | :-: |
| **Period** |    2.1ns     |      |     |
| **#GATE**  |     7362     |      |     |
|  **AREA**  | 73471.630647 |      |     |

## Future Optimization
