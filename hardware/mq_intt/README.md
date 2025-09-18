# MQ_INTT

> [!NOTE]  
> See source code [vrfy.c](/software/vrfy.c#L537) at line 537-588.

```verilog
module MQ_INTT #(
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

Current INTT implement radix-2 unit in a stage. Twiddle value is implemented with LUT.

## Latency

|           |     |
| :-------: | :-: |
| **CYCLE** | 540 |

## Performance

|            |     40nm     |
| :--------: | :----------: |
| **Period** |    2.0ns     |
| **#GATE**  |     7445     |
|  **AREA**  | 74295.595067 |

## Future Optimization
