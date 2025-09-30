# MODP_MONTYMUL_TOP

```verilog
module MODP_MONTYMUL_TOP #(
    parameter BUS_WIDTH = 10,
    parameter MUL_NUM = 2
)(
    // Input signals
    clk,
    rst_n,
    in_valid_bus,
    a_bus,
    b_bus,
    p_bus,
    p0i_bus,
    isMQ_bus,
    // Output signals
    out_valid_bus,
    d_bus,
    ready_bus
);
```

## Description

Top module of MODP_MONTYMUL, which number of instances is parameterized by `MUL_NUM`. The number of master modules is also parameterized by `BUS_WIDTH`. 
Each MODP_MONTYMUL is a implemented with 2-stage pipeline.

## Performance

|            |     40nm     |
| :--------: | :----------: |
| `MUL_NUM`  |      2       |
| **Period** |    2.0ns     |
| **#GATE**  |     4345     |
|  **AREA**  | 43364.386135 |

## Future Optimization
