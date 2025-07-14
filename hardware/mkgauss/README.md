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
    r1_valid,
    r2_valid,
    r1,
    r2,
    // Output signals
    val_valid,
    val
);
```

## Latency
|       | $logn=9$ | $logn=10$ |
|:------|:--------:|:---------:|
| cycle |     2    |     1     |

## Period
| 40nm  | 90nm  |       |
|:-----:|:-----:|:-----:|
| 1.7ns |       |       |

## Optimization
1. use pdt for N=512 instead of iterate 2 times with N=1024