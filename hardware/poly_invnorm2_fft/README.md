# POLY_INVNORM2_FFT

> [!NOTE]  
> See source code [fft.c](/software/fft.c#L806) at line 806-862.

```verilog
module POLY_INVNORM2_FFT #(
    parameter FLOAT_PRECISION = 64
)(
    // Input signals
    clk,
    rst_n,
    in_valid,
    a_re, a_im,
    b_re, b_im,
    // Output signals
    out_valid,
    d
);
```

## Description

This module use designware DW_lp_piped_fp_div with `stage` parameter currently set to 10.

## Latency

|           |           |
| :-------: | :-------: |
| **CYCLE** | `stage`+2 |

## Performance

|            | 40nm |
| :--------: | :--: |
| **Period** |      |
| **#GATE**  |      |
|  **AREA**  |      |

## Future Optimization

1. find out what's wrong with DW_lp_piped_fp_div when I intend to set cycle time to 2.0 but always fail at 02_SYN no matter how many pipeline stages I set.
