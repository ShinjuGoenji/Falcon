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

1st cycle computes `z = modp_R(p)` and `z = modp_add(z, z, p)`.

The later $2\times5$ cycles computes `z = modp_montymul(z, z, p, p0i)`, where each `modp_montymul` requires 2 cycles latency.

The last cycle computes `z = (z + (p & -(z & 1))) >> 1`, and then outputs result.

## Latency

|           |     |
| :-------: | :-: |
| **CYCLE** | 13  |

## Performance

|            |     40nm     |
| :--------: | :----------: |
| **Period** |    2.0ns     |
| **#GATE**  |     2705     |
|  **AREA**  | 26996.230340 |

> [!WARNING]  
> This synthesis result use KEYGEN.v as top module where there consist 3 instances of `MODP_R2` and 2 instances of `MODP_MONTYMUL_TOP` to simulate the existence of other modules.

## Future Optimization

1. 
