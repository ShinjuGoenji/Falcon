# IFFT

> [!NOTE]  
> See source code [fft.c](/software/fft.c#L304) at line 304-449.

```verilog
module IFFT #(
    parameter FLOAT_PRECISION = 64,
    parameter logn = 8
)(
    // Input signals
    clk,
    rst_n,
    in_valid,
    fi_re, fi_im,
    s_re_1, s_im_1,
    s_re_2, s_im_2,
    s_re_3, s_im_3,
    s_re_4, s_im_4,
    s_re_5, s_im_5,
    s_re_6, s_im_6,
    s_re_7, s_im_7,
    s_re_8, s_im_8,
    // Output signals
    out_valid,
    tw_idx_1,
    tw_idx_2,
    tw_idx_3,
    tw_idx_4,
    tw_idx_5,
    tw_idx_6,
    tw_idx_7,
    tw_idx_8,
    fo_re, fo_im
);
```

## Latency

|           | radix-2 |
| :-------: | :-----: |
| **CYCLE** |   281   |

## Performance

|            |     40nm      | 90nm |     |
| :--------: | :-----------: | :--: | :-: |
| **Period** |     3.0ns     |      |     |
| **#GATE**  |     77118     |      |     |
|  **AREA**  | 769575.700247 |      |     |

## Future Optimization

1. apply LUT to twiddle value.
2. optimize critical path
3. adopt radix- $2^2$ or radix- $2^3$
4. Self written fpu instead of designware.
5. combine with fft
