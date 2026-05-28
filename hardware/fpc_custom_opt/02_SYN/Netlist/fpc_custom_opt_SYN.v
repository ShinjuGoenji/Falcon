/////////////////////////////////////////////////////////////
// Created by: Synopsys Design Compiler(R) NXT
// Version   : T-2022.03
// Date      : Thu May 28 13:53:16 2026
/////////////////////////////////////////////////////////////


module FPC_TOP ( clk, rst_n, a_re, a_im, b_re, b_im, op, in_valid, c_re, c_im, 
        out_valid );
  input [63:0] a_re;
  input [63:0] a_im;
  input [63:0] b_re;
  input [63:0] b_im;
  input [1:0] op;
  output [63:0] c_re;
  output [63:0] c_im;
  input clk, rst_n, in_valid;
  output out_valid;
  wire   N0, N1, N2, N3, mul_valid, N4, in_valid_r, N5, N6, N7, N8, N9, N10,
         N11, N12, N13;
  wire   [63:0] c_re_add;
  wire   [63:0] c_im_add;
  wire   [63:0] c_re_sub;
  wire   [63:0] c_im_sub;
  wire   [63:0] c_re_mul;
  wire   [63:0] c_im_mul;

  FPC_ADD u_add ( .a_re(a_re), .a_im(a_im), .b_re(b_re), .b_im(b_im), .d_re(
        c_re_add), .d_im(c_im_add) );
  FPC_SUB u_sub ( .a_re(a_re), .a_im(a_im), .b_re(b_re), .b_im(b_im), .d_re(
        c_re_sub), .d_im(c_im_sub) );
  FPC_MUL u_mul ( .clk(clk), .rst_n(rst_n), .in_valid(in_valid), .a_re(a_re), 
        .a_im(a_im), .b_re(b_re), .b_im(b_im), .mult_valid(mul_valid), .d_re(
        c_re_mul), .d_im(c_im_mul) );
  \**SEQGEN**  in_valid_r_reg ( .clear(N4), .preset(1'b0), .next_state(
        in_valid), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        in_valid_r), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(1'b1) );
  GTECH_NOT I_0 ( .A(op[0]), .Z(N6) );
  GTECH_OR2 C160 ( .A(N6), .B(op[1]), .Z(N7) );
  GTECH_NOT I_1 ( .A(N7), .Z(N8) );
  GTECH_NOT I_2 ( .A(op[1]), .Z(N9) );
  GTECH_OR2 C163 ( .A(op[0]), .B(N9), .Z(N10) );
  GTECH_NOT I_3 ( .A(N10), .Z(N11) );
  SELECT_OP C174 ( .DATA1(c_re_sub), .DATA2(c_re_mul), .DATA3(c_re_add), 
        .CONTROL1(N0), .CONTROL2(N1), .CONTROL3(N2), .Z(c_re) );
  GTECH_BUF B_0 ( .A(N8), .Z(N0) );
  GTECH_BUF B_1 ( .A(N11), .Z(N1) );
  GTECH_BUF B_2 ( .A(N5), .Z(N2) );
  SELECT_OP C175 ( .DATA1(c_im_sub), .DATA2(c_im_mul), .DATA3(c_im_add), 
        .CONTROL1(N0), .CONTROL2(N1), .CONTROL3(N2), .Z(c_im) );
  SELECT_OP C176 ( .DATA1(mul_valid), .DATA2(in_valid_r), .CONTROL1(N1), 
        .CONTROL2(N3), .Z(out_valid) );
  GTECH_BUF B_3 ( .A(N10), .Z(N3) );
  GTECH_NOT I_4 ( .A(rst_n), .Z(N4) );
  GTECH_OR2 C180 ( .A(N12), .B(N13), .Z(N5) );
  GTECH_AND2 C181 ( .A(op[1]), .B(op[0]), .Z(N12) );
  GTECH_AND2 C182 ( .A(N9), .B(N6), .Z(N13) );
endmodule


module FPC_MUL ( clk, rst_n, in_valid, a_re, a_im, b_re, b_im, mult_valid, 
        d_re, d_im );
  input [63:0] a_re;
  input [63:0] a_im;
  input [63:0] b_re;
  input [63:0] b_im;
  output [63:0] d_re;
  output [63:0] d_im;
  input clk, rst_n, in_valid;
  output mult_valid;
  wire   N0, net873, net874, net875, net876, net877, net878, net879, net880,
         net881, net882, net883, net884, net885, net886, net887, net888,
         net889, net890, net891, net892, net893, net894, net895, net896,
         net897, net898, net899, net900, net901, net902, net903, net904,
         net905, net906, net907, net908, net909, net910, net911, net912,
         net913, net914, net915, net916, net917, net918, net919, net920;
  wire   [63:0] a_re_x_b_re;
  wire   [63:0] a_im_x_b_im;
  wire   [63:0] a_re_x_b_im;
  wire   [63:0] a_im_x_b_re;
  wire   [63:0] a_re_x_b_re_reg;
  wire   [63:0] a_im_x_b_im_reg;
  wire   [63:0] a_re_x_b_im_reg;
  wire   [63:0] a_im_x_b_re_reg;

  DW_fp_mult u_FPR_MUL_0 ( .a(a_re), .b(b_re), .rnd({1'b0, 1'b0, 1'b0}), .z(
        a_re_x_b_re), .status({net881, net882, net883, net884, net885, net886, 
        net887, net888}) );
  DW_fp_mult u_FPR_MUL_1 ( .a(a_im), .b(b_im), .rnd({1'b0, 1'b0, 1'b0}), .z(
        a_im_x_b_im), .status({net897, net898, net899, net900, net901, net902, 
        net903, net904}) );
  DW_fp_mult u_FPR_MUL_2 ( .a(a_re), .b(b_im), .rnd({1'b0, 1'b0, 1'b0}), .z(
        a_re_x_b_im), .status({net873, net874, net875, net876, net877, net878, 
        net879, net880}) );
  DW_fp_mult u_FPR_MUL_3 ( .a(a_im), .b(b_re), .rnd({1'b0, 1'b0, 1'b0}), .z(
        a_im_x_b_re), .status({net889, net890, net891, net892, net893, net894, 
        net895, net896}) );
  DW_fp_sub u_FPR_SUB ( .a(a_re_x_b_re_reg), .b(a_im_x_b_im_reg), .rnd({1'b0, 
        1'b0, 1'b0}), .z(d_re), .status({net913, net914, net915, net916, 
        net917, net918, net919, net920}) );
  DW_fp_add u_FPR_ADD ( .a(a_re_x_b_im_reg), .b(a_im_x_b_re_reg), .rnd({1'b0, 
        1'b0, 1'b0}), .z(d_im), .status({net905, net906, net907, net908, 
        net909, net910, net911, net912}) );
  \**SEQGEN**  a_im_x_b_re_reg_reg_63_ ( .clear(N0), .preset(1'b0), 
        .next_state(a_im_x_b_re[63]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(a_im_x_b_re_reg[63]), .synch_clear(1'b0), 
        .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  a_im_x_b_re_reg_reg_62_ ( .clear(N0), .preset(1'b0), 
        .next_state(a_im_x_b_re[62]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(a_im_x_b_re_reg[62]), .synch_clear(1'b0), 
        .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  a_im_x_b_re_reg_reg_61_ ( .clear(N0), .preset(1'b0), 
        .next_state(a_im_x_b_re[61]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(a_im_x_b_re_reg[61]), .synch_clear(1'b0), 
        .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  a_im_x_b_re_reg_reg_60_ ( .clear(N0), .preset(1'b0), 
        .next_state(a_im_x_b_re[60]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(a_im_x_b_re_reg[60]), .synch_clear(1'b0), 
        .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  a_im_x_b_re_reg_reg_59_ ( .clear(N0), .preset(1'b0), 
        .next_state(a_im_x_b_re[59]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(a_im_x_b_re_reg[59]), .synch_clear(1'b0), 
        .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  a_im_x_b_re_reg_reg_58_ ( .clear(N0), .preset(1'b0), 
        .next_state(a_im_x_b_re[58]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(a_im_x_b_re_reg[58]), .synch_clear(1'b0), 
        .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  a_im_x_b_re_reg_reg_57_ ( .clear(N0), .preset(1'b0), 
        .next_state(a_im_x_b_re[57]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(a_im_x_b_re_reg[57]), .synch_clear(1'b0), 
        .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  a_im_x_b_re_reg_reg_56_ ( .clear(N0), .preset(1'b0), 
        .next_state(a_im_x_b_re[56]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(a_im_x_b_re_reg[56]), .synch_clear(1'b0), 
        .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  a_im_x_b_re_reg_reg_55_ ( .clear(N0), .preset(1'b0), 
        .next_state(a_im_x_b_re[55]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(a_im_x_b_re_reg[55]), .synch_clear(1'b0), 
        .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  a_im_x_b_re_reg_reg_54_ ( .clear(N0), .preset(1'b0), 
        .next_state(a_im_x_b_re[54]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(a_im_x_b_re_reg[54]), .synch_clear(1'b0), 
        .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  a_im_x_b_re_reg_reg_53_ ( .clear(N0), .preset(1'b0), 
        .next_state(a_im_x_b_re[53]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(a_im_x_b_re_reg[53]), .synch_clear(1'b0), 
        .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  a_im_x_b_re_reg_reg_52_ ( .clear(N0), .preset(1'b0), 
        .next_state(a_im_x_b_re[52]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(a_im_x_b_re_reg[52]), .synch_clear(1'b0), 
        .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  a_im_x_b_re_reg_reg_51_ ( .clear(N0), .preset(1'b0), 
        .next_state(a_im_x_b_re[51]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(a_im_x_b_re_reg[51]), .synch_clear(1'b0), 
        .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  a_im_x_b_re_reg_reg_50_ ( .clear(N0), .preset(1'b0), 
        .next_state(a_im_x_b_re[50]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(a_im_x_b_re_reg[50]), .synch_clear(1'b0), 
        .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  a_im_x_b_re_reg_reg_49_ ( .clear(N0), .preset(1'b0), 
        .next_state(a_im_x_b_re[49]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(a_im_x_b_re_reg[49]), .synch_clear(1'b0), 
        .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  a_im_x_b_re_reg_reg_48_ ( .clear(N0), .preset(1'b0), 
        .next_state(a_im_x_b_re[48]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(a_im_x_b_re_reg[48]), .synch_clear(1'b0), 
        .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  a_im_x_b_re_reg_reg_47_ ( .clear(N0), .preset(1'b0), 
        .next_state(a_im_x_b_re[47]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(a_im_x_b_re_reg[47]), .synch_clear(1'b0), 
        .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  a_im_x_b_re_reg_reg_46_ ( .clear(N0), .preset(1'b0), 
        .next_state(a_im_x_b_re[46]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(a_im_x_b_re_reg[46]), .synch_clear(1'b0), 
        .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  a_im_x_b_re_reg_reg_45_ ( .clear(N0), .preset(1'b0), 
        .next_state(a_im_x_b_re[45]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(a_im_x_b_re_reg[45]), .synch_clear(1'b0), 
        .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  a_im_x_b_re_reg_reg_44_ ( .clear(N0), .preset(1'b0), 
        .next_state(a_im_x_b_re[44]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(a_im_x_b_re_reg[44]), .synch_clear(1'b0), 
        .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  a_im_x_b_re_reg_reg_43_ ( .clear(N0), .preset(1'b0), 
        .next_state(a_im_x_b_re[43]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(a_im_x_b_re_reg[43]), .synch_clear(1'b0), 
        .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  a_im_x_b_re_reg_reg_42_ ( .clear(N0), .preset(1'b0), 
        .next_state(a_im_x_b_re[42]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(a_im_x_b_re_reg[42]), .synch_clear(1'b0), 
        .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  a_im_x_b_re_reg_reg_41_ ( .clear(N0), .preset(1'b0), 
        .next_state(a_im_x_b_re[41]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(a_im_x_b_re_reg[41]), .synch_clear(1'b0), 
        .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  a_im_x_b_re_reg_reg_40_ ( .clear(N0), .preset(1'b0), 
        .next_state(a_im_x_b_re[40]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(a_im_x_b_re_reg[40]), .synch_clear(1'b0), 
        .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  a_im_x_b_re_reg_reg_39_ ( .clear(N0), .preset(1'b0), 
        .next_state(a_im_x_b_re[39]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(a_im_x_b_re_reg[39]), .synch_clear(1'b0), 
        .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  a_im_x_b_re_reg_reg_38_ ( .clear(N0), .preset(1'b0), 
        .next_state(a_im_x_b_re[38]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(a_im_x_b_re_reg[38]), .synch_clear(1'b0), 
        .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  a_im_x_b_re_reg_reg_37_ ( .clear(N0), .preset(1'b0), 
        .next_state(a_im_x_b_re[37]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(a_im_x_b_re_reg[37]), .synch_clear(1'b0), 
        .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  a_im_x_b_re_reg_reg_36_ ( .clear(N0), .preset(1'b0), 
        .next_state(a_im_x_b_re[36]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(a_im_x_b_re_reg[36]), .synch_clear(1'b0), 
        .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  a_im_x_b_re_reg_reg_35_ ( .clear(N0), .preset(1'b0), 
        .next_state(a_im_x_b_re[35]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(a_im_x_b_re_reg[35]), .synch_clear(1'b0), 
        .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  a_im_x_b_re_reg_reg_34_ ( .clear(N0), .preset(1'b0), 
        .next_state(a_im_x_b_re[34]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(a_im_x_b_re_reg[34]), .synch_clear(1'b0), 
        .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  a_im_x_b_re_reg_reg_33_ ( .clear(N0), .preset(1'b0), 
        .next_state(a_im_x_b_re[33]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(a_im_x_b_re_reg[33]), .synch_clear(1'b0), 
        .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  a_im_x_b_re_reg_reg_32_ ( .clear(N0), .preset(1'b0), 
        .next_state(a_im_x_b_re[32]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(a_im_x_b_re_reg[32]), .synch_clear(1'b0), 
        .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  a_im_x_b_re_reg_reg_31_ ( .clear(N0), .preset(1'b0), 
        .next_state(a_im_x_b_re[31]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(a_im_x_b_re_reg[31]), .synch_clear(1'b0), 
        .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  a_im_x_b_re_reg_reg_30_ ( .clear(N0), .preset(1'b0), 
        .next_state(a_im_x_b_re[30]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(a_im_x_b_re_reg[30]), .synch_clear(1'b0), 
        .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  a_im_x_b_re_reg_reg_29_ ( .clear(N0), .preset(1'b0), 
        .next_state(a_im_x_b_re[29]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(a_im_x_b_re_reg[29]), .synch_clear(1'b0), 
        .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  a_im_x_b_re_reg_reg_28_ ( .clear(N0), .preset(1'b0), 
        .next_state(a_im_x_b_re[28]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(a_im_x_b_re_reg[28]), .synch_clear(1'b0), 
        .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  a_im_x_b_re_reg_reg_27_ ( .clear(N0), .preset(1'b0), 
        .next_state(a_im_x_b_re[27]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(a_im_x_b_re_reg[27]), .synch_clear(1'b0), 
        .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  a_im_x_b_re_reg_reg_26_ ( .clear(N0), .preset(1'b0), 
        .next_state(a_im_x_b_re[26]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(a_im_x_b_re_reg[26]), .synch_clear(1'b0), 
        .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  a_im_x_b_re_reg_reg_25_ ( .clear(N0), .preset(1'b0), 
        .next_state(a_im_x_b_re[25]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(a_im_x_b_re_reg[25]), .synch_clear(1'b0), 
        .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  a_im_x_b_re_reg_reg_24_ ( .clear(N0), .preset(1'b0), 
        .next_state(a_im_x_b_re[24]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(a_im_x_b_re_reg[24]), .synch_clear(1'b0), 
        .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  a_im_x_b_re_reg_reg_23_ ( .clear(N0), .preset(1'b0), 
        .next_state(a_im_x_b_re[23]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(a_im_x_b_re_reg[23]), .synch_clear(1'b0), 
        .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  a_im_x_b_re_reg_reg_22_ ( .clear(N0), .preset(1'b0), 
        .next_state(a_im_x_b_re[22]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(a_im_x_b_re_reg[22]), .synch_clear(1'b0), 
        .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  a_im_x_b_re_reg_reg_21_ ( .clear(N0), .preset(1'b0), 
        .next_state(a_im_x_b_re[21]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(a_im_x_b_re_reg[21]), .synch_clear(1'b0), 
        .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  a_im_x_b_re_reg_reg_20_ ( .clear(N0), .preset(1'b0), 
        .next_state(a_im_x_b_re[20]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(a_im_x_b_re_reg[20]), .synch_clear(1'b0), 
        .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  a_im_x_b_re_reg_reg_19_ ( .clear(N0), .preset(1'b0), 
        .next_state(a_im_x_b_re[19]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(a_im_x_b_re_reg[19]), .synch_clear(1'b0), 
        .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  a_im_x_b_re_reg_reg_18_ ( .clear(N0), .preset(1'b0), 
        .next_state(a_im_x_b_re[18]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(a_im_x_b_re_reg[18]), .synch_clear(1'b0), 
        .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  a_im_x_b_re_reg_reg_17_ ( .clear(N0), .preset(1'b0), 
        .next_state(a_im_x_b_re[17]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(a_im_x_b_re_reg[17]), .synch_clear(1'b0), 
        .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  a_im_x_b_re_reg_reg_16_ ( .clear(N0), .preset(1'b0), 
        .next_state(a_im_x_b_re[16]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(a_im_x_b_re_reg[16]), .synch_clear(1'b0), 
        .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  a_im_x_b_re_reg_reg_15_ ( .clear(N0), .preset(1'b0), 
        .next_state(a_im_x_b_re[15]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(a_im_x_b_re_reg[15]), .synch_clear(1'b0), 
        .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  a_im_x_b_re_reg_reg_14_ ( .clear(N0), .preset(1'b0), 
        .next_state(a_im_x_b_re[14]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(a_im_x_b_re_reg[14]), .synch_clear(1'b0), 
        .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  a_im_x_b_re_reg_reg_13_ ( .clear(N0), .preset(1'b0), 
        .next_state(a_im_x_b_re[13]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(a_im_x_b_re_reg[13]), .synch_clear(1'b0), 
        .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  a_im_x_b_re_reg_reg_12_ ( .clear(N0), .preset(1'b0), 
        .next_state(a_im_x_b_re[12]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(a_im_x_b_re_reg[12]), .synch_clear(1'b0), 
        .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  a_im_x_b_re_reg_reg_11_ ( .clear(N0), .preset(1'b0), 
        .next_state(a_im_x_b_re[11]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(a_im_x_b_re_reg[11]), .synch_clear(1'b0), 
        .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  a_im_x_b_re_reg_reg_10_ ( .clear(N0), .preset(1'b0), 
        .next_state(a_im_x_b_re[10]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(a_im_x_b_re_reg[10]), .synch_clear(1'b0), 
        .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  a_im_x_b_re_reg_reg_9_ ( .clear(N0), .preset(1'b0), 
        .next_state(a_im_x_b_re[9]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(a_im_x_b_re_reg[9]), .synch_clear(1'b0), 
        .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  a_im_x_b_re_reg_reg_8_ ( .clear(N0), .preset(1'b0), 
        .next_state(a_im_x_b_re[8]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(a_im_x_b_re_reg[8]), .synch_clear(1'b0), 
        .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  a_im_x_b_re_reg_reg_7_ ( .clear(N0), .preset(1'b0), 
        .next_state(a_im_x_b_re[7]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(a_im_x_b_re_reg[7]), .synch_clear(1'b0), 
        .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  a_im_x_b_re_reg_reg_6_ ( .clear(N0), .preset(1'b0), 
        .next_state(a_im_x_b_re[6]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(a_im_x_b_re_reg[6]), .synch_clear(1'b0), 
        .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  a_im_x_b_re_reg_reg_5_ ( .clear(N0), .preset(1'b0), 
        .next_state(a_im_x_b_re[5]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(a_im_x_b_re_reg[5]), .synch_clear(1'b0), 
        .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  a_im_x_b_re_reg_reg_4_ ( .clear(N0), .preset(1'b0), 
        .next_state(a_im_x_b_re[4]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(a_im_x_b_re_reg[4]), .synch_clear(1'b0), 
        .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  a_im_x_b_re_reg_reg_3_ ( .clear(N0), .preset(1'b0), 
        .next_state(a_im_x_b_re[3]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(a_im_x_b_re_reg[3]), .synch_clear(1'b0), 
        .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  a_im_x_b_re_reg_reg_2_ ( .clear(N0), .preset(1'b0), 
        .next_state(a_im_x_b_re[2]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(a_im_x_b_re_reg[2]), .synch_clear(1'b0), 
        .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  a_im_x_b_re_reg_reg_1_ ( .clear(N0), .preset(1'b0), 
        .next_state(a_im_x_b_re[1]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(a_im_x_b_re_reg[1]), .synch_clear(1'b0), 
        .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  a_im_x_b_re_reg_reg_0_ ( .clear(N0), .preset(1'b0), 
        .next_state(a_im_x_b_re[0]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(a_im_x_b_re_reg[0]), .synch_clear(1'b0), 
        .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  mult_valid_reg ( .clear(N0), .preset(1'b0), .next_state(
        in_valid), .clocked_on(clk), .data_in(1'b0), .enable(1'b0), .Q(
        mult_valid), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(
        1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  a_re_x_b_re_reg_reg_63_ ( .clear(N0), .preset(1'b0), 
        .next_state(a_re_x_b_re[63]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(a_re_x_b_re_reg[63]), .synch_clear(1'b0), 
        .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  a_re_x_b_re_reg_reg_62_ ( .clear(N0), .preset(1'b0), 
        .next_state(a_re_x_b_re[62]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(a_re_x_b_re_reg[62]), .synch_clear(1'b0), 
        .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  a_re_x_b_re_reg_reg_61_ ( .clear(N0), .preset(1'b0), 
        .next_state(a_re_x_b_re[61]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(a_re_x_b_re_reg[61]), .synch_clear(1'b0), 
        .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  a_re_x_b_re_reg_reg_60_ ( .clear(N0), .preset(1'b0), 
        .next_state(a_re_x_b_re[60]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(a_re_x_b_re_reg[60]), .synch_clear(1'b0), 
        .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  a_re_x_b_re_reg_reg_59_ ( .clear(N0), .preset(1'b0), 
        .next_state(a_re_x_b_re[59]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(a_re_x_b_re_reg[59]), .synch_clear(1'b0), 
        .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  a_re_x_b_re_reg_reg_58_ ( .clear(N0), .preset(1'b0), 
        .next_state(a_re_x_b_re[58]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(a_re_x_b_re_reg[58]), .synch_clear(1'b0), 
        .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  a_re_x_b_re_reg_reg_57_ ( .clear(N0), .preset(1'b0), 
        .next_state(a_re_x_b_re[57]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(a_re_x_b_re_reg[57]), .synch_clear(1'b0), 
        .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  a_re_x_b_re_reg_reg_56_ ( .clear(N0), .preset(1'b0), 
        .next_state(a_re_x_b_re[56]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(a_re_x_b_re_reg[56]), .synch_clear(1'b0), 
        .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  a_re_x_b_re_reg_reg_55_ ( .clear(N0), .preset(1'b0), 
        .next_state(a_re_x_b_re[55]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(a_re_x_b_re_reg[55]), .synch_clear(1'b0), 
        .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  a_re_x_b_re_reg_reg_54_ ( .clear(N0), .preset(1'b0), 
        .next_state(a_re_x_b_re[54]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(a_re_x_b_re_reg[54]), .synch_clear(1'b0), 
        .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  a_re_x_b_re_reg_reg_53_ ( .clear(N0), .preset(1'b0), 
        .next_state(a_re_x_b_re[53]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(a_re_x_b_re_reg[53]), .synch_clear(1'b0), 
        .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  a_re_x_b_re_reg_reg_52_ ( .clear(N0), .preset(1'b0), 
        .next_state(a_re_x_b_re[52]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(a_re_x_b_re_reg[52]), .synch_clear(1'b0), 
        .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  a_re_x_b_re_reg_reg_51_ ( .clear(N0), .preset(1'b0), 
        .next_state(a_re_x_b_re[51]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(a_re_x_b_re_reg[51]), .synch_clear(1'b0), 
        .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  a_re_x_b_re_reg_reg_50_ ( .clear(N0), .preset(1'b0), 
        .next_state(a_re_x_b_re[50]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(a_re_x_b_re_reg[50]), .synch_clear(1'b0), 
        .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  a_re_x_b_re_reg_reg_49_ ( .clear(N0), .preset(1'b0), 
        .next_state(a_re_x_b_re[49]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(a_re_x_b_re_reg[49]), .synch_clear(1'b0), 
        .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  a_re_x_b_re_reg_reg_48_ ( .clear(N0), .preset(1'b0), 
        .next_state(a_re_x_b_re[48]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(a_re_x_b_re_reg[48]), .synch_clear(1'b0), 
        .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  a_re_x_b_re_reg_reg_47_ ( .clear(N0), .preset(1'b0), 
        .next_state(a_re_x_b_re[47]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(a_re_x_b_re_reg[47]), .synch_clear(1'b0), 
        .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  a_re_x_b_re_reg_reg_46_ ( .clear(N0), .preset(1'b0), 
        .next_state(a_re_x_b_re[46]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(a_re_x_b_re_reg[46]), .synch_clear(1'b0), 
        .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  a_re_x_b_re_reg_reg_45_ ( .clear(N0), .preset(1'b0), 
        .next_state(a_re_x_b_re[45]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(a_re_x_b_re_reg[45]), .synch_clear(1'b0), 
        .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  a_re_x_b_re_reg_reg_44_ ( .clear(N0), .preset(1'b0), 
        .next_state(a_re_x_b_re[44]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(a_re_x_b_re_reg[44]), .synch_clear(1'b0), 
        .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  a_re_x_b_re_reg_reg_43_ ( .clear(N0), .preset(1'b0), 
        .next_state(a_re_x_b_re[43]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(a_re_x_b_re_reg[43]), .synch_clear(1'b0), 
        .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  a_re_x_b_re_reg_reg_42_ ( .clear(N0), .preset(1'b0), 
        .next_state(a_re_x_b_re[42]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(a_re_x_b_re_reg[42]), .synch_clear(1'b0), 
        .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  a_re_x_b_re_reg_reg_41_ ( .clear(N0), .preset(1'b0), 
        .next_state(a_re_x_b_re[41]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(a_re_x_b_re_reg[41]), .synch_clear(1'b0), 
        .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  a_re_x_b_re_reg_reg_40_ ( .clear(N0), .preset(1'b0), 
        .next_state(a_re_x_b_re[40]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(a_re_x_b_re_reg[40]), .synch_clear(1'b0), 
        .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  a_re_x_b_re_reg_reg_39_ ( .clear(N0), .preset(1'b0), 
        .next_state(a_re_x_b_re[39]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(a_re_x_b_re_reg[39]), .synch_clear(1'b0), 
        .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  a_re_x_b_re_reg_reg_38_ ( .clear(N0), .preset(1'b0), 
        .next_state(a_re_x_b_re[38]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(a_re_x_b_re_reg[38]), .synch_clear(1'b0), 
        .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  a_re_x_b_re_reg_reg_37_ ( .clear(N0), .preset(1'b0), 
        .next_state(a_re_x_b_re[37]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(a_re_x_b_re_reg[37]), .synch_clear(1'b0), 
        .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  a_re_x_b_re_reg_reg_36_ ( .clear(N0), .preset(1'b0), 
        .next_state(a_re_x_b_re[36]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(a_re_x_b_re_reg[36]), .synch_clear(1'b0), 
        .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  a_re_x_b_re_reg_reg_35_ ( .clear(N0), .preset(1'b0), 
        .next_state(a_re_x_b_re[35]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(a_re_x_b_re_reg[35]), .synch_clear(1'b0), 
        .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  a_re_x_b_re_reg_reg_34_ ( .clear(N0), .preset(1'b0), 
        .next_state(a_re_x_b_re[34]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(a_re_x_b_re_reg[34]), .synch_clear(1'b0), 
        .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  a_re_x_b_re_reg_reg_33_ ( .clear(N0), .preset(1'b0), 
        .next_state(a_re_x_b_re[33]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(a_re_x_b_re_reg[33]), .synch_clear(1'b0), 
        .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  a_re_x_b_re_reg_reg_32_ ( .clear(N0), .preset(1'b0), 
        .next_state(a_re_x_b_re[32]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(a_re_x_b_re_reg[32]), .synch_clear(1'b0), 
        .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  a_re_x_b_re_reg_reg_31_ ( .clear(N0), .preset(1'b0), 
        .next_state(a_re_x_b_re[31]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(a_re_x_b_re_reg[31]), .synch_clear(1'b0), 
        .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  a_re_x_b_re_reg_reg_30_ ( .clear(N0), .preset(1'b0), 
        .next_state(a_re_x_b_re[30]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(a_re_x_b_re_reg[30]), .synch_clear(1'b0), 
        .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  a_re_x_b_re_reg_reg_29_ ( .clear(N0), .preset(1'b0), 
        .next_state(a_re_x_b_re[29]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(a_re_x_b_re_reg[29]), .synch_clear(1'b0), 
        .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  a_re_x_b_re_reg_reg_28_ ( .clear(N0), .preset(1'b0), 
        .next_state(a_re_x_b_re[28]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(a_re_x_b_re_reg[28]), .synch_clear(1'b0), 
        .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  a_re_x_b_re_reg_reg_27_ ( .clear(N0), .preset(1'b0), 
        .next_state(a_re_x_b_re[27]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(a_re_x_b_re_reg[27]), .synch_clear(1'b0), 
        .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  a_re_x_b_re_reg_reg_26_ ( .clear(N0), .preset(1'b0), 
        .next_state(a_re_x_b_re[26]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(a_re_x_b_re_reg[26]), .synch_clear(1'b0), 
        .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  a_re_x_b_re_reg_reg_25_ ( .clear(N0), .preset(1'b0), 
        .next_state(a_re_x_b_re[25]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(a_re_x_b_re_reg[25]), .synch_clear(1'b0), 
        .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  a_re_x_b_re_reg_reg_24_ ( .clear(N0), .preset(1'b0), 
        .next_state(a_re_x_b_re[24]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(a_re_x_b_re_reg[24]), .synch_clear(1'b0), 
        .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  a_re_x_b_re_reg_reg_23_ ( .clear(N0), .preset(1'b0), 
        .next_state(a_re_x_b_re[23]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(a_re_x_b_re_reg[23]), .synch_clear(1'b0), 
        .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  a_re_x_b_re_reg_reg_22_ ( .clear(N0), .preset(1'b0), 
        .next_state(a_re_x_b_re[22]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(a_re_x_b_re_reg[22]), .synch_clear(1'b0), 
        .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  a_re_x_b_re_reg_reg_21_ ( .clear(N0), .preset(1'b0), 
        .next_state(a_re_x_b_re[21]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(a_re_x_b_re_reg[21]), .synch_clear(1'b0), 
        .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  a_re_x_b_re_reg_reg_20_ ( .clear(N0), .preset(1'b0), 
        .next_state(a_re_x_b_re[20]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(a_re_x_b_re_reg[20]), .synch_clear(1'b0), 
        .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  a_re_x_b_re_reg_reg_19_ ( .clear(N0), .preset(1'b0), 
        .next_state(a_re_x_b_re[19]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(a_re_x_b_re_reg[19]), .synch_clear(1'b0), 
        .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  a_re_x_b_re_reg_reg_18_ ( .clear(N0), .preset(1'b0), 
        .next_state(a_re_x_b_re[18]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(a_re_x_b_re_reg[18]), .synch_clear(1'b0), 
        .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  a_re_x_b_re_reg_reg_17_ ( .clear(N0), .preset(1'b0), 
        .next_state(a_re_x_b_re[17]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(a_re_x_b_re_reg[17]), .synch_clear(1'b0), 
        .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  a_re_x_b_re_reg_reg_16_ ( .clear(N0), .preset(1'b0), 
        .next_state(a_re_x_b_re[16]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(a_re_x_b_re_reg[16]), .synch_clear(1'b0), 
        .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  a_re_x_b_re_reg_reg_15_ ( .clear(N0), .preset(1'b0), 
        .next_state(a_re_x_b_re[15]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(a_re_x_b_re_reg[15]), .synch_clear(1'b0), 
        .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  a_re_x_b_re_reg_reg_14_ ( .clear(N0), .preset(1'b0), 
        .next_state(a_re_x_b_re[14]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(a_re_x_b_re_reg[14]), .synch_clear(1'b0), 
        .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  a_re_x_b_re_reg_reg_13_ ( .clear(N0), .preset(1'b0), 
        .next_state(a_re_x_b_re[13]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(a_re_x_b_re_reg[13]), .synch_clear(1'b0), 
        .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  a_re_x_b_re_reg_reg_12_ ( .clear(N0), .preset(1'b0), 
        .next_state(a_re_x_b_re[12]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(a_re_x_b_re_reg[12]), .synch_clear(1'b0), 
        .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  a_re_x_b_re_reg_reg_11_ ( .clear(N0), .preset(1'b0), 
        .next_state(a_re_x_b_re[11]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(a_re_x_b_re_reg[11]), .synch_clear(1'b0), 
        .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  a_re_x_b_re_reg_reg_10_ ( .clear(N0), .preset(1'b0), 
        .next_state(a_re_x_b_re[10]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(a_re_x_b_re_reg[10]), .synch_clear(1'b0), 
        .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  a_re_x_b_re_reg_reg_9_ ( .clear(N0), .preset(1'b0), 
        .next_state(a_re_x_b_re[9]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(a_re_x_b_re_reg[9]), .synch_clear(1'b0), 
        .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  a_re_x_b_re_reg_reg_8_ ( .clear(N0), .preset(1'b0), 
        .next_state(a_re_x_b_re[8]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(a_re_x_b_re_reg[8]), .synch_clear(1'b0), 
        .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  a_re_x_b_re_reg_reg_7_ ( .clear(N0), .preset(1'b0), 
        .next_state(a_re_x_b_re[7]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(a_re_x_b_re_reg[7]), .synch_clear(1'b0), 
        .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  a_re_x_b_re_reg_reg_6_ ( .clear(N0), .preset(1'b0), 
        .next_state(a_re_x_b_re[6]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(a_re_x_b_re_reg[6]), .synch_clear(1'b0), 
        .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  a_re_x_b_re_reg_reg_5_ ( .clear(N0), .preset(1'b0), 
        .next_state(a_re_x_b_re[5]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(a_re_x_b_re_reg[5]), .synch_clear(1'b0), 
        .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  a_re_x_b_re_reg_reg_4_ ( .clear(N0), .preset(1'b0), 
        .next_state(a_re_x_b_re[4]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(a_re_x_b_re_reg[4]), .synch_clear(1'b0), 
        .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  a_re_x_b_re_reg_reg_3_ ( .clear(N0), .preset(1'b0), 
        .next_state(a_re_x_b_re[3]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(a_re_x_b_re_reg[3]), .synch_clear(1'b0), 
        .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  a_re_x_b_re_reg_reg_2_ ( .clear(N0), .preset(1'b0), 
        .next_state(a_re_x_b_re[2]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(a_re_x_b_re_reg[2]), .synch_clear(1'b0), 
        .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  a_re_x_b_re_reg_reg_1_ ( .clear(N0), .preset(1'b0), 
        .next_state(a_re_x_b_re[1]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(a_re_x_b_re_reg[1]), .synch_clear(1'b0), 
        .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  a_re_x_b_re_reg_reg_0_ ( .clear(N0), .preset(1'b0), 
        .next_state(a_re_x_b_re[0]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(a_re_x_b_re_reg[0]), .synch_clear(1'b0), 
        .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  a_im_x_b_im_reg_reg_63_ ( .clear(N0), .preset(1'b0), 
        .next_state(a_im_x_b_im[63]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(a_im_x_b_im_reg[63]), .synch_clear(1'b0), 
        .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  a_im_x_b_im_reg_reg_62_ ( .clear(N0), .preset(1'b0), 
        .next_state(a_im_x_b_im[62]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(a_im_x_b_im_reg[62]), .synch_clear(1'b0), 
        .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  a_im_x_b_im_reg_reg_61_ ( .clear(N0), .preset(1'b0), 
        .next_state(a_im_x_b_im[61]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(a_im_x_b_im_reg[61]), .synch_clear(1'b0), 
        .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  a_im_x_b_im_reg_reg_60_ ( .clear(N0), .preset(1'b0), 
        .next_state(a_im_x_b_im[60]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(a_im_x_b_im_reg[60]), .synch_clear(1'b0), 
        .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  a_im_x_b_im_reg_reg_59_ ( .clear(N0), .preset(1'b0), 
        .next_state(a_im_x_b_im[59]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(a_im_x_b_im_reg[59]), .synch_clear(1'b0), 
        .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  a_im_x_b_im_reg_reg_58_ ( .clear(N0), .preset(1'b0), 
        .next_state(a_im_x_b_im[58]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(a_im_x_b_im_reg[58]), .synch_clear(1'b0), 
        .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  a_im_x_b_im_reg_reg_57_ ( .clear(N0), .preset(1'b0), 
        .next_state(a_im_x_b_im[57]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(a_im_x_b_im_reg[57]), .synch_clear(1'b0), 
        .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  a_im_x_b_im_reg_reg_56_ ( .clear(N0), .preset(1'b0), 
        .next_state(a_im_x_b_im[56]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(a_im_x_b_im_reg[56]), .synch_clear(1'b0), 
        .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  a_im_x_b_im_reg_reg_55_ ( .clear(N0), .preset(1'b0), 
        .next_state(a_im_x_b_im[55]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(a_im_x_b_im_reg[55]), .synch_clear(1'b0), 
        .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  a_im_x_b_im_reg_reg_54_ ( .clear(N0), .preset(1'b0), 
        .next_state(a_im_x_b_im[54]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(a_im_x_b_im_reg[54]), .synch_clear(1'b0), 
        .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  a_im_x_b_im_reg_reg_53_ ( .clear(N0), .preset(1'b0), 
        .next_state(a_im_x_b_im[53]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(a_im_x_b_im_reg[53]), .synch_clear(1'b0), 
        .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  a_im_x_b_im_reg_reg_52_ ( .clear(N0), .preset(1'b0), 
        .next_state(a_im_x_b_im[52]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(a_im_x_b_im_reg[52]), .synch_clear(1'b0), 
        .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  a_im_x_b_im_reg_reg_51_ ( .clear(N0), .preset(1'b0), 
        .next_state(a_im_x_b_im[51]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(a_im_x_b_im_reg[51]), .synch_clear(1'b0), 
        .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  a_im_x_b_im_reg_reg_50_ ( .clear(N0), .preset(1'b0), 
        .next_state(a_im_x_b_im[50]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(a_im_x_b_im_reg[50]), .synch_clear(1'b0), 
        .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  a_im_x_b_im_reg_reg_49_ ( .clear(N0), .preset(1'b0), 
        .next_state(a_im_x_b_im[49]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(a_im_x_b_im_reg[49]), .synch_clear(1'b0), 
        .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  a_im_x_b_im_reg_reg_48_ ( .clear(N0), .preset(1'b0), 
        .next_state(a_im_x_b_im[48]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(a_im_x_b_im_reg[48]), .synch_clear(1'b0), 
        .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  a_im_x_b_im_reg_reg_47_ ( .clear(N0), .preset(1'b0), 
        .next_state(a_im_x_b_im[47]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(a_im_x_b_im_reg[47]), .synch_clear(1'b0), 
        .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  a_im_x_b_im_reg_reg_46_ ( .clear(N0), .preset(1'b0), 
        .next_state(a_im_x_b_im[46]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(a_im_x_b_im_reg[46]), .synch_clear(1'b0), 
        .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  a_im_x_b_im_reg_reg_45_ ( .clear(N0), .preset(1'b0), 
        .next_state(a_im_x_b_im[45]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(a_im_x_b_im_reg[45]), .synch_clear(1'b0), 
        .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  a_im_x_b_im_reg_reg_44_ ( .clear(N0), .preset(1'b0), 
        .next_state(a_im_x_b_im[44]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(a_im_x_b_im_reg[44]), .synch_clear(1'b0), 
        .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  a_im_x_b_im_reg_reg_43_ ( .clear(N0), .preset(1'b0), 
        .next_state(a_im_x_b_im[43]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(a_im_x_b_im_reg[43]), .synch_clear(1'b0), 
        .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  a_im_x_b_im_reg_reg_42_ ( .clear(N0), .preset(1'b0), 
        .next_state(a_im_x_b_im[42]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(a_im_x_b_im_reg[42]), .synch_clear(1'b0), 
        .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  a_im_x_b_im_reg_reg_41_ ( .clear(N0), .preset(1'b0), 
        .next_state(a_im_x_b_im[41]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(a_im_x_b_im_reg[41]), .synch_clear(1'b0), 
        .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  a_im_x_b_im_reg_reg_40_ ( .clear(N0), .preset(1'b0), 
        .next_state(a_im_x_b_im[40]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(a_im_x_b_im_reg[40]), .synch_clear(1'b0), 
        .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  a_im_x_b_im_reg_reg_39_ ( .clear(N0), .preset(1'b0), 
        .next_state(a_im_x_b_im[39]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(a_im_x_b_im_reg[39]), .synch_clear(1'b0), 
        .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  a_im_x_b_im_reg_reg_38_ ( .clear(N0), .preset(1'b0), 
        .next_state(a_im_x_b_im[38]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(a_im_x_b_im_reg[38]), .synch_clear(1'b0), 
        .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  a_im_x_b_im_reg_reg_37_ ( .clear(N0), .preset(1'b0), 
        .next_state(a_im_x_b_im[37]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(a_im_x_b_im_reg[37]), .synch_clear(1'b0), 
        .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  a_im_x_b_im_reg_reg_36_ ( .clear(N0), .preset(1'b0), 
        .next_state(a_im_x_b_im[36]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(a_im_x_b_im_reg[36]), .synch_clear(1'b0), 
        .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  a_im_x_b_im_reg_reg_35_ ( .clear(N0), .preset(1'b0), 
        .next_state(a_im_x_b_im[35]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(a_im_x_b_im_reg[35]), .synch_clear(1'b0), 
        .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  a_im_x_b_im_reg_reg_34_ ( .clear(N0), .preset(1'b0), 
        .next_state(a_im_x_b_im[34]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(a_im_x_b_im_reg[34]), .synch_clear(1'b0), 
        .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  a_im_x_b_im_reg_reg_33_ ( .clear(N0), .preset(1'b0), 
        .next_state(a_im_x_b_im[33]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(a_im_x_b_im_reg[33]), .synch_clear(1'b0), 
        .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  a_im_x_b_im_reg_reg_32_ ( .clear(N0), .preset(1'b0), 
        .next_state(a_im_x_b_im[32]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(a_im_x_b_im_reg[32]), .synch_clear(1'b0), 
        .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  a_im_x_b_im_reg_reg_31_ ( .clear(N0), .preset(1'b0), 
        .next_state(a_im_x_b_im[31]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(a_im_x_b_im_reg[31]), .synch_clear(1'b0), 
        .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  a_im_x_b_im_reg_reg_30_ ( .clear(N0), .preset(1'b0), 
        .next_state(a_im_x_b_im[30]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(a_im_x_b_im_reg[30]), .synch_clear(1'b0), 
        .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  a_im_x_b_im_reg_reg_29_ ( .clear(N0), .preset(1'b0), 
        .next_state(a_im_x_b_im[29]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(a_im_x_b_im_reg[29]), .synch_clear(1'b0), 
        .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  a_im_x_b_im_reg_reg_28_ ( .clear(N0), .preset(1'b0), 
        .next_state(a_im_x_b_im[28]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(a_im_x_b_im_reg[28]), .synch_clear(1'b0), 
        .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  a_im_x_b_im_reg_reg_27_ ( .clear(N0), .preset(1'b0), 
        .next_state(a_im_x_b_im[27]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(a_im_x_b_im_reg[27]), .synch_clear(1'b0), 
        .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  a_im_x_b_im_reg_reg_26_ ( .clear(N0), .preset(1'b0), 
        .next_state(a_im_x_b_im[26]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(a_im_x_b_im_reg[26]), .synch_clear(1'b0), 
        .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  a_im_x_b_im_reg_reg_25_ ( .clear(N0), .preset(1'b0), 
        .next_state(a_im_x_b_im[25]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(a_im_x_b_im_reg[25]), .synch_clear(1'b0), 
        .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  a_im_x_b_im_reg_reg_24_ ( .clear(N0), .preset(1'b0), 
        .next_state(a_im_x_b_im[24]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(a_im_x_b_im_reg[24]), .synch_clear(1'b0), 
        .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  a_im_x_b_im_reg_reg_23_ ( .clear(N0), .preset(1'b0), 
        .next_state(a_im_x_b_im[23]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(a_im_x_b_im_reg[23]), .synch_clear(1'b0), 
        .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  a_im_x_b_im_reg_reg_22_ ( .clear(N0), .preset(1'b0), 
        .next_state(a_im_x_b_im[22]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(a_im_x_b_im_reg[22]), .synch_clear(1'b0), 
        .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  a_im_x_b_im_reg_reg_21_ ( .clear(N0), .preset(1'b0), 
        .next_state(a_im_x_b_im[21]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(a_im_x_b_im_reg[21]), .synch_clear(1'b0), 
        .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  a_im_x_b_im_reg_reg_20_ ( .clear(N0), .preset(1'b0), 
        .next_state(a_im_x_b_im[20]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(a_im_x_b_im_reg[20]), .synch_clear(1'b0), 
        .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  a_im_x_b_im_reg_reg_19_ ( .clear(N0), .preset(1'b0), 
        .next_state(a_im_x_b_im[19]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(a_im_x_b_im_reg[19]), .synch_clear(1'b0), 
        .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  a_im_x_b_im_reg_reg_18_ ( .clear(N0), .preset(1'b0), 
        .next_state(a_im_x_b_im[18]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(a_im_x_b_im_reg[18]), .synch_clear(1'b0), 
        .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  a_im_x_b_im_reg_reg_17_ ( .clear(N0), .preset(1'b0), 
        .next_state(a_im_x_b_im[17]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(a_im_x_b_im_reg[17]), .synch_clear(1'b0), 
        .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  a_im_x_b_im_reg_reg_16_ ( .clear(N0), .preset(1'b0), 
        .next_state(a_im_x_b_im[16]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(a_im_x_b_im_reg[16]), .synch_clear(1'b0), 
        .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  a_im_x_b_im_reg_reg_15_ ( .clear(N0), .preset(1'b0), 
        .next_state(a_im_x_b_im[15]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(a_im_x_b_im_reg[15]), .synch_clear(1'b0), 
        .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  a_im_x_b_im_reg_reg_14_ ( .clear(N0), .preset(1'b0), 
        .next_state(a_im_x_b_im[14]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(a_im_x_b_im_reg[14]), .synch_clear(1'b0), 
        .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  a_im_x_b_im_reg_reg_13_ ( .clear(N0), .preset(1'b0), 
        .next_state(a_im_x_b_im[13]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(a_im_x_b_im_reg[13]), .synch_clear(1'b0), 
        .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  a_im_x_b_im_reg_reg_12_ ( .clear(N0), .preset(1'b0), 
        .next_state(a_im_x_b_im[12]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(a_im_x_b_im_reg[12]), .synch_clear(1'b0), 
        .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  a_im_x_b_im_reg_reg_11_ ( .clear(N0), .preset(1'b0), 
        .next_state(a_im_x_b_im[11]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(a_im_x_b_im_reg[11]), .synch_clear(1'b0), 
        .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  a_im_x_b_im_reg_reg_10_ ( .clear(N0), .preset(1'b0), 
        .next_state(a_im_x_b_im[10]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(a_im_x_b_im_reg[10]), .synch_clear(1'b0), 
        .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  a_im_x_b_im_reg_reg_9_ ( .clear(N0), .preset(1'b0), 
        .next_state(a_im_x_b_im[9]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(a_im_x_b_im_reg[9]), .synch_clear(1'b0), 
        .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  a_im_x_b_im_reg_reg_8_ ( .clear(N0), .preset(1'b0), 
        .next_state(a_im_x_b_im[8]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(a_im_x_b_im_reg[8]), .synch_clear(1'b0), 
        .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  a_im_x_b_im_reg_reg_7_ ( .clear(N0), .preset(1'b0), 
        .next_state(a_im_x_b_im[7]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(a_im_x_b_im_reg[7]), .synch_clear(1'b0), 
        .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  a_im_x_b_im_reg_reg_6_ ( .clear(N0), .preset(1'b0), 
        .next_state(a_im_x_b_im[6]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(a_im_x_b_im_reg[6]), .synch_clear(1'b0), 
        .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  a_im_x_b_im_reg_reg_5_ ( .clear(N0), .preset(1'b0), 
        .next_state(a_im_x_b_im[5]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(a_im_x_b_im_reg[5]), .synch_clear(1'b0), 
        .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  a_im_x_b_im_reg_reg_4_ ( .clear(N0), .preset(1'b0), 
        .next_state(a_im_x_b_im[4]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(a_im_x_b_im_reg[4]), .synch_clear(1'b0), 
        .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  a_im_x_b_im_reg_reg_3_ ( .clear(N0), .preset(1'b0), 
        .next_state(a_im_x_b_im[3]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(a_im_x_b_im_reg[3]), .synch_clear(1'b0), 
        .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  a_im_x_b_im_reg_reg_2_ ( .clear(N0), .preset(1'b0), 
        .next_state(a_im_x_b_im[2]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(a_im_x_b_im_reg[2]), .synch_clear(1'b0), 
        .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  a_im_x_b_im_reg_reg_1_ ( .clear(N0), .preset(1'b0), 
        .next_state(a_im_x_b_im[1]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(a_im_x_b_im_reg[1]), .synch_clear(1'b0), 
        .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  a_im_x_b_im_reg_reg_0_ ( .clear(N0), .preset(1'b0), 
        .next_state(a_im_x_b_im[0]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(a_im_x_b_im_reg[0]), .synch_clear(1'b0), 
        .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  a_re_x_b_im_reg_reg_63_ ( .clear(N0), .preset(1'b0), 
        .next_state(a_re_x_b_im[63]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(a_re_x_b_im_reg[63]), .synch_clear(1'b0), 
        .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  a_re_x_b_im_reg_reg_62_ ( .clear(N0), .preset(1'b0), 
        .next_state(a_re_x_b_im[62]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(a_re_x_b_im_reg[62]), .synch_clear(1'b0), 
        .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  a_re_x_b_im_reg_reg_61_ ( .clear(N0), .preset(1'b0), 
        .next_state(a_re_x_b_im[61]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(a_re_x_b_im_reg[61]), .synch_clear(1'b0), 
        .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  a_re_x_b_im_reg_reg_60_ ( .clear(N0), .preset(1'b0), 
        .next_state(a_re_x_b_im[60]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(a_re_x_b_im_reg[60]), .synch_clear(1'b0), 
        .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  a_re_x_b_im_reg_reg_59_ ( .clear(N0), .preset(1'b0), 
        .next_state(a_re_x_b_im[59]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(a_re_x_b_im_reg[59]), .synch_clear(1'b0), 
        .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  a_re_x_b_im_reg_reg_58_ ( .clear(N0), .preset(1'b0), 
        .next_state(a_re_x_b_im[58]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(a_re_x_b_im_reg[58]), .synch_clear(1'b0), 
        .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  a_re_x_b_im_reg_reg_57_ ( .clear(N0), .preset(1'b0), 
        .next_state(a_re_x_b_im[57]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(a_re_x_b_im_reg[57]), .synch_clear(1'b0), 
        .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  a_re_x_b_im_reg_reg_56_ ( .clear(N0), .preset(1'b0), 
        .next_state(a_re_x_b_im[56]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(a_re_x_b_im_reg[56]), .synch_clear(1'b0), 
        .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  a_re_x_b_im_reg_reg_55_ ( .clear(N0), .preset(1'b0), 
        .next_state(a_re_x_b_im[55]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(a_re_x_b_im_reg[55]), .synch_clear(1'b0), 
        .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  a_re_x_b_im_reg_reg_54_ ( .clear(N0), .preset(1'b0), 
        .next_state(a_re_x_b_im[54]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(a_re_x_b_im_reg[54]), .synch_clear(1'b0), 
        .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  a_re_x_b_im_reg_reg_53_ ( .clear(N0), .preset(1'b0), 
        .next_state(a_re_x_b_im[53]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(a_re_x_b_im_reg[53]), .synch_clear(1'b0), 
        .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  a_re_x_b_im_reg_reg_52_ ( .clear(N0), .preset(1'b0), 
        .next_state(a_re_x_b_im[52]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(a_re_x_b_im_reg[52]), .synch_clear(1'b0), 
        .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  a_re_x_b_im_reg_reg_51_ ( .clear(N0), .preset(1'b0), 
        .next_state(a_re_x_b_im[51]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(a_re_x_b_im_reg[51]), .synch_clear(1'b0), 
        .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  a_re_x_b_im_reg_reg_50_ ( .clear(N0), .preset(1'b0), 
        .next_state(a_re_x_b_im[50]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(a_re_x_b_im_reg[50]), .synch_clear(1'b0), 
        .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  a_re_x_b_im_reg_reg_49_ ( .clear(N0), .preset(1'b0), 
        .next_state(a_re_x_b_im[49]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(a_re_x_b_im_reg[49]), .synch_clear(1'b0), 
        .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  a_re_x_b_im_reg_reg_48_ ( .clear(N0), .preset(1'b0), 
        .next_state(a_re_x_b_im[48]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(a_re_x_b_im_reg[48]), .synch_clear(1'b0), 
        .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  a_re_x_b_im_reg_reg_47_ ( .clear(N0), .preset(1'b0), 
        .next_state(a_re_x_b_im[47]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(a_re_x_b_im_reg[47]), .synch_clear(1'b0), 
        .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  a_re_x_b_im_reg_reg_46_ ( .clear(N0), .preset(1'b0), 
        .next_state(a_re_x_b_im[46]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(a_re_x_b_im_reg[46]), .synch_clear(1'b0), 
        .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  a_re_x_b_im_reg_reg_45_ ( .clear(N0), .preset(1'b0), 
        .next_state(a_re_x_b_im[45]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(a_re_x_b_im_reg[45]), .synch_clear(1'b0), 
        .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  a_re_x_b_im_reg_reg_44_ ( .clear(N0), .preset(1'b0), 
        .next_state(a_re_x_b_im[44]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(a_re_x_b_im_reg[44]), .synch_clear(1'b0), 
        .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  a_re_x_b_im_reg_reg_43_ ( .clear(N0), .preset(1'b0), 
        .next_state(a_re_x_b_im[43]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(a_re_x_b_im_reg[43]), .synch_clear(1'b0), 
        .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  a_re_x_b_im_reg_reg_42_ ( .clear(N0), .preset(1'b0), 
        .next_state(a_re_x_b_im[42]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(a_re_x_b_im_reg[42]), .synch_clear(1'b0), 
        .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  a_re_x_b_im_reg_reg_41_ ( .clear(N0), .preset(1'b0), 
        .next_state(a_re_x_b_im[41]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(a_re_x_b_im_reg[41]), .synch_clear(1'b0), 
        .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  a_re_x_b_im_reg_reg_40_ ( .clear(N0), .preset(1'b0), 
        .next_state(a_re_x_b_im[40]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(a_re_x_b_im_reg[40]), .synch_clear(1'b0), 
        .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  a_re_x_b_im_reg_reg_39_ ( .clear(N0), .preset(1'b0), 
        .next_state(a_re_x_b_im[39]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(a_re_x_b_im_reg[39]), .synch_clear(1'b0), 
        .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  a_re_x_b_im_reg_reg_38_ ( .clear(N0), .preset(1'b0), 
        .next_state(a_re_x_b_im[38]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(a_re_x_b_im_reg[38]), .synch_clear(1'b0), 
        .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  a_re_x_b_im_reg_reg_37_ ( .clear(N0), .preset(1'b0), 
        .next_state(a_re_x_b_im[37]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(a_re_x_b_im_reg[37]), .synch_clear(1'b0), 
        .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  a_re_x_b_im_reg_reg_36_ ( .clear(N0), .preset(1'b0), 
        .next_state(a_re_x_b_im[36]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(a_re_x_b_im_reg[36]), .synch_clear(1'b0), 
        .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  a_re_x_b_im_reg_reg_35_ ( .clear(N0), .preset(1'b0), 
        .next_state(a_re_x_b_im[35]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(a_re_x_b_im_reg[35]), .synch_clear(1'b0), 
        .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  a_re_x_b_im_reg_reg_34_ ( .clear(N0), .preset(1'b0), 
        .next_state(a_re_x_b_im[34]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(a_re_x_b_im_reg[34]), .synch_clear(1'b0), 
        .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  a_re_x_b_im_reg_reg_33_ ( .clear(N0), .preset(1'b0), 
        .next_state(a_re_x_b_im[33]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(a_re_x_b_im_reg[33]), .synch_clear(1'b0), 
        .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  a_re_x_b_im_reg_reg_32_ ( .clear(N0), .preset(1'b0), 
        .next_state(a_re_x_b_im[32]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(a_re_x_b_im_reg[32]), .synch_clear(1'b0), 
        .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  a_re_x_b_im_reg_reg_31_ ( .clear(N0), .preset(1'b0), 
        .next_state(a_re_x_b_im[31]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(a_re_x_b_im_reg[31]), .synch_clear(1'b0), 
        .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  a_re_x_b_im_reg_reg_30_ ( .clear(N0), .preset(1'b0), 
        .next_state(a_re_x_b_im[30]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(a_re_x_b_im_reg[30]), .synch_clear(1'b0), 
        .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  a_re_x_b_im_reg_reg_29_ ( .clear(N0), .preset(1'b0), 
        .next_state(a_re_x_b_im[29]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(a_re_x_b_im_reg[29]), .synch_clear(1'b0), 
        .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  a_re_x_b_im_reg_reg_28_ ( .clear(N0), .preset(1'b0), 
        .next_state(a_re_x_b_im[28]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(a_re_x_b_im_reg[28]), .synch_clear(1'b0), 
        .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  a_re_x_b_im_reg_reg_27_ ( .clear(N0), .preset(1'b0), 
        .next_state(a_re_x_b_im[27]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(a_re_x_b_im_reg[27]), .synch_clear(1'b0), 
        .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  a_re_x_b_im_reg_reg_26_ ( .clear(N0), .preset(1'b0), 
        .next_state(a_re_x_b_im[26]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(a_re_x_b_im_reg[26]), .synch_clear(1'b0), 
        .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  a_re_x_b_im_reg_reg_25_ ( .clear(N0), .preset(1'b0), 
        .next_state(a_re_x_b_im[25]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(a_re_x_b_im_reg[25]), .synch_clear(1'b0), 
        .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  a_re_x_b_im_reg_reg_24_ ( .clear(N0), .preset(1'b0), 
        .next_state(a_re_x_b_im[24]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(a_re_x_b_im_reg[24]), .synch_clear(1'b0), 
        .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  a_re_x_b_im_reg_reg_23_ ( .clear(N0), .preset(1'b0), 
        .next_state(a_re_x_b_im[23]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(a_re_x_b_im_reg[23]), .synch_clear(1'b0), 
        .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  a_re_x_b_im_reg_reg_22_ ( .clear(N0), .preset(1'b0), 
        .next_state(a_re_x_b_im[22]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(a_re_x_b_im_reg[22]), .synch_clear(1'b0), 
        .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  a_re_x_b_im_reg_reg_21_ ( .clear(N0), .preset(1'b0), 
        .next_state(a_re_x_b_im[21]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(a_re_x_b_im_reg[21]), .synch_clear(1'b0), 
        .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  a_re_x_b_im_reg_reg_20_ ( .clear(N0), .preset(1'b0), 
        .next_state(a_re_x_b_im[20]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(a_re_x_b_im_reg[20]), .synch_clear(1'b0), 
        .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  a_re_x_b_im_reg_reg_19_ ( .clear(N0), .preset(1'b0), 
        .next_state(a_re_x_b_im[19]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(a_re_x_b_im_reg[19]), .synch_clear(1'b0), 
        .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  a_re_x_b_im_reg_reg_18_ ( .clear(N0), .preset(1'b0), 
        .next_state(a_re_x_b_im[18]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(a_re_x_b_im_reg[18]), .synch_clear(1'b0), 
        .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  a_re_x_b_im_reg_reg_17_ ( .clear(N0), .preset(1'b0), 
        .next_state(a_re_x_b_im[17]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(a_re_x_b_im_reg[17]), .synch_clear(1'b0), 
        .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  a_re_x_b_im_reg_reg_16_ ( .clear(N0), .preset(1'b0), 
        .next_state(a_re_x_b_im[16]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(a_re_x_b_im_reg[16]), .synch_clear(1'b0), 
        .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  a_re_x_b_im_reg_reg_15_ ( .clear(N0), .preset(1'b0), 
        .next_state(a_re_x_b_im[15]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(a_re_x_b_im_reg[15]), .synch_clear(1'b0), 
        .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  a_re_x_b_im_reg_reg_14_ ( .clear(N0), .preset(1'b0), 
        .next_state(a_re_x_b_im[14]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(a_re_x_b_im_reg[14]), .synch_clear(1'b0), 
        .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  a_re_x_b_im_reg_reg_13_ ( .clear(N0), .preset(1'b0), 
        .next_state(a_re_x_b_im[13]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(a_re_x_b_im_reg[13]), .synch_clear(1'b0), 
        .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  a_re_x_b_im_reg_reg_12_ ( .clear(N0), .preset(1'b0), 
        .next_state(a_re_x_b_im[12]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(a_re_x_b_im_reg[12]), .synch_clear(1'b0), 
        .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  a_re_x_b_im_reg_reg_11_ ( .clear(N0), .preset(1'b0), 
        .next_state(a_re_x_b_im[11]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(a_re_x_b_im_reg[11]), .synch_clear(1'b0), 
        .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  a_re_x_b_im_reg_reg_10_ ( .clear(N0), .preset(1'b0), 
        .next_state(a_re_x_b_im[10]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(a_re_x_b_im_reg[10]), .synch_clear(1'b0), 
        .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  a_re_x_b_im_reg_reg_9_ ( .clear(N0), .preset(1'b0), 
        .next_state(a_re_x_b_im[9]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(a_re_x_b_im_reg[9]), .synch_clear(1'b0), 
        .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  a_re_x_b_im_reg_reg_8_ ( .clear(N0), .preset(1'b0), 
        .next_state(a_re_x_b_im[8]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(a_re_x_b_im_reg[8]), .synch_clear(1'b0), 
        .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  a_re_x_b_im_reg_reg_7_ ( .clear(N0), .preset(1'b0), 
        .next_state(a_re_x_b_im[7]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(a_re_x_b_im_reg[7]), .synch_clear(1'b0), 
        .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  a_re_x_b_im_reg_reg_6_ ( .clear(N0), .preset(1'b0), 
        .next_state(a_re_x_b_im[6]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(a_re_x_b_im_reg[6]), .synch_clear(1'b0), 
        .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  a_re_x_b_im_reg_reg_5_ ( .clear(N0), .preset(1'b0), 
        .next_state(a_re_x_b_im[5]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(a_re_x_b_im_reg[5]), .synch_clear(1'b0), 
        .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  a_re_x_b_im_reg_reg_4_ ( .clear(N0), .preset(1'b0), 
        .next_state(a_re_x_b_im[4]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(a_re_x_b_im_reg[4]), .synch_clear(1'b0), 
        .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  a_re_x_b_im_reg_reg_3_ ( .clear(N0), .preset(1'b0), 
        .next_state(a_re_x_b_im[3]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(a_re_x_b_im_reg[3]), .synch_clear(1'b0), 
        .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  a_re_x_b_im_reg_reg_2_ ( .clear(N0), .preset(1'b0), 
        .next_state(a_re_x_b_im[2]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(a_re_x_b_im_reg[2]), .synch_clear(1'b0), 
        .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  a_re_x_b_im_reg_reg_1_ ( .clear(N0), .preset(1'b0), 
        .next_state(a_re_x_b_im[1]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(a_re_x_b_im_reg[1]), .synch_clear(1'b0), 
        .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  a_re_x_b_im_reg_reg_0_ ( .clear(N0), .preset(1'b0), 
        .next_state(a_re_x_b_im[0]), .clocked_on(clk), .data_in(1'b0), 
        .enable(1'b0), .Q(a_re_x_b_im_reg[0]), .synch_clear(1'b0), 
        .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  GTECH_NOT I_0 ( .A(rst_n), .Z(N0) );
endmodule


module FPC_SUB ( a_re, a_im, b_re, b_im, d_re, d_im );
  input [63:0] a_re;
  input [63:0] a_im;
  input [63:0] b_re;
  input [63:0] b_im;
  output [63:0] d_re;
  output [63:0] d_im;
  wire   net446, net447, net448, net449, net450, net451, net452, net453,
         net454, net455, net456, net457, net458, net459, net460, net461;

  DW_fp_sub u_FPR_SUB_0 ( .a(a_re), .b(b_re), .rnd({1'b0, 1'b0, 1'b0}), .z(
        d_re), .status({net446, net447, net448, net449, net450, net451, net452, 
        net453}) );
  DW_fp_sub u_FPR_SUB_1 ( .a(a_im), .b(b_im), .rnd({1'b0, 1'b0, 1'b0}), .z(
        d_im), .status({net454, net455, net456, net457, net458, net459, net460, 
        net461}) );
endmodule


module FPC_ADD ( a_re, a_im, b_re, b_im, d_re, d_im );
  input [63:0] a_re;
  input [63:0] a_im;
  input [63:0] b_re;
  input [63:0] b_im;
  output [63:0] d_re;
  output [63:0] d_im;
  wire   net19, net20, net21, net22, net23, net24, net25, net26, net27, net28,
         net29, net30, net31, net32, net33, net34;

  DW_fp_add u_FPR_ADD_0 ( .a(a_re), .b(b_re), .rnd({1'b0, 1'b0, 1'b0}), .z(
        d_re), .status({net19, net20, net21, net22, net23, net24, net25, net26}) );
  DW_fp_add u_FPR_ADD_1 ( .a(a_im), .b(b_im), .rnd({1'b0, 1'b0, 1'b0}), .z(
        d_im), .status({net27, net28, net29, net30, net31, net32, net33, net34}) );
endmodule

