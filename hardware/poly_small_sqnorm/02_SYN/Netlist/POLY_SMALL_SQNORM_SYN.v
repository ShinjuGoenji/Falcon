/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : T-2022.03
// Date      : Thu Jul 17 23:30:47 2025
/////////////////////////////////////////////////////////////


module POLY_SMALL_SQNORM ( clk, rst_n, ena, f_valid, f, s_valid, s );
  input [6:0] f;
  output [20:0] s;
  input clk, rst_n, ena, f_valid;
  output s_valid;
  wire   n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18,
         n19, n20, n21, n22, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33,
         n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47,
         n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61,
         n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75,
         n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86, n87, n88, n89,
         n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100, n101, n102,
         n103, n104, n105, n106, n107, n108, n109, n110, n111, n112, n113,
         n114, n115, n116, n117, n118, n119, n120, n121, n122, n123, n124,
         n125, n126, n127, n128, n129, n130, n131, n132, n133, n134, n135,
         n136, n137, n138, n139, n140, n141, n142, n143, n144, n145, n146,
         n147, n148, n149, n150, n151, n152, n153, n154, n155, n156, n157,
         n158, n159, n160, n161, n162, n163, n164, n165, n166, n167, n168,
         n169, n170, n171, n172, n173, n174, n175, n176, n177, n178, n179,
         n180, n181, n182, n183, n184, n185, n186, n187, n188, n189, n190,
         n191, n192, n193, n194, n195, n196, n197, n198, n199, n200, n201,
         n202, n203, n204, n205, n206, n207, n208, n209, n210, n211, n212,
         n213, n214, n215, n216, n217, n218, n219, n220, n221, n222, n223,
         n224, n225, n226, n227, n228, n229, n230, n231, n232, n233, n234,
         n235, n236, n237, n238, n239, n240, n241, n242, n243, n244, n245,
         n246, n247, n248, n249, n250, n251, n252, n253, n254, n255, n256,
         n257, n258, n259, n260, n261, n262, n263, n264, n265, n266, n267,
         n268, n269, n270, n271, n272, n273, n274, n275, n276, n277, n278,
         n279, n280, n281, n282, n283, n284, n285, n286, n287, n288, n289,
         n290, n291, n292, n293, n294, n295, n296, n297, n298, n299, n300,
         n301, n302, n303, n304, n305, n306, n307, n308, n309, n310, n311,
         n312, n313, n314, n315, n316, n317, n318, n319, n320, n321, n322,
         n323;

  DFFRPQ_X2M_A9TH s_reg_20_ ( .D(n322), .CK(clk), .R(n323), .Q(s[20]) );
  DFFRPQ_X2M_A9TH s_valid_reg ( .D(n318), .CK(clk), .R(n323), .Q(s_valid) );
  DFFRPQ_X2M_A9TH s_reg_11_ ( .D(n11), .CK(clk), .R(n323), .Q(s[11]) );
  DFFRPQ_X2M_A9TH s_reg_12_ ( .D(n10), .CK(clk), .R(n323), .Q(s[12]) );
  DFFRPQ_X2M_A9TH s_reg_19_ ( .D(n321), .CK(clk), .R(n323), .Q(s[19]) );
  DFFRPQ_X2M_A9TH s_reg_4_ ( .D(n18), .CK(clk), .R(n323), .Q(s[4]) );
  DFFRPQ_X2M_A9TH s_reg_14_ ( .D(n8), .CK(clk), .R(n323), .Q(s[14]) );
  DFFRPQ_X2M_A9TH s_reg_13_ ( .D(n9), .CK(clk), .R(n323), .Q(s[13]) );
  DFFRPQ_X2M_A9TH s_reg_6_ ( .D(n16), .CK(clk), .R(n323), .Q(s[6]) );
  DFFRPQ_X2M_A9TH s_reg_15_ ( .D(n7), .CK(clk), .R(n323), .Q(s[15]) );
  DFFRPQ_X2M_A9TH s_reg_17_ ( .D(n5), .CK(clk), .R(n323), .Q(s[17]) );
  DFFRPQ_X2M_A9TH s_reg_16_ ( .D(n6), .CK(clk), .R(n323), .Q(s[16]) );
  DFFRPQ_X2M_A9TH s_reg_8_ ( .D(n14), .CK(clk), .R(n323), .Q(s[8]) );
  DFFRPQ_X2M_A9TH s_reg_9_ ( .D(n13), .CK(clk), .R(n323), .Q(s[9]) );
  DFFRPQ_X2M_A9TH s_reg_10_ ( .D(n12), .CK(clk), .R(n323), .Q(s[10]) );
  DFFRPQ_X2M_A9TH s_reg_7_ ( .D(n15), .CK(clk), .R(n323), .Q(s[7]) );
  DFFRPQ_X2M_A9TH s_reg_3_ ( .D(n19), .CK(clk), .R(n323), .Q(s[3]) );
  DFFRPQ_X2M_A9TH s_reg_1_ ( .D(n21), .CK(clk), .R(n323), .Q(s[1]) );
  DFFRPQ_X2M_A9TH s_reg_2_ ( .D(n20), .CK(clk), .R(n323), .Q(s[2]) );
  DFFRPQ_X2M_A9TH s_reg_0_ ( .D(n22), .CK(clk), .R(n323), .Q(s[0]) );
  DFFRPQN_X0P5M_A9TH s_reg_18_ ( .D(n4), .CK(clk), .R(n323), .QN(n319) );
  DFFRPQN_X0P5M_A9TH s_reg_5_ ( .D(n17), .CK(clk), .R(n323), .QN(n320) );
  OAI22_X1M_A9TR U28 ( .A0(n247), .A1(n311), .B0(n246), .B1(n309), .Y(n14) );
  XOR2_X0P5M_A9TH U29 ( .A(n218), .B(n217), .Y(n219) );
  OA21A1OI2_X1M_A9TL U30 ( .A0(n277), .A1(n275), .B0(n274), .C0(n273), .Y(n276) );
  NAND2XB_X0P7M_A9TH U31 ( .BN(n252), .A(n251), .Y(n245) );
  OAI21_X0P7M_A9TR U32 ( .A0(n252), .A1(n305), .B0(n251), .Y(n253) );
  INV_X2M_A9TR U33 ( .A(n318), .Y(n309) );
  NOR2_X2M_A9TL U34 ( .A(n37), .B(n36), .Y(n318) );
  INV_X1M_A9TH U35 ( .A(ena), .Y(n37) );
  INV_X0P6B_A9TH U36 ( .A(f_valid), .Y(n36) );
  NAND3_X1A_A9TR U37 ( .A(n159), .B(n147), .C(n161), .Y(n271) );
  OAI21_X3M_A9TL U38 ( .A0(n68), .A1(n76), .B0(n75), .Y(n77) );
  INV_X2M_A9TL U39 ( .A(n127), .Y(n192) );
  NOR2_X1A_A9TL U40 ( .A(n143), .B(s[8]), .Y(n252) );
  NAND2_X1A_A9TL U41 ( .A(n113), .B(s[6]), .Y(n233) );
  NAND2XB_X1M_A9TH U42 ( .BN(n169), .A(n289), .Y(n171) );
  NOR2_X1A_A9TH U43 ( .A(n74), .B(f[5]), .Y(n159) );
  NOR2_X2B_A9TL U44 ( .A(n132), .B(n138), .Y(n137) );
  INV_X0P6B_A9TH U45 ( .A(f[6]), .Y(n74) );
  AND2_X1B_A9TL U46 ( .A(n56), .B(n62), .Y(n139) );
  NOR2_X1A_A9TL U47 ( .A(n108), .B(n107), .Y(n109) );
  NOR2_X2M_A9TH U48 ( .A(n87), .B(s[3]), .Y(n209) );
  OA21_X1M_A9TL U49 ( .A0(n61), .A1(n60), .B0(n59), .Y(n62) );
  NAND2_X2B_A9TR U50 ( .A(f[3]), .B(f[0]), .Y(n78) );
  NOR2_X1M_A9TH U51 ( .A(n26), .B(n27), .Y(n70) );
  NAND2_X3M_A9TL U52 ( .A(f[1]), .B(f[0]), .Y(n85) );
  XNOR2_X1M_A9TL U53 ( .A(n53), .B(n52), .Y(n55) );
  OAI21_X1P4M_A9TL U54 ( .A0(n52), .A1(n53), .B0(n54), .Y(n40) );
  NOR2_X1A_A9TL U55 ( .A(n82), .B(n27), .Y(n49) );
  OAI21_X1P4M_A9TL U56 ( .A0(f[3]), .A1(f[1]), .B0(f[4]), .Y(n46) );
  NAND2_X1A_A9TL U57 ( .A(f[4]), .B(f[6]), .Y(n119) );
  INV_X2P5B_A9TL U58 ( .A(f[1]), .Y(n45) );
  NAND2_X1A_A9TL U59 ( .A(f[2]), .B(f[6]), .Y(n71) );
  NOR2_X1A_A9TL U60 ( .A(n102), .B(n101), .Y(n103) );
  OAI211_X1P4M_A9TR U61 ( .A0(n151), .A1(n124), .B0(n196), .C0(n123), .Y(n146)
         );
  NAND2XB_X2M_A9TH U62 ( .BN(s[2]), .A(n83), .Y(n203) );
  NAND2_X0P5A_A9TH U63 ( .A(n222), .B(n221), .Y(n227) );
  OR2_X3M_A9TH U64 ( .A(n271), .B(n270), .Y(n304) );
  INV_X1P2B_A9TH U65 ( .A(n320), .Y(s[5]) );
  INV_X1P2B_A9TH U66 ( .A(n319), .Y(s[18]) );
  NAND3_X1A_A9TL U67 ( .A(n142), .B(n318), .C(s[13]), .Y(n168) );
  INV_X1M_A9TR U68 ( .A(n301), .Y(n272) );
  NAND2_X1A_A9TL U69 ( .A(n271), .B(n77), .Y(n264) );
  INV_X3M_A9TL U70 ( .A(n305), .Y(n244) );
  XNOR2_X0P7M_A9TL U71 ( .A(n229), .B(n235), .Y(n230) );
  OAI22_X1M_A9TR U72 ( .A0(n215), .A1(n311), .B0(n214), .B1(n309), .Y(n19) );
  NOR2_X1A_A9TL U73 ( .A(n225), .B(n224), .Y(n226) );
  INV_X2M_A9TL U74 ( .A(n140), .Y(n64) );
  NAND3_X1A_A9TL U75 ( .A(n150), .B(n151), .C(n148), .Y(n123) );
  OAI22_X1M_A9TR U76 ( .A0(n202), .A1(n311), .B0(n201), .B1(n309), .Y(n21) );
  NOR2_X2M_A9TL U77 ( .A(n106), .B(n105), .Y(n110) );
  INV_X1M_A9TL U78 ( .A(n100), .Y(n104) );
  INV_X1B_A9TR U79 ( .A(n180), .Y(n177) );
  INV_X1P7M_A9TR U80 ( .A(s[19]), .Y(n182) );
  XOR2_X0P7M_A9TL U81 ( .A(n92), .B(n91), .Y(n93) );
  NAND2B_X8M_A9TR U82 ( .AN(f_valid), .B(ena), .Y(n311) );
  NAND3_X1A_A9TL U83 ( .A(n279), .B(s[15]), .C(n318), .Y(n288) );
  INV_X1M_A9TR U84 ( .A(n165), .Y(n142) );
  NAND2XB_X1M_A9TL U85 ( .BN(n192), .A(n191), .Y(n193) );
  INV_X1M_A9TR U86 ( .A(n77), .Y(n162) );
  NAND3BB_X1M_A9TL U87 ( .AN(n153), .BN(n154), .C(n68), .Y(n156) );
  INV_X1M_A9TL U88 ( .A(n187), .Y(n188) );
  AOI31_X3M_A9TL U89 ( .A0(n235), .A1(n236), .A2(n233), .B0(n116), .Y(n267) );
  INV_X1P7M_A9TL U90 ( .A(n131), .Y(n132) );
  NAND3BB_X1M_A9TL U91 ( .AN(s[7]), .BN(s[6]), .C(n114), .Y(n115) );
  INV_X1M_A9TL U92 ( .A(n114), .Y(n113) );
  NAND2_X1A_A9TR U93 ( .A(n216), .B(n221), .Y(n218) );
  INV_X3M_A9TL U94 ( .A(n148), .Y(n153) );
  AO21B_X2M_A9TL U95 ( .A0(n53), .A1(n52), .B0N(n40), .Y(n65) );
  INV_X1M_A9TL U96 ( .A(n151), .Y(n117) );
  XOR2_X0P7M_A9TL U97 ( .A(n94), .B(n93), .Y(n97) );
  NAND2XB_X1M_A9TR U98 ( .BN(n209), .A(n208), .Y(n213) );
  INV_X2M_A9TR U99 ( .A(n150), .Y(n122) );
  INV_X1M_A9TR U100 ( .A(n108), .Y(n106) );
  AND2_X1M_A9TR U101 ( .A(s[18]), .B(s[19]), .Y(n176) );
  NOR2_X2M_A9TL U102 ( .A(n39), .B(f[4]), .Y(n29) );
  NAND2_X1A_A9TL U103 ( .A(n58), .B(n88), .Y(n59) );
  NAND2_X1A_A9TL U104 ( .A(n88), .B(f[0]), .Y(n90) );
  NOR2_X2A_A9TL U105 ( .A(n88), .B(n26), .Y(n108) );
  NOR2_X2A_A9TL U106 ( .A(n24), .B(n27), .Y(n73) );
  OR2_X3M_A9TL U107 ( .A(n25), .B(n24), .Y(n42) );
  NAND2_X3M_A9TL U108 ( .A(f[2]), .B(f[1]), .Y(n92) );
  NOR2_X1A_A9TL U109 ( .A(n250), .B(n249), .Y(n254) );
  XNOR2_X0P7M_A9TL U110 ( .A(n241), .B(n240), .Y(n242) );
  INV_X4M_A9TL U111 ( .A(n267), .Y(n305) );
  INV_X3M_A9TL U112 ( .A(n147), .Y(n68) );
  NOR2_X1A_A9TR U113 ( .A(n237), .B(s[7]), .Y(n238) );
  INV_X1M_A9TL U114 ( .A(n154), .Y(n128) );
  AND2_X1M_A9TL U115 ( .A(n160), .B(s[12]), .Y(n161) );
  OAI22_X1M_A9TR U116 ( .A0(n207), .A1(n311), .B0(n206), .B1(n309), .Y(n20) );
  INV_X1M_A9TL U117 ( .A(n149), .Y(n129) );
  OAI22_X1M_A9TR U118 ( .A0(n199), .A1(n311), .B0(n198), .B1(n309), .Y(n22) );
  NAND2_X1A_A9TL U119 ( .A(n200), .B(s[1]), .Y(n204) );
  OAI2XB1_X2M_A9TL U120 ( .A1N(n38), .A0(n29), .B0(n28), .Y(n69) );
  XOR2_X1P4M_A9TL U121 ( .A(n44), .B(n57), .Y(n51) );
  NAND2_X2M_A9TL U122 ( .A(n42), .B(n43), .Y(n53) );
  INV_X1M_A9TR U123 ( .A(s[12]), .Y(n75) );
  INV_X1M_A9TR U124 ( .A(s[13]), .Y(n270) );
  NOR2_X4A_A9TL U125 ( .A(n26), .B(n24), .Y(n39) );
  NOR2_X3A_A9TL U126 ( .A(n25), .B(n27), .Y(n38) );
  NAND2_X2M_A9TL U127 ( .A(n92), .B(f[2]), .Y(n79) );
  INV_X6M_A9TL U128 ( .A(f[0]), .Y(n82) );
  OAI22_X1M_A9TL U129 ( .A0(n180), .A1(n311), .B0(n179), .B1(n309), .Y(n322)
         );
  OA21A1OI2_X1P4M_A9TL U130 ( .A0(n294), .A1(n297), .B0(n293), .C0(n292), .Y(
        n295) );
  OAI21_X1P4M_A9TL U131 ( .A0(n168), .A1(n167), .B0(n166), .Y(n9) );
  INV_X1M_A9TR U132 ( .A(n275), .Y(n269) );
  INV_X1M_A9TR U133 ( .A(n285), .Y(n279) );
  XOR2_X1M_A9TL U134 ( .A(n265), .B(n264), .Y(n266) );
  AOI21_X2M_A9TL U135 ( .A0(n34), .A1(n301), .B0(n33), .Y(n174) );
  XNOR2_X0P7M_A9TL U136 ( .A(n254), .B(n253), .Y(n255) );
  NOR2_X4A_A9TL U137 ( .A(n192), .B(n259), .Y(n170) );
  NAND2_X1A_A9TR U138 ( .A(n267), .B(n301), .Y(n268) );
  INV_X1M_A9TR U139 ( .A(n248), .Y(n250) );
  AND2_X4M_A9TL U140 ( .A(n77), .B(s[13]), .Y(n301) );
  OAI22_X1M_A9TL U141 ( .A0(n243), .A1(n311), .B0(n242), .B1(n309), .Y(n15) );
  OAI22_X1M_A9TL U142 ( .A0(n231), .A1(n311), .B0(n230), .B1(n309), .Y(n16) );
  OAI22_X1M_A9TL U143 ( .A0(n320), .A1(n311), .B0(n228), .B1(n309), .Y(n17) );
  NAND2_X1A_A9TR U144 ( .A(n232), .B(n233), .Y(n229) );
  XNOR2_X0P7M_A9TL U145 ( .A(n227), .B(n226), .Y(n228) );
  INV_X1M_A9TR U146 ( .A(n236), .Y(n239) );
  AOI21_X2M_A9TL U147 ( .A0(n138), .A1(n133), .B0(n135), .Y(n67) );
  OAI22_X1M_A9TL U148 ( .A0(n220), .A1(n311), .B0(n219), .B1(n309), .Y(n18) );
  NAND2XB_X2M_A9TL U149 ( .BN(n66), .A(n41), .Y(n133) );
  AND2_X1M_A9TR U150 ( .A(n129), .B(n148), .Y(n121) );
  NAND2_X2M_A9TL U151 ( .A(n64), .B(n63), .Y(n131) );
  NAND2_X1A_A9TL U152 ( .A(n160), .B(n159), .Y(n76) );
  NOR2_X2A_A9TL U153 ( .A(n149), .B(n120), .Y(n160) );
  NOR2_X2A_A9TL U154 ( .A(n151), .B(n150), .Y(n149) );
  NAND2XB_X1M_A9TL U155 ( .BN(n204), .A(n203), .Y(n211) );
  NOR2_X2A_A9TL U156 ( .A(n51), .B(n50), .Y(n102) );
  NAND2XB_X1M_A9TR U157 ( .BN(s[4]), .A(n95), .Y(n216) );
  NAND2B_X3M_A9TL U158 ( .AN(n120), .B(n35), .Y(n148) );
  AND2_X2M_A9TL U159 ( .A(n51), .B(n50), .Y(n101) );
  INV_X1M_A9TR U160 ( .A(n57), .Y(n61) );
  XOR2_X1P4M_A9TL U161 ( .A(n30), .B(n39), .Y(n54) );
  NOR2_X2A_A9TL U162 ( .A(n119), .B(n118), .Y(n120) );
  NOR2_X1A_A9TL U163 ( .A(n311), .B(n310), .Y(n312) );
  NOR2_X1A_A9TL U164 ( .A(n311), .B(n282), .Y(n283) );
  NOR2_X1A_A9TL U165 ( .A(n311), .B(n298), .Y(n292) );
  NOR2_X1A_A9TL U166 ( .A(n311), .B(n270), .Y(n163) );
  NOR2_X1A_A9TL U167 ( .A(n311), .B(n281), .Y(n273) );
  NAND2_X2M_A9TL U168 ( .A(n39), .B(f[4]), .Y(n28) );
  NOR2_X2A_A9TL U169 ( .A(n89), .B(n91), .Y(n47) );
  OAI22_X3M_A9TL U170 ( .A0(n25), .A1(n89), .B0(n86), .B1(n46), .Y(n111) );
  NAND2_X4M_A9TL U171 ( .A(f[2]), .B(f[0]), .Y(n86) );
  NAND2_X4M_A9TL U172 ( .A(f[1]), .B(f[5]), .Y(n43) );
  NAND2_X3M_A9TL U173 ( .A(f[1]), .B(f[6]), .Y(n52) );
  INV_X16M_A9TL U174 ( .A(f[4]), .Y(n24) );
  OAI21_X1P4M_A9TL U175 ( .A0(n297), .A1(n296), .B0(n295), .Y(n6) );
  XOR2_X1P4M_A9TL U176 ( .A(n178), .B(n177), .Y(n179) );
  XNOR2_X1P4M_A9TL U177 ( .A(n31), .B(n182), .Y(n181) );
  NAND3_X1A_A9TR U178 ( .A(n291), .B(s[16]), .C(n318), .Y(n296) );
  NAND2_X2M_A9TL U179 ( .A(n176), .B(n183), .Y(n178) );
  NAND3_X1A_A9TR U180 ( .A(n269), .B(s[14]), .C(n318), .Y(n278) );
  NAND3_X1A_A9TR U181 ( .A(n308), .B(s[17]), .C(n318), .Y(n316) );
  OAI21_X4M_A9TL U182 ( .A0(n175), .A1(n257), .B0(n174), .Y(n183) );
  OAI22_X1M_A9TL U183 ( .A0(n196), .A1(n311), .B0(n195), .B1(n309), .Y(n11) );
  OA21A1OI2_X1P4M_A9TL U184 ( .A0(n314), .A1(n317), .B0(n313), .C0(n312), .Y(
        n315) );
  OA21A1OI2_X1P4M_A9TL U185 ( .A0(n287), .A1(n285), .B0(n284), .C0(n283), .Y(
        n286) );
  OAI22_X1M_A9TL U186 ( .A0(n256), .A1(n311), .B0(n255), .B1(n309), .Y(n13) );
  OAI21_X2M_A9TL U187 ( .A0(n302), .A1(n272), .B0(n304), .Y(n277) );
  NOR2_X2A_A9TL U188 ( .A(n307), .B(n305), .Y(n32) );
  NOR3BB_X2M_A9TL U189 ( .AN(n77), .BN(n244), .C(n307), .Y(n165) );
  NOR3_X2A_A9TL U190 ( .A(n307), .B(n306), .C(n305), .Y(n314) );
  OAI21_X1P4M_A9TL U191 ( .A0(n307), .A1(n305), .B0(n302), .Y(n265) );
  OAI21_X2M_A9TL U192 ( .A0(n302), .A1(n162), .B0(n271), .Y(n167) );
  OAI22_X2M_A9TL U193 ( .A0(n304), .A1(n299), .B0(n302), .B1(n290), .Y(n297)
         );
  NAND2_X4M_A9TL U194 ( .A(n170), .B(n186), .Y(n307) );
  AOI21_X4M_A9TL U195 ( .A0(n185), .A1(n170), .B0(n172), .Y(n302) );
  XOR2_X0P7M_A9TL U196 ( .A(n245), .B(n244), .Y(n246) );
  AO1B2_X2M_A9TL U197 ( .B0(n68), .B1(n145), .A0N(n126), .Y(n127) );
  NOR3_X2A_A9TL U198 ( .A(n271), .B(n270), .C(n171), .Y(n33) );
  NAND2_X2M_A9TL U199 ( .A(n144), .B(s[9]), .Y(n248) );
  XNOR2_X2M_A9TL U200 ( .A(n137), .B(n136), .Y(n144) );
  NOR2_X2M_A9TL U201 ( .A(n135), .B(n134), .Y(n136) );
  NOR2_X1A_A9TL U202 ( .A(n239), .B(n238), .Y(n240) );
  AOI21_X1M_A9TL U203 ( .A0(n154), .A1(n153), .B0(n152), .Y(n155) );
  NOR2_X2A_A9TL U204 ( .A(n139), .B(n138), .Y(n141) );
  NOR2_X1A_A9TL U205 ( .A(n154), .B(n148), .Y(n145) );
  NAND2_X1A_A9TL U206 ( .A(n122), .B(n153), .Y(n124) );
  AND2_X2M_A9TL U207 ( .A(n66), .B(n65), .Y(n135) );
  NOR2_X2A_A9TL U208 ( .A(n110), .B(n109), .Y(n112) );
  NAND2_X2B_A9TR U209 ( .A(n96), .B(s[4]), .Y(n221) );
  OA1B2_X3M_A9TL U210 ( .B0(n102), .B1(n100), .A0N(n101), .Y(n140) );
  OAI21_X1M_A9TR U211 ( .A0(f[0]), .A1(s[0]), .B0(n197), .Y(n198) );
  XOR2_X2M_A9TL U212 ( .A(n55), .B(n54), .Y(n56) );
  INV_X1M_A9TR U213 ( .A(n95), .Y(n96) );
  XNOR2_X0P5M_A9TR U214 ( .A(n200), .B(s[1]), .Y(n201) );
  XOR2_X1P4M_A9TL U215 ( .A(n81), .B(n80), .Y(n95) );
  NOR2_X1A_A9TR U216 ( .A(s[13]), .B(n309), .Y(n164) );
  OAI21_X3M_A9TL U217 ( .A0(n108), .A1(n111), .B0(n107), .Y(n100) );
  NOR2_X1A_A9TR U218 ( .A(n309), .B(s[16]), .Y(n293) );
  NOR2_X1A_A9TR U219 ( .A(n309), .B(s[17]), .Y(n313) );
  INV_X2M_A9TR U220 ( .A(n107), .Y(n105) );
  NOR2_X1A_A9TR U221 ( .A(n309), .B(s[15]), .Y(n284) );
  NOR2_X1A_A9TR U222 ( .A(n309), .B(s[14]), .Y(n274) );
  XOR2_X3M_A9TL U223 ( .A(n38), .B(f[4]), .Y(n30) );
  NOR2_X1A_A9TL U224 ( .A(n88), .B(n58), .Y(n60) );
  AND2_X2B_A9TH U225 ( .A(s[14]), .B(s[15]), .Y(n289) );
  INV_X1M_A9TR U226 ( .A(s[0]), .Y(n199) );
  XOR2_X1P4M_A9TL U227 ( .A(n86), .B(n85), .Y(n87) );
  NAND2_X2M_A9TL U228 ( .A(n85), .B(f[1]), .Y(n83) );
  NOR2_X2A_A9TL U229 ( .A(n45), .B(n24), .Y(n48) );
  NAND2_X6M_A9TL U230 ( .A(f[6]), .B(f[0]), .Y(n58) );
  NAND2_X6M_A9TL U231 ( .A(f[0]), .B(f[4]), .Y(n91) );
  NAND2_X6M_A9TL U232 ( .A(f[3]), .B(f[1]), .Y(n89) );
  INV_X16M_A9TL U233 ( .A(f[2]), .Y(n25) );
  INV_X16M_A9TL U234 ( .A(f[3]), .Y(n26) );
  INV_X16M_A9TL U235 ( .A(f[5]), .Y(n27) );
  OAI22_X2M_A9TL U236 ( .A0(n182), .A1(n311), .B0(n181), .B1(n309), .Y(n321)
         );
  OAI22_X2M_A9TL U237 ( .A0(n319), .A1(n311), .B0(n184), .B1(n309), .Y(n4) );
  OAI21_X1P4M_A9TL U238 ( .A0(n288), .A1(n287), .B0(n286), .Y(n7) );
  NAND2_X2M_A9TL U239 ( .A(s[18]), .B(n183), .Y(n31) );
  OAI21_X1P4M_A9TL U240 ( .A0(n317), .A1(n316), .B0(n315), .Y(n5) );
  OAI21_X1P4M_A9TL U241 ( .A0(n278), .A1(n277), .B0(n276), .Y(n8) );
  INV_X1M_A9TL U242 ( .A(n291), .Y(n294) );
  OAI22_X1M_A9TL U243 ( .A0(n75), .A1(n311), .B0(n266), .B1(n309), .Y(n10) );
  NAND2XB_X2M_A9TL U244 ( .BN(n290), .A(n32), .Y(n291) );
  INV_X1M_A9TL U245 ( .A(n314), .Y(n308) );
  OAI22_X1M_A9TL U246 ( .A0(n263), .A1(n311), .B0(n262), .B1(n309), .Y(n12) );
  XOR2_X1M_A9TL U247 ( .A(n194), .B(n193), .Y(n195) );
  XOR2_X0P7M_A9TL U248 ( .A(n261), .B(n260), .Y(n262) );
  OAI22_X2M_A9TR U249 ( .A0(n304), .A1(n281), .B0(n302), .B1(n280), .Y(n287)
         );
  OAI22_X2M_A9TR U250 ( .A0(n304), .A1(n303), .B0(n302), .B1(n306), .Y(n317)
         );
  NOR2_X2A_A9TL U251 ( .A(n307), .B(n268), .Y(n275) );
  INV_X1M_A9TL U252 ( .A(n257), .Y(n261) );
  AO21A1AI2_X1M_A9TL U253 ( .A0(n190), .A1(n189), .B0(n259), .C0(n258), .Y(
        n194) );
  AND2_X2B_A9TL U254 ( .A(n173), .B(n172), .Y(n34) );
  NAND2XB_X1M_A9TL U255 ( .BN(n281), .A(n301), .Y(n280) );
  NAND2_X1A_A9TL U256 ( .A(n244), .B(n186), .Y(n189) );
  NAND2_X1A_A9TL U257 ( .A(n301), .B(n300), .Y(n306) );
  NAND2XB_X1M_A9TL U258 ( .BN(n299), .A(n301), .Y(n290) );
  AOI21_X3M_A9TL U259 ( .A0(n186), .A1(n267), .B0(n185), .Y(n257) );
  NAND2XB_X1M_A9TL U260 ( .BN(n259), .A(n258), .Y(n260) );
  INV_X1M_A9TL U261 ( .A(n185), .Y(n190) );
  OAI2XB1_X3M_A9TL U262 ( .A1N(n187), .A0(n158), .B0(n191), .Y(n172) );
  NAND2XB_X1M_A9TL U263 ( .BN(n188), .A(s[10]), .Y(n258) );
  OAI21_X4M_A9TL U264 ( .A0(n249), .A1(n251), .B0(n248), .Y(n185) );
  NOR2_X3A_A9TL U265 ( .A(n144), .B(s[9]), .Y(n249) );
  AOI21B_X3M_A9TL U266 ( .A0(n147), .A1(n121), .B0N(n125), .Y(n126) );
  NAND3BB_X1M_A9TL U267 ( .AN(n149), .BN(n148), .C(n147), .Y(n157) );
  XNOR2_X3M_A9TL U268 ( .A(n147), .B(n130), .Y(n187) );
  OAI21_X1M_A9TL U269 ( .A0(n235), .A1(n234), .B0(n233), .Y(n241) );
  OAI2XB1_X6M_A9TL U270 ( .A1N(n133), .A0(n131), .B0(n67), .Y(n147) );
  NAND2_X1A_A9TL U271 ( .A(n143), .B(s[8]), .Y(n251) );
  NOR2_X2A_A9TL U272 ( .A(n99), .B(n98), .Y(n235) );
  NAND2_X1A_A9TL U273 ( .A(n129), .B(n128), .Y(n130) );
  XNOR2_X1P4M_A9TL U274 ( .A(n141), .B(n140), .Y(n143) );
  INV_X1M_A9TL U275 ( .A(n133), .Y(n134) );
  NOR2_X2A_A9TR U276 ( .A(n222), .B(n224), .Y(n99) );
  OAI21_X1P4M_A9TL U277 ( .A0(n224), .A1(n221), .B0(n223), .Y(n98) );
  NAND2XB_X1M_A9TL U278 ( .BN(s[6]), .A(n114), .Y(n232) );
  NAND2_X2M_A9TL U279 ( .A(n216), .B(n217), .Y(n222) );
  XOR2_X0P7M_A9TR U280 ( .A(n213), .B(n212), .Y(n214) );
  XNOR2_X3M_A9TL U281 ( .A(n112), .B(n111), .Y(n114) );
  INV_X1M_A9TR U282 ( .A(n223), .Y(n225) );
  INV_X1M_A9TL U283 ( .A(n65), .Y(n41) );
  NAND2_X1A_A9TL U284 ( .A(n56), .B(n62), .Y(n63) );
  NOR2_X4A_A9TL U285 ( .A(n56), .B(n62), .Y(n138) );
  XOR2_X1P4M_A9TL U286 ( .A(n104), .B(n103), .Y(n237) );
  NOR2_X3A_A9TL U287 ( .A(n122), .B(n117), .Y(n154) );
  NAND2_X1A_A9TL U288 ( .A(n97), .B(s[5]), .Y(n223) );
  NOR2_X2A_A9TL U289 ( .A(n97), .B(s[5]), .Y(n224) );
  XNOR2_X0P7M_A9TR U290 ( .A(n205), .B(n204), .Y(n206) );
  INV_X0P8B_A9TH U291 ( .A(n300), .Y(n303) );
  XOR2_X1P4M_A9TL U292 ( .A(n90), .B(n89), .Y(n94) );
  NAND2_X1A_A9TL U293 ( .A(n84), .B(s[2]), .Y(n210) );
  NOR2_X1A_A9TL U294 ( .A(n82), .B(n199), .Y(n200) );
  XNOR2_X3M_A9TL U295 ( .A(n43), .B(n42), .Y(n57) );
  NAND2_X1A_A9TL U296 ( .A(n87), .B(s[3]), .Y(n208) );
  INV_X1M_A9TL U297 ( .A(n83), .Y(n84) );
  NOR2_X1A_A9TL U298 ( .A(n86), .B(n85), .Y(n80) );
  INV_X1B_A9TR U299 ( .A(rst_n), .Y(n323) );
  NAND2_X4M_A9TL U300 ( .A(f[3]), .B(f[6]), .Y(n72) );
  NAND4_X2A_A9TL U301 ( .A(n170), .B(s[13]), .C(n77), .D(n173), .Y(n175) );
  NAND3_X2A_A9TL U302 ( .A(n157), .B(n156), .C(n155), .Y(n191) );
  AO21A1AI2_X1M_A9TL U303 ( .A0(n211), .A1(n210), .B0(n209), .C0(n208), .Y(
        n217) );
  NOR2_X4A_A9TL U304 ( .A(n26), .B(n25), .Y(n88) );
  NAND2_X2M_A9TL U305 ( .A(n237), .B(s[7]), .Y(n236) );
  NOR2_X3A_A9TL U306 ( .A(n187), .B(s[10]), .Y(n259) );
  NOR2_X4A_A9TL U307 ( .A(n249), .B(n252), .Y(n186) );
  XNOR2_X1P4M_A9TL U308 ( .A(n183), .B(s[18]), .Y(n184) );
  XOR2_X1P4M_A9TL U309 ( .A(n88), .B(n58), .Y(n44) );
  OAI21_X1M_A9TL U310 ( .A0(n146), .A1(n145), .B0(s[10]), .Y(n158) );
  XNOR2_X1M_A9TL U311 ( .A(n79), .B(n78), .Y(n81) );
  AO21A1AI2_X2M_A9TL U312 ( .A0(n232), .A1(s[7]), .B0(n237), .C0(n115), .Y(
        n116) );
  INV_X1M_A9TH U313 ( .A(n289), .Y(n299) );
  OAI31_X1M_A9TL U314 ( .A0(n151), .A1(n153), .A2(n150), .B0(s[11]), .Y(n152)
         );
  INV_X1M_A9TH U315 ( .A(n232), .Y(n234) );
  NOR3_X2A_A9TL U316 ( .A(n307), .B(n280), .C(n305), .Y(n285) );
  OA21A1OI2_X1P4M_A9TL U317 ( .A0(n167), .A1(n165), .B0(n164), .C0(n163), .Y(
        n166) );
  INV_X1M_A9TL U318 ( .A(n146), .Y(n125) );
  ADDF_X2M_A9TL U319 ( .A(n49), .B(n48), .CI(n47), .CO(n50), .S(n107) );
  ADDF_X2M_A9TL U320 ( .A(n71), .B(n70), .CI(n69), .CO(n151), .S(n66) );
  ADDF_X2M_A9TL U321 ( .A(n73), .B(f[5]), .CI(n72), .CO(n118), .S(n150) );
  NAND2_X1A_A9TL U322 ( .A(n119), .B(n118), .Y(n35) );
  INV_X1M_A9TH U323 ( .A(n171), .Y(n173) );
  INV_X1M_A9TH U324 ( .A(n200), .Y(n197) );
  INV_X1M_A9TH U325 ( .A(s[11]), .Y(n196) );
  INV_X1M_A9TH U326 ( .A(s[20]), .Y(n180) );
  NAND2_X1A_A9TH U327 ( .A(s[16]), .B(s[17]), .Y(n169) );
  INV_X1M_A9TH U328 ( .A(s[1]), .Y(n202) );
  INV_X1M_A9TH U329 ( .A(s[2]), .Y(n207) );
  NAND2_X1A_A9TH U330 ( .A(n203), .B(n210), .Y(n205) );
  INV_X1M_A9TH U331 ( .A(s[3]), .Y(n215) );
  NAND2_X1A_A9TH U332 ( .A(n211), .B(n210), .Y(n212) );
  INV_X1M_A9TH U333 ( .A(s[4]), .Y(n220) );
  INV_X1M_A9TH U334 ( .A(s[6]), .Y(n231) );
  INV_X1M_A9TH U335 ( .A(s[7]), .Y(n243) );
  INV_X1M_A9TH U336 ( .A(s[8]), .Y(n247) );
  INV_X1M_A9TH U337 ( .A(s[9]), .Y(n256) );
  INV_X1M_A9TH U338 ( .A(s[10]), .Y(n263) );
  INV_X1M_A9TH U339 ( .A(s[14]), .Y(n281) );
  INV_X1M_A9TH U340 ( .A(s[15]), .Y(n282) );
  INV_X1M_A9TH U341 ( .A(s[16]), .Y(n298) );
  NOR2_X1A_A9TH U342 ( .A(n299), .B(n298), .Y(n300) );
  INV_X1M_A9TH U343 ( .A(s[17]), .Y(n310) );
endmodule

