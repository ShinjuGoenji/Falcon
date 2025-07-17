# POLY_SMALL_MKGAUSS

> [!NOTE]  
> See source code [keygen.c](/software/keygen.c#L4090) at line 4090-4132.


``` verilog
module POLY_SMALL_MKGAUSS #(
    parameter [3:0] logn = 9
)( 
    // Input signals
    clk,
    rst_n,
    ena,
    rng_valid,
    rng,
    // Output signals
    rng_extract,
    f_valid,
    f
);
```

## Latency
|           | $logn=9$                          | $logn=10$ |
|:---:      |:---:                              |:---:      |
| **CYCLE** | 1024 (512 * latency of *MKGAUSS*) | -         |

## Performance
|               | 40nm          | 90nm  |       |
|:---:          |:---:          |:---:  |:---:  |
| **Period**    | 2.0ns         |       |       |
| **#GATE**     | 2895          |       |       |
| **#AREA**     | 28886.834592  |       |       |

## Future Optimization
1. improve MKGAUSS latency to 1 cycle