# MKGAUSS

> [!NOTE]  
> See source code [keygen.c](/software/keygen.c#L2258) at line 2258-2356.


``` verilog
module MKGAUSS #(
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
    val_valid,
    val
);
/**
 * @input   ena             Enable signal of this module.
 * @input   rng_valid       Valid signal from RNG.
 * @input   rng             Two 64-bit random numbers from random number generator.
 * @output  rng_extract     Response signal to RNG.
 * @output  val_valid       Valid signal of output val.
 * @output  val             7-bit signed output value (registered).
 */
```

## Latency
|           | $logn=9$  | $logn=10$ |
|:---:      |:---:      |:---:      |
| **CYCLE** | 2         | 1         |

## Performance
|               | 40nm          | 90nm  |       |
|:---:          |:---:          |:---:  |:---:  |
| **Period**    | 2.0ns         |       |       |
| **#GATE**     | 141           |       |       |
| **AREA**      | 1403.211592   |       |       |

## Future Optimization
1. use pdt for N=512 instead of iterate 2 times with N=1024
2. adjust bit width