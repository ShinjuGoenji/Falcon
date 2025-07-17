 
****************************************
Report : resources
Design : POLY_SMALL_SQNORM
Version: T-2022.03
Date   : Thu Jul 17 23:30:47 2025
****************************************


Resource Report for this hierarchy in file ../01_RTL/POLY_SMALL_SQNORM.v
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| mult_x_1       | DW_mult_tc     | a_width=7  | mult_46 (POLY_SMALL_SQNORM.v:46) |
           |                | b_width=7  |                            |
| add_x_2        | DW01_add       | width=21   | add_51 (POLY_SMALL_SQNORM.v:51) |
=============================================================================


Datapath Extraction Report

Information: Operator associated with resources 'mult_46 (POLY_SMALL_SQNORM.v:46)' in design 'POLY_SMALL_SQNORM' breaks the datapath extraction because there is leakage due to driver(signed)/load(unsigned) sign mismatch to operator of resources 'add_51 (POLY_SMALL_SQNORM.v:51)'.  (HDL-120)


Implementation Report
===============================================================================
|                    |                  | Current            | Set            |
| Cell               | Module           | Implementation     | Implementation |
===============================================================================
| mult_x_1           | DW_mult_tc       | pparch (speed)     |                |
|                    |                  | mult_arch: and     |                |
| add_x_2            | DW01_add         | pparch (speed)     |                |
===============================================================================

1
