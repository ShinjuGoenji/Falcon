# ZINT_REBUILD_CRT

> [!NOTE]  
> See source code [keygen.c](/software/keygen.c#L1355) at line 1355-1416.

```verilog
module ZINT_REBUILD_CRT (
    // Main channel
    // Input signals
    clk,
    rst_n,
    in_valid,
    len_valid,
    mode,
    inf_logn,
    num,
    logn,
    xlen,
    input_ptr,
    intt_output_buffer_comb,
    // Output signals
    out_valid,
    // MODP_MONTYMUL_TOP
    modp_montymul_req,
    modp_montymul_resp,
    // RF_CRT
    is_write,
    is_read,
    CENB_comb, 
    AB_comb, 
    DB_comb,
    CENA, 
    AA, 
    QA
);
```

## Description



![](./01_RTL/zint_mod_small_unsigned.png)


## Performance

| `WORD_NUM` |   2    |   4    |  8  |
| :--------: | :----: | :----: | :-: |
| **Period** | 1.48ns | 1.55ns | ns  |
| **#GATE**  | 225975 | 299151 |     |
| **Cycle**  | 16.74M | 12.57M |     |

## Future Optimization

1. Maybe 1st round `ZINT_MOD_SMALL_UNSIGNED` can skip.
2. `PRIME` LUT instance can be merged.
