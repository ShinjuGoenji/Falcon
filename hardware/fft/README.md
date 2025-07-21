# MKGAUSS

> [!NOTE]  
> See source code [keygen.c](/software/keygen.c#L2450) at line 2450-2471.


``` verilog
module POLY_SMALL_SQNORM #(
    parameter logn = 9
)( 
    // Input signals
    clk,
    rst_n,
    ena,
    f_valid,
    f,
    // Output signals
    s_valid,
    s
);
```

## Latency
|           | $logn=9$  | $logn=10$ |
|:---:      |:---:      |:---:      |
| **CYCLE** | 2         | 1         |

## Performance
|               | 40nm          | 90nm  |       |
|:---:          |:---:          |:---:  |:---:  |
| **Period**    | 2.0ns         |       |       |
| **#GATE**     | 51            |       |       |
| **AREA**      | 508.258790    |       |       |

## Future Optimization
1. multiplier optimization