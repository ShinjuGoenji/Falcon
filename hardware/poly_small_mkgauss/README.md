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
/**
 * @input   ena             Enable signal of this module.
 * @input   rng_valid       Valid signal from RNG.
 * @input   rng             Two 64-bit random numbers from random number generator.
 * @output  rng_extract     Response signal to RNG.
 * @output  f_valid         Valid signal of output f.
 * @output  f               8-bit signed output value (registered).
 */
```

## Latency
|           | $logn=9$                          | $logn=10$ |
|:---:      |:---:                              |:---:      |
| **CYCLE** | 1024 (512 * latency of *MKGAUSS*) | -         |

## Performance
|               | 40nm          | 90nm  |       |
|:---:          |:---:          |:---:  |:---:  |
| **Period**    | 2.0ns         |       |       |
| **#GATE**     | 149           |       |       |
| **AREA**      | 1487.354383   |       |       |

## Future Optimization
1. improve MKGAUSS latency to 1 cycle