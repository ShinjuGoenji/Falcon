# MODP_R2

> [!NOTE]  
> See source code [keygen.c](/software/keygen.c#L738) at line 738-765.

```verilog
module MODP_R2 (
    // Main channel
    // Input signals
    clk,
    rst_n,
    in_valid,
    p,
    p0i,
    // Output signals
    out_valid,
    R2,
    // MODP_MONTYMUL_TOP
    // Input signals
    out_valid_modp_montymul,
    d_modp_montymul,
    ready_modp_montymul,
    // Output signals
    in_valid_modp_montymul,
    a_modp_montymul,
    b_modp_montymul,
    p_modp_montymul,
    p0i_modp_montymul,
    isMQ_modp_montymul
);
```

## Description

This module requires MODP_MONTYMUL_TOP.

## Latency

|           |     |
| :-------: | :-: |
| **CYCLE** | 539 |

## Performance

|            |     40nm      |
| :--------: | :-----------: |
| **Period** |     2.0ns     |
| **#GATE**  |     26473     |
|  **AREA**  | 264183.890590 |

## Future Optimization

1. 
