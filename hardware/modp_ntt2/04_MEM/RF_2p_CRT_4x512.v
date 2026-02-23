/* FE Release Version: 3.4.22 */
/* lang compiler Version: 3.0.4 */
//
//       CONFIDENTIAL AND PROPRIETARY SOFTWARE OF ARM PHYSICAL IP, INC.
//      
//       Copyright (c) 1993 - 2026 ARM Physical IP, Inc.  All Rights Reserved.
//      
//       Use of this Software is subject to the terms and conditions of the
//       applicable license agreement with ARM Physical IP, Inc.
//       In addition, this Software is protected by patents, copyright law 
//       and international treaties.
//      
//       The copyright notice(s) in this Software does not indicate actual or
//       intended publication of this Software.
//
//      Verilog model for Synchronous Two-Port Register File
//
//       Instance Name:              RF_2p_CRT_4x512
//       Words:                      512
//       Bits:                       124
//       Mux:                        2
//       Drive:                      4
//       Write Mask:                 Off
//       Write Thru:                 Off
//       Extra Margin Adjustment:    On
//       Redundant Rows:             0
//       Redundant Columns:          0
//       Test Muxes                  On
//       Power Gating:               Off
//       Retention:                  On
//       Pipeline:                   Off
//       Weak Bit Test:	        Off
//       Read Disturb Test:	        Off
//       
//       Creation Date:  Tue Feb 10 17:53:50 2026
//       Version: 	r9p1
//
//      Modeling Assumptions: This model supports full gate level simulation
//          including proper x-handling and timing check behavior.  Unit
//          delay timing is included in the model. Back-annotation of SDF
//          (v3.0 or v2.1) is supported.  SDF can be created utilyzing the delay
//          calculation views provided with this generator and supported
//          delay calculators.  All buses are modeled [MSB:LSB].  All 
//          ports are padded with Verilog primitives.
//
//      Modeling Limitations: None.
//
//      Known Bugs: None.
//
//      Known Work Arounds: N/A
//
`timescale 1 ns/1 ps
// If ARM_UD_MODEL is defined at Simulator Command Line, it Selects the Fast Functional Model
`ifdef ARM_UD_MODEL

// Following parameter Values can be overridden at Simulator Command Line.

// ARM_UD_DP Defines the delay through Data Paths, for Memory Models it represents BIST MUX output delays.
`ifdef ARM_UD_DP
`else
`define ARM_UD_DP #0.001
`endif
// ARM_UD_CP Defines the delay through Clock Path Cells, for Memory Models it is not used.
`ifdef ARM_UD_CP
`else
`define ARM_UD_CP
`endif
// ARM_UD_SEQ Defines the delay through the Memory, for Memory Models it is used for CLK->Q delays.
`ifdef ARM_UD_SEQ
`else
`define ARM_UD_SEQ #0.01
`endif

`celldefine
// If POWER_PINS is defined at Simulator Command Line, it selects the module definition with Power Ports
`ifdef POWER_PINS
module RF_2p_CRT_4x512 (VDDCE, VDDPE, VSSE, CENYA, AYA, CENYB, AYB, DYB, QA, CLKA,
    CENA, AA, CLKB, CENB, AB, DB, EMAA, EMASA, EMAB, EMAWB, TENA, BENA, TCENA, TAA,
    TQA, TENB, TCENB, TAB, TDB, RET1N, STOVA, STOVB, COLLDISN);
`else
module RF_2p_CRT_4x512 (CENYA, AYA, CENYB, AYB, DYB, QA, CLKA, CENA, AA, CLKB, CENB,
    AB, DB, EMAA, EMASA, EMAB, EMAWB, TENA, BENA, TCENA, TAA, TQA, TENB, TCENB, TAB,
    TDB, RET1N, STOVA, STOVB, COLLDISN);
`endif

  parameter ASSERT_PREFIX = "";
  parameter BITS = 124;
  parameter WORDS = 512;
  parameter MUX = 2;
  parameter MEM_WIDTH = 248; // redun block size 2, 124 on left, 124 on right
  parameter MEM_HEIGHT = 256;
  parameter WP_SIZE = 124 ;
  parameter UPM_WIDTH = 3;
  parameter UPMW_WIDTH = 2;
  parameter UPMS_WIDTH = 1;

  output  CENYA;
  output [8:0] AYA;
  output  CENYB;
  output [8:0] AYB;
  output [123:0] DYB;
  output [123:0] QA;
  input  CLKA;
  input  CENA;
  input [8:0] AA;
  input  CLKB;
  input  CENB;
  input [8:0] AB;
  input [123:0] DB;
  input [2:0] EMAA;
  input  EMASA;
  input [2:0] EMAB;
  input [1:0] EMAWB;
  input  TENA;
  input  BENA;
  input  TCENA;
  input [8:0] TAA;
  input [123:0] TQA;
  input  TENB;
  input  TCENB;
  input [8:0] TAB;
  input [123:0] TDB;
  input  RET1N;
  input  STOVA;
  input  STOVB;
  input  COLLDISN;
`ifdef POWER_PINS
  inout VDDCE;
  inout VDDPE;
  inout VSSE;
`endif

  integer row_address;
  integer mux_address;
  reg [247:0] mem [0:255];
  reg [247:0] row;
  reg LAST_CLKA;
  reg [247:0] row_mask;
  reg [247:0] new_data;
  reg [247:0] data_out;
  reg LAST_CLKB;
  reg [123:0] QA_int;
  reg [123:0] QA_int_delayed;
  reg [123:0] writeEnable;
  real previous_CLKA;
  real previous_CLKB;
  initial previous_CLKA = 0;
  initial previous_CLKB = 0;
  reg READ_WRITE, WRITE_WRITE, READ_READ, ROW_CC, COL_CC;
  reg READ_WRITE_1, WRITE_WRITE_1, READ_READ_1;
  reg  cont_flag0_int;
  reg  cont_flag1_int;
  initial cont_flag0_int = 1'b0;
  initial cont_flag1_int = 1'b0;

  reg NOT_CENA, NOT_AA8, NOT_AA7, NOT_AA6, NOT_AA5, NOT_AA4, NOT_AA3, NOT_AA2, NOT_AA1;
  reg NOT_AA0, NOT_CENB, NOT_AB8, NOT_AB7, NOT_AB6, NOT_AB5, NOT_AB4, NOT_AB3, NOT_AB2;
  reg NOT_AB1, NOT_AB0, NOT_DB123, NOT_DB122, NOT_DB121, NOT_DB120, NOT_DB119, NOT_DB118;
  reg NOT_DB117, NOT_DB116, NOT_DB115, NOT_DB114, NOT_DB113, NOT_DB112, NOT_DB111;
  reg NOT_DB110, NOT_DB109, NOT_DB108, NOT_DB107, NOT_DB106, NOT_DB105, NOT_DB104;
  reg NOT_DB103, NOT_DB102, NOT_DB101, NOT_DB100, NOT_DB99, NOT_DB98, NOT_DB97, NOT_DB96;
  reg NOT_DB95, NOT_DB94, NOT_DB93, NOT_DB92, NOT_DB91, NOT_DB90, NOT_DB89, NOT_DB88;
  reg NOT_DB87, NOT_DB86, NOT_DB85, NOT_DB84, NOT_DB83, NOT_DB82, NOT_DB81, NOT_DB80;
  reg NOT_DB79, NOT_DB78, NOT_DB77, NOT_DB76, NOT_DB75, NOT_DB74, NOT_DB73, NOT_DB72;
  reg NOT_DB71, NOT_DB70, NOT_DB69, NOT_DB68, NOT_DB67, NOT_DB66, NOT_DB65, NOT_DB64;
  reg NOT_DB63, NOT_DB62, NOT_DB61, NOT_DB60, NOT_DB59, NOT_DB58, NOT_DB57, NOT_DB56;
  reg NOT_DB55, NOT_DB54, NOT_DB53, NOT_DB52, NOT_DB51, NOT_DB50, NOT_DB49, NOT_DB48;
  reg NOT_DB47, NOT_DB46, NOT_DB45, NOT_DB44, NOT_DB43, NOT_DB42, NOT_DB41, NOT_DB40;
  reg NOT_DB39, NOT_DB38, NOT_DB37, NOT_DB36, NOT_DB35, NOT_DB34, NOT_DB33, NOT_DB32;
  reg NOT_DB31, NOT_DB30, NOT_DB29, NOT_DB28, NOT_DB27, NOT_DB26, NOT_DB25, NOT_DB24;
  reg NOT_DB23, NOT_DB22, NOT_DB21, NOT_DB20, NOT_DB19, NOT_DB18, NOT_DB17, NOT_DB16;
  reg NOT_DB15, NOT_DB14, NOT_DB13, NOT_DB12, NOT_DB11, NOT_DB10, NOT_DB9, NOT_DB8;
  reg NOT_DB7, NOT_DB6, NOT_DB5, NOT_DB4, NOT_DB3, NOT_DB2, NOT_DB1, NOT_DB0, NOT_EMAA2;
  reg NOT_EMAA1, NOT_EMAA0, NOT_EMASA, NOT_EMAB2, NOT_EMAB1, NOT_EMAB0, NOT_EMAWB1;
  reg NOT_EMAWB0, NOT_TENA, NOT_TCENA, NOT_TAA8, NOT_TAA7, NOT_TAA6, NOT_TAA5, NOT_TAA4;
  reg NOT_TAA3, NOT_TAA2, NOT_TAA1, NOT_TAA0, NOT_TENB, NOT_TCENB, NOT_TAB8, NOT_TAB7;
  reg NOT_TAB6, NOT_TAB5, NOT_TAB4, NOT_TAB3, NOT_TAB2, NOT_TAB1, NOT_TAB0, NOT_TDB123;
  reg NOT_TDB122, NOT_TDB121, NOT_TDB120, NOT_TDB119, NOT_TDB118, NOT_TDB117, NOT_TDB116;
  reg NOT_TDB115, NOT_TDB114, NOT_TDB113, NOT_TDB112, NOT_TDB111, NOT_TDB110, NOT_TDB109;
  reg NOT_TDB108, NOT_TDB107, NOT_TDB106, NOT_TDB105, NOT_TDB104, NOT_TDB103, NOT_TDB102;
  reg NOT_TDB101, NOT_TDB100, NOT_TDB99, NOT_TDB98, NOT_TDB97, NOT_TDB96, NOT_TDB95;
  reg NOT_TDB94, NOT_TDB93, NOT_TDB92, NOT_TDB91, NOT_TDB90, NOT_TDB89, NOT_TDB88;
  reg NOT_TDB87, NOT_TDB86, NOT_TDB85, NOT_TDB84, NOT_TDB83, NOT_TDB82, NOT_TDB81;
  reg NOT_TDB80, NOT_TDB79, NOT_TDB78, NOT_TDB77, NOT_TDB76, NOT_TDB75, NOT_TDB74;
  reg NOT_TDB73, NOT_TDB72, NOT_TDB71, NOT_TDB70, NOT_TDB69, NOT_TDB68, NOT_TDB67;
  reg NOT_TDB66, NOT_TDB65, NOT_TDB64, NOT_TDB63, NOT_TDB62, NOT_TDB61, NOT_TDB60;
  reg NOT_TDB59, NOT_TDB58, NOT_TDB57, NOT_TDB56, NOT_TDB55, NOT_TDB54, NOT_TDB53;
  reg NOT_TDB52, NOT_TDB51, NOT_TDB50, NOT_TDB49, NOT_TDB48, NOT_TDB47, NOT_TDB46;
  reg NOT_TDB45, NOT_TDB44, NOT_TDB43, NOT_TDB42, NOT_TDB41, NOT_TDB40, NOT_TDB39;
  reg NOT_TDB38, NOT_TDB37, NOT_TDB36, NOT_TDB35, NOT_TDB34, NOT_TDB33, NOT_TDB32;
  reg NOT_TDB31, NOT_TDB30, NOT_TDB29, NOT_TDB28, NOT_TDB27, NOT_TDB26, NOT_TDB25;
  reg NOT_TDB24, NOT_TDB23, NOT_TDB22, NOT_TDB21, NOT_TDB20, NOT_TDB19, NOT_TDB18;
  reg NOT_TDB17, NOT_TDB16, NOT_TDB15, NOT_TDB14, NOT_TDB13, NOT_TDB12, NOT_TDB11;
  reg NOT_TDB10, NOT_TDB9, NOT_TDB8, NOT_TDB7, NOT_TDB6, NOT_TDB5, NOT_TDB4, NOT_TDB3;
  reg NOT_TDB2, NOT_TDB1, NOT_TDB0, NOT_RET1N, NOT_STOVA, NOT_STOVB, NOT_COLLDISN;
  reg NOT_CONTA, NOT_CLKA_PER, NOT_CLKA_MINH, NOT_CLKA_MINL, NOT_CONTB, NOT_CLKB_PER;
  reg NOT_CLKB_MINH, NOT_CLKB_MINL;
  reg clk0_int;
  reg clk1_int;

  wire  CENYA_;
  wire [8:0] AYA_;
  wire  CENYB_;
  wire [8:0] AYB_;
  wire [123:0] DYB_;
  wire [123:0] QA_;
 wire  CLKA_;
  wire  CENA_;
  reg  CENA_int;
  reg  CENA_p2;
  wire [8:0] AA_;
  reg [8:0] AA_int;
 wire  CLKB_;
  wire  CENB_;
  reg  CENB_int;
  reg  CENB_p2;
  wire [8:0] AB_;
  reg [8:0] AB_int;
  wire [123:0] DB_;
  reg [123:0] DB_int;
  wire [2:0] EMAA_;
  reg [2:0] EMAA_int;
  wire  EMASA_;
  reg  EMASA_int;
  wire [2:0] EMAB_;
  reg [2:0] EMAB_int;
  wire [1:0] EMAWB_;
  reg [1:0] EMAWB_int;
  wire  TENA_;
  reg  TENA_int;
  wire  BENA_;
  reg  BENA_int;
  wire  TCENA_;
  reg  TCENA_int;
  reg  TCENA_p2;
  wire [8:0] TAA_;
  reg [8:0] TAA_int;
  wire [123:0] TQA_;
  reg [123:0] TQA_int;
  wire  TENB_;
  reg  TENB_int;
  wire  TCENB_;
  reg  TCENB_int;
  reg  TCENB_p2;
  wire [8:0] TAB_;
  reg [8:0] TAB_int;
  wire [123:0] TDB_;
  reg [123:0] TDB_int;
  wire  RET1N_;
  reg  RET1N_int;
  wire  STOVA_;
  reg  STOVA_int;
  wire  STOVB_;
  reg  STOVB_int;
  wire  COLLDISN_;
  reg  COLLDISN_int;

  assign CENYA = CENYA_; 
  assign AYA[0] = AYA_[0]; 
  assign AYA[1] = AYA_[1]; 
  assign AYA[2] = AYA_[2]; 
  assign AYA[3] = AYA_[3]; 
  assign AYA[4] = AYA_[4]; 
  assign AYA[5] = AYA_[5]; 
  assign AYA[6] = AYA_[6]; 
  assign AYA[7] = AYA_[7]; 
  assign AYA[8] = AYA_[8]; 
  assign CENYB = CENYB_; 
  assign AYB[0] = AYB_[0]; 
  assign AYB[1] = AYB_[1]; 
  assign AYB[2] = AYB_[2]; 
  assign AYB[3] = AYB_[3]; 
  assign AYB[4] = AYB_[4]; 
  assign AYB[5] = AYB_[5]; 
  assign AYB[6] = AYB_[6]; 
  assign AYB[7] = AYB_[7]; 
  assign AYB[8] = AYB_[8]; 
  assign DYB[0] = DYB_[0]; 
  assign DYB[1] = DYB_[1]; 
  assign DYB[2] = DYB_[2]; 
  assign DYB[3] = DYB_[3]; 
  assign DYB[4] = DYB_[4]; 
  assign DYB[5] = DYB_[5]; 
  assign DYB[6] = DYB_[6]; 
  assign DYB[7] = DYB_[7]; 
  assign DYB[8] = DYB_[8]; 
  assign DYB[9] = DYB_[9]; 
  assign DYB[10] = DYB_[10]; 
  assign DYB[11] = DYB_[11]; 
  assign DYB[12] = DYB_[12]; 
  assign DYB[13] = DYB_[13]; 
  assign DYB[14] = DYB_[14]; 
  assign DYB[15] = DYB_[15]; 
  assign DYB[16] = DYB_[16]; 
  assign DYB[17] = DYB_[17]; 
  assign DYB[18] = DYB_[18]; 
  assign DYB[19] = DYB_[19]; 
  assign DYB[20] = DYB_[20]; 
  assign DYB[21] = DYB_[21]; 
  assign DYB[22] = DYB_[22]; 
  assign DYB[23] = DYB_[23]; 
  assign DYB[24] = DYB_[24]; 
  assign DYB[25] = DYB_[25]; 
  assign DYB[26] = DYB_[26]; 
  assign DYB[27] = DYB_[27]; 
  assign DYB[28] = DYB_[28]; 
  assign DYB[29] = DYB_[29]; 
  assign DYB[30] = DYB_[30]; 
  assign DYB[31] = DYB_[31]; 
  assign DYB[32] = DYB_[32]; 
  assign DYB[33] = DYB_[33]; 
  assign DYB[34] = DYB_[34]; 
  assign DYB[35] = DYB_[35]; 
  assign DYB[36] = DYB_[36]; 
  assign DYB[37] = DYB_[37]; 
  assign DYB[38] = DYB_[38]; 
  assign DYB[39] = DYB_[39]; 
  assign DYB[40] = DYB_[40]; 
  assign DYB[41] = DYB_[41]; 
  assign DYB[42] = DYB_[42]; 
  assign DYB[43] = DYB_[43]; 
  assign DYB[44] = DYB_[44]; 
  assign DYB[45] = DYB_[45]; 
  assign DYB[46] = DYB_[46]; 
  assign DYB[47] = DYB_[47]; 
  assign DYB[48] = DYB_[48]; 
  assign DYB[49] = DYB_[49]; 
  assign DYB[50] = DYB_[50]; 
  assign DYB[51] = DYB_[51]; 
  assign DYB[52] = DYB_[52]; 
  assign DYB[53] = DYB_[53]; 
  assign DYB[54] = DYB_[54]; 
  assign DYB[55] = DYB_[55]; 
  assign DYB[56] = DYB_[56]; 
  assign DYB[57] = DYB_[57]; 
  assign DYB[58] = DYB_[58]; 
  assign DYB[59] = DYB_[59]; 
  assign DYB[60] = DYB_[60]; 
  assign DYB[61] = DYB_[61]; 
  assign DYB[62] = DYB_[62]; 
  assign DYB[63] = DYB_[63]; 
  assign DYB[64] = DYB_[64]; 
  assign DYB[65] = DYB_[65]; 
  assign DYB[66] = DYB_[66]; 
  assign DYB[67] = DYB_[67]; 
  assign DYB[68] = DYB_[68]; 
  assign DYB[69] = DYB_[69]; 
  assign DYB[70] = DYB_[70]; 
  assign DYB[71] = DYB_[71]; 
  assign DYB[72] = DYB_[72]; 
  assign DYB[73] = DYB_[73]; 
  assign DYB[74] = DYB_[74]; 
  assign DYB[75] = DYB_[75]; 
  assign DYB[76] = DYB_[76]; 
  assign DYB[77] = DYB_[77]; 
  assign DYB[78] = DYB_[78]; 
  assign DYB[79] = DYB_[79]; 
  assign DYB[80] = DYB_[80]; 
  assign DYB[81] = DYB_[81]; 
  assign DYB[82] = DYB_[82]; 
  assign DYB[83] = DYB_[83]; 
  assign DYB[84] = DYB_[84]; 
  assign DYB[85] = DYB_[85]; 
  assign DYB[86] = DYB_[86]; 
  assign DYB[87] = DYB_[87]; 
  assign DYB[88] = DYB_[88]; 
  assign DYB[89] = DYB_[89]; 
  assign DYB[90] = DYB_[90]; 
  assign DYB[91] = DYB_[91]; 
  assign DYB[92] = DYB_[92]; 
  assign DYB[93] = DYB_[93]; 
  assign DYB[94] = DYB_[94]; 
  assign DYB[95] = DYB_[95]; 
  assign DYB[96] = DYB_[96]; 
  assign DYB[97] = DYB_[97]; 
  assign DYB[98] = DYB_[98]; 
  assign DYB[99] = DYB_[99]; 
  assign DYB[100] = DYB_[100]; 
  assign DYB[101] = DYB_[101]; 
  assign DYB[102] = DYB_[102]; 
  assign DYB[103] = DYB_[103]; 
  assign DYB[104] = DYB_[104]; 
  assign DYB[105] = DYB_[105]; 
  assign DYB[106] = DYB_[106]; 
  assign DYB[107] = DYB_[107]; 
  assign DYB[108] = DYB_[108]; 
  assign DYB[109] = DYB_[109]; 
  assign DYB[110] = DYB_[110]; 
  assign DYB[111] = DYB_[111]; 
  assign DYB[112] = DYB_[112]; 
  assign DYB[113] = DYB_[113]; 
  assign DYB[114] = DYB_[114]; 
  assign DYB[115] = DYB_[115]; 
  assign DYB[116] = DYB_[116]; 
  assign DYB[117] = DYB_[117]; 
  assign DYB[118] = DYB_[118]; 
  assign DYB[119] = DYB_[119]; 
  assign DYB[120] = DYB_[120]; 
  assign DYB[121] = DYB_[121]; 
  assign DYB[122] = DYB_[122]; 
  assign DYB[123] = DYB_[123]; 
  assign QA[0] = QA_[0]; 
  assign QA[1] = QA_[1]; 
  assign QA[2] = QA_[2]; 
  assign QA[3] = QA_[3]; 
  assign QA[4] = QA_[4]; 
  assign QA[5] = QA_[5]; 
  assign QA[6] = QA_[6]; 
  assign QA[7] = QA_[7]; 
  assign QA[8] = QA_[8]; 
  assign QA[9] = QA_[9]; 
  assign QA[10] = QA_[10]; 
  assign QA[11] = QA_[11]; 
  assign QA[12] = QA_[12]; 
  assign QA[13] = QA_[13]; 
  assign QA[14] = QA_[14]; 
  assign QA[15] = QA_[15]; 
  assign QA[16] = QA_[16]; 
  assign QA[17] = QA_[17]; 
  assign QA[18] = QA_[18]; 
  assign QA[19] = QA_[19]; 
  assign QA[20] = QA_[20]; 
  assign QA[21] = QA_[21]; 
  assign QA[22] = QA_[22]; 
  assign QA[23] = QA_[23]; 
  assign QA[24] = QA_[24]; 
  assign QA[25] = QA_[25]; 
  assign QA[26] = QA_[26]; 
  assign QA[27] = QA_[27]; 
  assign QA[28] = QA_[28]; 
  assign QA[29] = QA_[29]; 
  assign QA[30] = QA_[30]; 
  assign QA[31] = QA_[31]; 
  assign QA[32] = QA_[32]; 
  assign QA[33] = QA_[33]; 
  assign QA[34] = QA_[34]; 
  assign QA[35] = QA_[35]; 
  assign QA[36] = QA_[36]; 
  assign QA[37] = QA_[37]; 
  assign QA[38] = QA_[38]; 
  assign QA[39] = QA_[39]; 
  assign QA[40] = QA_[40]; 
  assign QA[41] = QA_[41]; 
  assign QA[42] = QA_[42]; 
  assign QA[43] = QA_[43]; 
  assign QA[44] = QA_[44]; 
  assign QA[45] = QA_[45]; 
  assign QA[46] = QA_[46]; 
  assign QA[47] = QA_[47]; 
  assign QA[48] = QA_[48]; 
  assign QA[49] = QA_[49]; 
  assign QA[50] = QA_[50]; 
  assign QA[51] = QA_[51]; 
  assign QA[52] = QA_[52]; 
  assign QA[53] = QA_[53]; 
  assign QA[54] = QA_[54]; 
  assign QA[55] = QA_[55]; 
  assign QA[56] = QA_[56]; 
  assign QA[57] = QA_[57]; 
  assign QA[58] = QA_[58]; 
  assign QA[59] = QA_[59]; 
  assign QA[60] = QA_[60]; 
  assign QA[61] = QA_[61]; 
  assign QA[62] = QA_[62]; 
  assign QA[63] = QA_[63]; 
  assign QA[64] = QA_[64]; 
  assign QA[65] = QA_[65]; 
  assign QA[66] = QA_[66]; 
  assign QA[67] = QA_[67]; 
  assign QA[68] = QA_[68]; 
  assign QA[69] = QA_[69]; 
  assign QA[70] = QA_[70]; 
  assign QA[71] = QA_[71]; 
  assign QA[72] = QA_[72]; 
  assign QA[73] = QA_[73]; 
  assign QA[74] = QA_[74]; 
  assign QA[75] = QA_[75]; 
  assign QA[76] = QA_[76]; 
  assign QA[77] = QA_[77]; 
  assign QA[78] = QA_[78]; 
  assign QA[79] = QA_[79]; 
  assign QA[80] = QA_[80]; 
  assign QA[81] = QA_[81]; 
  assign QA[82] = QA_[82]; 
  assign QA[83] = QA_[83]; 
  assign QA[84] = QA_[84]; 
  assign QA[85] = QA_[85]; 
  assign QA[86] = QA_[86]; 
  assign QA[87] = QA_[87]; 
  assign QA[88] = QA_[88]; 
  assign QA[89] = QA_[89]; 
  assign QA[90] = QA_[90]; 
  assign QA[91] = QA_[91]; 
  assign QA[92] = QA_[92]; 
  assign QA[93] = QA_[93]; 
  assign QA[94] = QA_[94]; 
  assign QA[95] = QA_[95]; 
  assign QA[96] = QA_[96]; 
  assign QA[97] = QA_[97]; 
  assign QA[98] = QA_[98]; 
  assign QA[99] = QA_[99]; 
  assign QA[100] = QA_[100]; 
  assign QA[101] = QA_[101]; 
  assign QA[102] = QA_[102]; 
  assign QA[103] = QA_[103]; 
  assign QA[104] = QA_[104]; 
  assign QA[105] = QA_[105]; 
  assign QA[106] = QA_[106]; 
  assign QA[107] = QA_[107]; 
  assign QA[108] = QA_[108]; 
  assign QA[109] = QA_[109]; 
  assign QA[110] = QA_[110]; 
  assign QA[111] = QA_[111]; 
  assign QA[112] = QA_[112]; 
  assign QA[113] = QA_[113]; 
  assign QA[114] = QA_[114]; 
  assign QA[115] = QA_[115]; 
  assign QA[116] = QA_[116]; 
  assign QA[117] = QA_[117]; 
  assign QA[118] = QA_[118]; 
  assign QA[119] = QA_[119]; 
  assign QA[120] = QA_[120]; 
  assign QA[121] = QA_[121]; 
  assign QA[122] = QA_[122]; 
  assign QA[123] = QA_[123]; 
  assign CLKA_ = CLKA;
  assign CENA_ = CENA;
  assign AA_[0] = AA[0];
  assign AA_[1] = AA[1];
  assign AA_[2] = AA[2];
  assign AA_[3] = AA[3];
  assign AA_[4] = AA[4];
  assign AA_[5] = AA[5];
  assign AA_[6] = AA[6];
  assign AA_[7] = AA[7];
  assign AA_[8] = AA[8];
  assign CLKB_ = CLKB;
  assign CENB_ = CENB;
  assign AB_[0] = AB[0];
  assign AB_[1] = AB[1];
  assign AB_[2] = AB[2];
  assign AB_[3] = AB[3];
  assign AB_[4] = AB[4];
  assign AB_[5] = AB[5];
  assign AB_[6] = AB[6];
  assign AB_[7] = AB[7];
  assign AB_[8] = AB[8];
  assign DB_[0] = DB[0];
  assign DB_[1] = DB[1];
  assign DB_[2] = DB[2];
  assign DB_[3] = DB[3];
  assign DB_[4] = DB[4];
  assign DB_[5] = DB[5];
  assign DB_[6] = DB[6];
  assign DB_[7] = DB[7];
  assign DB_[8] = DB[8];
  assign DB_[9] = DB[9];
  assign DB_[10] = DB[10];
  assign DB_[11] = DB[11];
  assign DB_[12] = DB[12];
  assign DB_[13] = DB[13];
  assign DB_[14] = DB[14];
  assign DB_[15] = DB[15];
  assign DB_[16] = DB[16];
  assign DB_[17] = DB[17];
  assign DB_[18] = DB[18];
  assign DB_[19] = DB[19];
  assign DB_[20] = DB[20];
  assign DB_[21] = DB[21];
  assign DB_[22] = DB[22];
  assign DB_[23] = DB[23];
  assign DB_[24] = DB[24];
  assign DB_[25] = DB[25];
  assign DB_[26] = DB[26];
  assign DB_[27] = DB[27];
  assign DB_[28] = DB[28];
  assign DB_[29] = DB[29];
  assign DB_[30] = DB[30];
  assign DB_[31] = DB[31];
  assign DB_[32] = DB[32];
  assign DB_[33] = DB[33];
  assign DB_[34] = DB[34];
  assign DB_[35] = DB[35];
  assign DB_[36] = DB[36];
  assign DB_[37] = DB[37];
  assign DB_[38] = DB[38];
  assign DB_[39] = DB[39];
  assign DB_[40] = DB[40];
  assign DB_[41] = DB[41];
  assign DB_[42] = DB[42];
  assign DB_[43] = DB[43];
  assign DB_[44] = DB[44];
  assign DB_[45] = DB[45];
  assign DB_[46] = DB[46];
  assign DB_[47] = DB[47];
  assign DB_[48] = DB[48];
  assign DB_[49] = DB[49];
  assign DB_[50] = DB[50];
  assign DB_[51] = DB[51];
  assign DB_[52] = DB[52];
  assign DB_[53] = DB[53];
  assign DB_[54] = DB[54];
  assign DB_[55] = DB[55];
  assign DB_[56] = DB[56];
  assign DB_[57] = DB[57];
  assign DB_[58] = DB[58];
  assign DB_[59] = DB[59];
  assign DB_[60] = DB[60];
  assign DB_[61] = DB[61];
  assign DB_[62] = DB[62];
  assign DB_[63] = DB[63];
  assign DB_[64] = DB[64];
  assign DB_[65] = DB[65];
  assign DB_[66] = DB[66];
  assign DB_[67] = DB[67];
  assign DB_[68] = DB[68];
  assign DB_[69] = DB[69];
  assign DB_[70] = DB[70];
  assign DB_[71] = DB[71];
  assign DB_[72] = DB[72];
  assign DB_[73] = DB[73];
  assign DB_[74] = DB[74];
  assign DB_[75] = DB[75];
  assign DB_[76] = DB[76];
  assign DB_[77] = DB[77];
  assign DB_[78] = DB[78];
  assign DB_[79] = DB[79];
  assign DB_[80] = DB[80];
  assign DB_[81] = DB[81];
  assign DB_[82] = DB[82];
  assign DB_[83] = DB[83];
  assign DB_[84] = DB[84];
  assign DB_[85] = DB[85];
  assign DB_[86] = DB[86];
  assign DB_[87] = DB[87];
  assign DB_[88] = DB[88];
  assign DB_[89] = DB[89];
  assign DB_[90] = DB[90];
  assign DB_[91] = DB[91];
  assign DB_[92] = DB[92];
  assign DB_[93] = DB[93];
  assign DB_[94] = DB[94];
  assign DB_[95] = DB[95];
  assign DB_[96] = DB[96];
  assign DB_[97] = DB[97];
  assign DB_[98] = DB[98];
  assign DB_[99] = DB[99];
  assign DB_[100] = DB[100];
  assign DB_[101] = DB[101];
  assign DB_[102] = DB[102];
  assign DB_[103] = DB[103];
  assign DB_[104] = DB[104];
  assign DB_[105] = DB[105];
  assign DB_[106] = DB[106];
  assign DB_[107] = DB[107];
  assign DB_[108] = DB[108];
  assign DB_[109] = DB[109];
  assign DB_[110] = DB[110];
  assign DB_[111] = DB[111];
  assign DB_[112] = DB[112];
  assign DB_[113] = DB[113];
  assign DB_[114] = DB[114];
  assign DB_[115] = DB[115];
  assign DB_[116] = DB[116];
  assign DB_[117] = DB[117];
  assign DB_[118] = DB[118];
  assign DB_[119] = DB[119];
  assign DB_[120] = DB[120];
  assign DB_[121] = DB[121];
  assign DB_[122] = DB[122];
  assign DB_[123] = DB[123];
  assign EMAA_[0] = EMAA[0];
  assign EMAA_[1] = EMAA[1];
  assign EMAA_[2] = EMAA[2];
  assign EMASA_ = EMASA;
  assign EMAB_[0] = EMAB[0];
  assign EMAB_[1] = EMAB[1];
  assign EMAB_[2] = EMAB[2];
  assign EMAWB_[0] = EMAWB[0];
  assign EMAWB_[1] = EMAWB[1];
  assign TENA_ = TENA;
  assign BENA_ = BENA;
  assign TCENA_ = TCENA;
  assign TAA_[0] = TAA[0];
  assign TAA_[1] = TAA[1];
  assign TAA_[2] = TAA[2];
  assign TAA_[3] = TAA[3];
  assign TAA_[4] = TAA[4];
  assign TAA_[5] = TAA[5];
  assign TAA_[6] = TAA[6];
  assign TAA_[7] = TAA[7];
  assign TAA_[8] = TAA[8];
  assign TQA_[0] = TQA[0];
  assign TQA_[1] = TQA[1];
  assign TQA_[2] = TQA[2];
  assign TQA_[3] = TQA[3];
  assign TQA_[4] = TQA[4];
  assign TQA_[5] = TQA[5];
  assign TQA_[6] = TQA[6];
  assign TQA_[7] = TQA[7];
  assign TQA_[8] = TQA[8];
  assign TQA_[9] = TQA[9];
  assign TQA_[10] = TQA[10];
  assign TQA_[11] = TQA[11];
  assign TQA_[12] = TQA[12];
  assign TQA_[13] = TQA[13];
  assign TQA_[14] = TQA[14];
  assign TQA_[15] = TQA[15];
  assign TQA_[16] = TQA[16];
  assign TQA_[17] = TQA[17];
  assign TQA_[18] = TQA[18];
  assign TQA_[19] = TQA[19];
  assign TQA_[20] = TQA[20];
  assign TQA_[21] = TQA[21];
  assign TQA_[22] = TQA[22];
  assign TQA_[23] = TQA[23];
  assign TQA_[24] = TQA[24];
  assign TQA_[25] = TQA[25];
  assign TQA_[26] = TQA[26];
  assign TQA_[27] = TQA[27];
  assign TQA_[28] = TQA[28];
  assign TQA_[29] = TQA[29];
  assign TQA_[30] = TQA[30];
  assign TQA_[31] = TQA[31];
  assign TQA_[32] = TQA[32];
  assign TQA_[33] = TQA[33];
  assign TQA_[34] = TQA[34];
  assign TQA_[35] = TQA[35];
  assign TQA_[36] = TQA[36];
  assign TQA_[37] = TQA[37];
  assign TQA_[38] = TQA[38];
  assign TQA_[39] = TQA[39];
  assign TQA_[40] = TQA[40];
  assign TQA_[41] = TQA[41];
  assign TQA_[42] = TQA[42];
  assign TQA_[43] = TQA[43];
  assign TQA_[44] = TQA[44];
  assign TQA_[45] = TQA[45];
  assign TQA_[46] = TQA[46];
  assign TQA_[47] = TQA[47];
  assign TQA_[48] = TQA[48];
  assign TQA_[49] = TQA[49];
  assign TQA_[50] = TQA[50];
  assign TQA_[51] = TQA[51];
  assign TQA_[52] = TQA[52];
  assign TQA_[53] = TQA[53];
  assign TQA_[54] = TQA[54];
  assign TQA_[55] = TQA[55];
  assign TQA_[56] = TQA[56];
  assign TQA_[57] = TQA[57];
  assign TQA_[58] = TQA[58];
  assign TQA_[59] = TQA[59];
  assign TQA_[60] = TQA[60];
  assign TQA_[61] = TQA[61];
  assign TQA_[62] = TQA[62];
  assign TQA_[63] = TQA[63];
  assign TQA_[64] = TQA[64];
  assign TQA_[65] = TQA[65];
  assign TQA_[66] = TQA[66];
  assign TQA_[67] = TQA[67];
  assign TQA_[68] = TQA[68];
  assign TQA_[69] = TQA[69];
  assign TQA_[70] = TQA[70];
  assign TQA_[71] = TQA[71];
  assign TQA_[72] = TQA[72];
  assign TQA_[73] = TQA[73];
  assign TQA_[74] = TQA[74];
  assign TQA_[75] = TQA[75];
  assign TQA_[76] = TQA[76];
  assign TQA_[77] = TQA[77];
  assign TQA_[78] = TQA[78];
  assign TQA_[79] = TQA[79];
  assign TQA_[80] = TQA[80];
  assign TQA_[81] = TQA[81];
  assign TQA_[82] = TQA[82];
  assign TQA_[83] = TQA[83];
  assign TQA_[84] = TQA[84];
  assign TQA_[85] = TQA[85];
  assign TQA_[86] = TQA[86];
  assign TQA_[87] = TQA[87];
  assign TQA_[88] = TQA[88];
  assign TQA_[89] = TQA[89];
  assign TQA_[90] = TQA[90];
  assign TQA_[91] = TQA[91];
  assign TQA_[92] = TQA[92];
  assign TQA_[93] = TQA[93];
  assign TQA_[94] = TQA[94];
  assign TQA_[95] = TQA[95];
  assign TQA_[96] = TQA[96];
  assign TQA_[97] = TQA[97];
  assign TQA_[98] = TQA[98];
  assign TQA_[99] = TQA[99];
  assign TQA_[100] = TQA[100];
  assign TQA_[101] = TQA[101];
  assign TQA_[102] = TQA[102];
  assign TQA_[103] = TQA[103];
  assign TQA_[104] = TQA[104];
  assign TQA_[105] = TQA[105];
  assign TQA_[106] = TQA[106];
  assign TQA_[107] = TQA[107];
  assign TQA_[108] = TQA[108];
  assign TQA_[109] = TQA[109];
  assign TQA_[110] = TQA[110];
  assign TQA_[111] = TQA[111];
  assign TQA_[112] = TQA[112];
  assign TQA_[113] = TQA[113];
  assign TQA_[114] = TQA[114];
  assign TQA_[115] = TQA[115];
  assign TQA_[116] = TQA[116];
  assign TQA_[117] = TQA[117];
  assign TQA_[118] = TQA[118];
  assign TQA_[119] = TQA[119];
  assign TQA_[120] = TQA[120];
  assign TQA_[121] = TQA[121];
  assign TQA_[122] = TQA[122];
  assign TQA_[123] = TQA[123];
  assign TENB_ = TENB;
  assign TCENB_ = TCENB;
  assign TAB_[0] = TAB[0];
  assign TAB_[1] = TAB[1];
  assign TAB_[2] = TAB[2];
  assign TAB_[3] = TAB[3];
  assign TAB_[4] = TAB[4];
  assign TAB_[5] = TAB[5];
  assign TAB_[6] = TAB[6];
  assign TAB_[7] = TAB[7];
  assign TAB_[8] = TAB[8];
  assign TDB_[0] = TDB[0];
  assign TDB_[1] = TDB[1];
  assign TDB_[2] = TDB[2];
  assign TDB_[3] = TDB[3];
  assign TDB_[4] = TDB[4];
  assign TDB_[5] = TDB[5];
  assign TDB_[6] = TDB[6];
  assign TDB_[7] = TDB[7];
  assign TDB_[8] = TDB[8];
  assign TDB_[9] = TDB[9];
  assign TDB_[10] = TDB[10];
  assign TDB_[11] = TDB[11];
  assign TDB_[12] = TDB[12];
  assign TDB_[13] = TDB[13];
  assign TDB_[14] = TDB[14];
  assign TDB_[15] = TDB[15];
  assign TDB_[16] = TDB[16];
  assign TDB_[17] = TDB[17];
  assign TDB_[18] = TDB[18];
  assign TDB_[19] = TDB[19];
  assign TDB_[20] = TDB[20];
  assign TDB_[21] = TDB[21];
  assign TDB_[22] = TDB[22];
  assign TDB_[23] = TDB[23];
  assign TDB_[24] = TDB[24];
  assign TDB_[25] = TDB[25];
  assign TDB_[26] = TDB[26];
  assign TDB_[27] = TDB[27];
  assign TDB_[28] = TDB[28];
  assign TDB_[29] = TDB[29];
  assign TDB_[30] = TDB[30];
  assign TDB_[31] = TDB[31];
  assign TDB_[32] = TDB[32];
  assign TDB_[33] = TDB[33];
  assign TDB_[34] = TDB[34];
  assign TDB_[35] = TDB[35];
  assign TDB_[36] = TDB[36];
  assign TDB_[37] = TDB[37];
  assign TDB_[38] = TDB[38];
  assign TDB_[39] = TDB[39];
  assign TDB_[40] = TDB[40];
  assign TDB_[41] = TDB[41];
  assign TDB_[42] = TDB[42];
  assign TDB_[43] = TDB[43];
  assign TDB_[44] = TDB[44];
  assign TDB_[45] = TDB[45];
  assign TDB_[46] = TDB[46];
  assign TDB_[47] = TDB[47];
  assign TDB_[48] = TDB[48];
  assign TDB_[49] = TDB[49];
  assign TDB_[50] = TDB[50];
  assign TDB_[51] = TDB[51];
  assign TDB_[52] = TDB[52];
  assign TDB_[53] = TDB[53];
  assign TDB_[54] = TDB[54];
  assign TDB_[55] = TDB[55];
  assign TDB_[56] = TDB[56];
  assign TDB_[57] = TDB[57];
  assign TDB_[58] = TDB[58];
  assign TDB_[59] = TDB[59];
  assign TDB_[60] = TDB[60];
  assign TDB_[61] = TDB[61];
  assign TDB_[62] = TDB[62];
  assign TDB_[63] = TDB[63];
  assign TDB_[64] = TDB[64];
  assign TDB_[65] = TDB[65];
  assign TDB_[66] = TDB[66];
  assign TDB_[67] = TDB[67];
  assign TDB_[68] = TDB[68];
  assign TDB_[69] = TDB[69];
  assign TDB_[70] = TDB[70];
  assign TDB_[71] = TDB[71];
  assign TDB_[72] = TDB[72];
  assign TDB_[73] = TDB[73];
  assign TDB_[74] = TDB[74];
  assign TDB_[75] = TDB[75];
  assign TDB_[76] = TDB[76];
  assign TDB_[77] = TDB[77];
  assign TDB_[78] = TDB[78];
  assign TDB_[79] = TDB[79];
  assign TDB_[80] = TDB[80];
  assign TDB_[81] = TDB[81];
  assign TDB_[82] = TDB[82];
  assign TDB_[83] = TDB[83];
  assign TDB_[84] = TDB[84];
  assign TDB_[85] = TDB[85];
  assign TDB_[86] = TDB[86];
  assign TDB_[87] = TDB[87];
  assign TDB_[88] = TDB[88];
  assign TDB_[89] = TDB[89];
  assign TDB_[90] = TDB[90];
  assign TDB_[91] = TDB[91];
  assign TDB_[92] = TDB[92];
  assign TDB_[93] = TDB[93];
  assign TDB_[94] = TDB[94];
  assign TDB_[95] = TDB[95];
  assign TDB_[96] = TDB[96];
  assign TDB_[97] = TDB[97];
  assign TDB_[98] = TDB[98];
  assign TDB_[99] = TDB[99];
  assign TDB_[100] = TDB[100];
  assign TDB_[101] = TDB[101];
  assign TDB_[102] = TDB[102];
  assign TDB_[103] = TDB[103];
  assign TDB_[104] = TDB[104];
  assign TDB_[105] = TDB[105];
  assign TDB_[106] = TDB[106];
  assign TDB_[107] = TDB[107];
  assign TDB_[108] = TDB[108];
  assign TDB_[109] = TDB[109];
  assign TDB_[110] = TDB[110];
  assign TDB_[111] = TDB[111];
  assign TDB_[112] = TDB[112];
  assign TDB_[113] = TDB[113];
  assign TDB_[114] = TDB[114];
  assign TDB_[115] = TDB[115];
  assign TDB_[116] = TDB[116];
  assign TDB_[117] = TDB[117];
  assign TDB_[118] = TDB[118];
  assign TDB_[119] = TDB[119];
  assign TDB_[120] = TDB[120];
  assign TDB_[121] = TDB[121];
  assign TDB_[122] = TDB[122];
  assign TDB_[123] = TDB[123];
  assign RET1N_ = RET1N;
  assign STOVA_ = STOVA;
  assign STOVB_ = STOVB;
  assign COLLDISN_ = COLLDISN;

  assign `ARM_UD_DP CENYA_ = RET1N_ ? (TENA_ ? CENA_ : TCENA_) : 1'bx;
  assign `ARM_UD_DP AYA_ = RET1N_ ? (TENA_ ? AA_ : TAA_) : {9{1'bx}};
  assign `ARM_UD_DP CENYB_ = RET1N_ ? (TENB_ ? CENB_ : TCENB_) : 1'bx;
  assign `ARM_UD_DP AYB_ = RET1N_ ? (TENB_ ? AB_ : TAB_) : {9{1'bx}};
  assign `ARM_UD_DP DYB_ = RET1N_ ? (TENB_ ? DB_ : TDB_) : {124{1'bx}};
  assign `ARM_UD_SEQ QA_ = RET1N_ ? (BENA_ ? ((STOVA_ ? (QA_int_delayed) : (QA_int))) : TQA_) : {124{1'bx}};

// If INITIALIZE_MEMORY is defined at Simulator Command Line, it Initializes the Memory with all ZEROS.
`ifdef INITIALIZE_MEMORY
  integer i;
  initial
    for (i = 0; i < MEM_HEIGHT; i = i + 1)
      mem[i] = {MEM_WIDTH{1'b0}};
`endif

  task failedWrite;
  input port_f;
  integer i;
  begin
    for (i = 0; i < MEM_HEIGHT; i = i + 1)
      mem[i] = {MEM_WIDTH{1'bx}};
  end
  endtask

  function isBitX;
    input bitval;
    begin
      isBitX = ( bitval===1'bx || bitval==1'bz ) ? 1'b1 : 1'b0;
    end
  endfunction


task loadmem;
	input [1000*8-1:0] filename;
	reg [BITS-1:0] memld [0:WORDS-1];
	integer i;
	reg [BITS-1:0] wordtemp;
	reg [8:0] Atemp;
  begin
	$readmemb(filename, memld);
     if (CENA_ === 1'b1 && CENB_ === 1'b1) begin
	  for (i=0;i<WORDS;i=i+1) begin
	  wordtemp = memld[i];
	  Atemp = i;
	  mux_address = (Atemp & 1'b1);
      row_address = (Atemp >> 1);
      row = mem[row_address];
        writeEnable = {124{1'b1}};
        row_mask =  ( {1'b0, writeEnable[123], 1'b0, writeEnable[122], 1'b0, writeEnable[121],
          1'b0, writeEnable[120], 1'b0, writeEnable[119], 1'b0, writeEnable[118], 1'b0, writeEnable[117],
          1'b0, writeEnable[116], 1'b0, writeEnable[115], 1'b0, writeEnable[114], 1'b0, writeEnable[113],
          1'b0, writeEnable[112], 1'b0, writeEnable[111], 1'b0, writeEnable[110], 1'b0, writeEnable[109],
          1'b0, writeEnable[108], 1'b0, writeEnable[107], 1'b0, writeEnable[106], 1'b0, writeEnable[105],
          1'b0, writeEnable[104], 1'b0, writeEnable[103], 1'b0, writeEnable[102], 1'b0, writeEnable[101],
          1'b0, writeEnable[100], 1'b0, writeEnable[99], 1'b0, writeEnable[98], 1'b0, writeEnable[97],
          1'b0, writeEnable[96], 1'b0, writeEnable[95], 1'b0, writeEnable[94], 1'b0, writeEnable[93],
          1'b0, writeEnable[92], 1'b0, writeEnable[91], 1'b0, writeEnable[90], 1'b0, writeEnable[89],
          1'b0, writeEnable[88], 1'b0, writeEnable[87], 1'b0, writeEnable[86], 1'b0, writeEnable[85],
          1'b0, writeEnable[84], 1'b0, writeEnable[83], 1'b0, writeEnable[82], 1'b0, writeEnable[81],
          1'b0, writeEnable[80], 1'b0, writeEnable[79], 1'b0, writeEnable[78], 1'b0, writeEnable[77],
          1'b0, writeEnable[76], 1'b0, writeEnable[75], 1'b0, writeEnable[74], 1'b0, writeEnable[73],
          1'b0, writeEnable[72], 1'b0, writeEnable[71], 1'b0, writeEnable[70], 1'b0, writeEnable[69],
          1'b0, writeEnable[68], 1'b0, writeEnable[67], 1'b0, writeEnable[66], 1'b0, writeEnable[65],
          1'b0, writeEnable[64], 1'b0, writeEnable[63], 1'b0, writeEnable[62], 1'b0, writeEnable[61],
          1'b0, writeEnable[60], 1'b0, writeEnable[59], 1'b0, writeEnable[58], 1'b0, writeEnable[57],
          1'b0, writeEnable[56], 1'b0, writeEnable[55], 1'b0, writeEnable[54], 1'b0, writeEnable[53],
          1'b0, writeEnable[52], 1'b0, writeEnable[51], 1'b0, writeEnable[50], 1'b0, writeEnable[49],
          1'b0, writeEnable[48], 1'b0, writeEnable[47], 1'b0, writeEnable[46], 1'b0, writeEnable[45],
          1'b0, writeEnable[44], 1'b0, writeEnable[43], 1'b0, writeEnable[42], 1'b0, writeEnable[41],
          1'b0, writeEnable[40], 1'b0, writeEnable[39], 1'b0, writeEnable[38], 1'b0, writeEnable[37],
          1'b0, writeEnable[36], 1'b0, writeEnable[35], 1'b0, writeEnable[34], 1'b0, writeEnable[33],
          1'b0, writeEnable[32], 1'b0, writeEnable[31], 1'b0, writeEnable[30], 1'b0, writeEnable[29],
          1'b0, writeEnable[28], 1'b0, writeEnable[27], 1'b0, writeEnable[26], 1'b0, writeEnable[25],
          1'b0, writeEnable[24], 1'b0, writeEnable[23], 1'b0, writeEnable[22], 1'b0, writeEnable[21],
          1'b0, writeEnable[20], 1'b0, writeEnable[19], 1'b0, writeEnable[18], 1'b0, writeEnable[17],
          1'b0, writeEnable[16], 1'b0, writeEnable[15], 1'b0, writeEnable[14], 1'b0, writeEnable[13],
          1'b0, writeEnable[12], 1'b0, writeEnable[11], 1'b0, writeEnable[10], 1'b0, writeEnable[9],
          1'b0, writeEnable[8], 1'b0, writeEnable[7], 1'b0, writeEnable[6], 1'b0, writeEnable[5],
          1'b0, writeEnable[4], 1'b0, writeEnable[3], 1'b0, writeEnable[2], 1'b0, writeEnable[1],
          1'b0, writeEnable[0]} << mux_address);
        new_data =  ( {1'b0, wordtemp[123], 1'b0, wordtemp[122], 1'b0, wordtemp[121],
          1'b0, wordtemp[120], 1'b0, wordtemp[119], 1'b0, wordtemp[118], 1'b0, wordtemp[117],
          1'b0, wordtemp[116], 1'b0, wordtemp[115], 1'b0, wordtemp[114], 1'b0, wordtemp[113],
          1'b0, wordtemp[112], 1'b0, wordtemp[111], 1'b0, wordtemp[110], 1'b0, wordtemp[109],
          1'b0, wordtemp[108], 1'b0, wordtemp[107], 1'b0, wordtemp[106], 1'b0, wordtemp[105],
          1'b0, wordtemp[104], 1'b0, wordtemp[103], 1'b0, wordtemp[102], 1'b0, wordtemp[101],
          1'b0, wordtemp[100], 1'b0, wordtemp[99], 1'b0, wordtemp[98], 1'b0, wordtemp[97],
          1'b0, wordtemp[96], 1'b0, wordtemp[95], 1'b0, wordtemp[94], 1'b0, wordtemp[93],
          1'b0, wordtemp[92], 1'b0, wordtemp[91], 1'b0, wordtemp[90], 1'b0, wordtemp[89],
          1'b0, wordtemp[88], 1'b0, wordtemp[87], 1'b0, wordtemp[86], 1'b0, wordtemp[85],
          1'b0, wordtemp[84], 1'b0, wordtemp[83], 1'b0, wordtemp[82], 1'b0, wordtemp[81],
          1'b0, wordtemp[80], 1'b0, wordtemp[79], 1'b0, wordtemp[78], 1'b0, wordtemp[77],
          1'b0, wordtemp[76], 1'b0, wordtemp[75], 1'b0, wordtemp[74], 1'b0, wordtemp[73],
          1'b0, wordtemp[72], 1'b0, wordtemp[71], 1'b0, wordtemp[70], 1'b0, wordtemp[69],
          1'b0, wordtemp[68], 1'b0, wordtemp[67], 1'b0, wordtemp[66], 1'b0, wordtemp[65],
          1'b0, wordtemp[64], 1'b0, wordtemp[63], 1'b0, wordtemp[62], 1'b0, wordtemp[61],
          1'b0, wordtemp[60], 1'b0, wordtemp[59], 1'b0, wordtemp[58], 1'b0, wordtemp[57],
          1'b0, wordtemp[56], 1'b0, wordtemp[55], 1'b0, wordtemp[54], 1'b0, wordtemp[53],
          1'b0, wordtemp[52], 1'b0, wordtemp[51], 1'b0, wordtemp[50], 1'b0, wordtemp[49],
          1'b0, wordtemp[48], 1'b0, wordtemp[47], 1'b0, wordtemp[46], 1'b0, wordtemp[45],
          1'b0, wordtemp[44], 1'b0, wordtemp[43], 1'b0, wordtemp[42], 1'b0, wordtemp[41],
          1'b0, wordtemp[40], 1'b0, wordtemp[39], 1'b0, wordtemp[38], 1'b0, wordtemp[37],
          1'b0, wordtemp[36], 1'b0, wordtemp[35], 1'b0, wordtemp[34], 1'b0, wordtemp[33],
          1'b0, wordtemp[32], 1'b0, wordtemp[31], 1'b0, wordtemp[30], 1'b0, wordtemp[29],
          1'b0, wordtemp[28], 1'b0, wordtemp[27], 1'b0, wordtemp[26], 1'b0, wordtemp[25],
          1'b0, wordtemp[24], 1'b0, wordtemp[23], 1'b0, wordtemp[22], 1'b0, wordtemp[21],
          1'b0, wordtemp[20], 1'b0, wordtemp[19], 1'b0, wordtemp[18], 1'b0, wordtemp[17],
          1'b0, wordtemp[16], 1'b0, wordtemp[15], 1'b0, wordtemp[14], 1'b0, wordtemp[13],
          1'b0, wordtemp[12], 1'b0, wordtemp[11], 1'b0, wordtemp[10], 1'b0, wordtemp[9],
          1'b0, wordtemp[8], 1'b0, wordtemp[7], 1'b0, wordtemp[6], 1'b0, wordtemp[5],
          1'b0, wordtemp[4], 1'b0, wordtemp[3], 1'b0, wordtemp[2], 1'b0, wordtemp[1],
          1'b0, wordtemp[0]} << mux_address);
      row = (row & ~row_mask) | (row_mask & (~row_mask | new_data));
      mem[row_address] = row;
  	end
  end
  end
  endtask

task dumpmem;
	input [1000*8-1:0] filename_dump;
	integer i, dump_file_desc;
	reg [BITS-1:0] wordtemp;
	reg [8:0] Atemp;
  begin
	dump_file_desc = $fopen(filename_dump);
     if (CENA_ === 1'b1 && CENB_ === 1'b1) begin
	  for (i=0;i<WORDS;i=i+1) begin
	  Atemp = i;
	  mux_address = (Atemp & 1'b1);
      row_address = (Atemp >> 1);
      row = mem[row_address];
        writeEnable = {124{1'b1}};
      data_out = (row >> mux_address);
      QA_int = {data_out[246], data_out[244], data_out[242], data_out[240], data_out[238],
        data_out[236], data_out[234], data_out[232], data_out[230], data_out[228],
        data_out[226], data_out[224], data_out[222], data_out[220], data_out[218],
        data_out[216], data_out[214], data_out[212], data_out[210], data_out[208],
        data_out[206], data_out[204], data_out[202], data_out[200], data_out[198],
        data_out[196], data_out[194], data_out[192], data_out[190], data_out[188],
        data_out[186], data_out[184], data_out[182], data_out[180], data_out[178],
        data_out[176], data_out[174], data_out[172], data_out[170], data_out[168],
        data_out[166], data_out[164], data_out[162], data_out[160], data_out[158],
        data_out[156], data_out[154], data_out[152], data_out[150], data_out[148],
        data_out[146], data_out[144], data_out[142], data_out[140], data_out[138],
        data_out[136], data_out[134], data_out[132], data_out[130], data_out[128],
        data_out[126], data_out[124], data_out[122], data_out[120], data_out[118],
        data_out[116], data_out[114], data_out[112], data_out[110], data_out[108],
        data_out[106], data_out[104], data_out[102], data_out[100], data_out[98], data_out[96],
        data_out[94], data_out[92], data_out[90], data_out[88], data_out[86], data_out[84],
        data_out[82], data_out[80], data_out[78], data_out[76], data_out[74], data_out[72],
        data_out[70], data_out[68], data_out[66], data_out[64], data_out[62], data_out[60],
        data_out[58], data_out[56], data_out[54], data_out[52], data_out[50], data_out[48],
        data_out[46], data_out[44], data_out[42], data_out[40], data_out[38], data_out[36],
        data_out[34], data_out[32], data_out[30], data_out[28], data_out[26], data_out[24],
        data_out[22], data_out[20], data_out[18], data_out[16], data_out[14], data_out[12],
        data_out[10], data_out[8], data_out[6], data_out[4], data_out[2], data_out[0]};
   	$fdisplay(dump_file_desc, "%b", QA_int);
  end
  	end
//    $fclose(filename_dump);
  end
  endtask


  task ReadA;
  begin
    if (RET1N_int === 1'bx || RET1N_int === 1'bz) begin
      failedWrite(0);
      QA_int = {124{1'bx}};
    end else if (RET1N_int === 1'b0 && CENA_int === 1'b0) begin
      failedWrite(0);
      QA_int = {124{1'bx}};
    end else if (RET1N_int === 1'b0) begin
      // no cycle in retention mode
    end else if (^{CENA_int, EMAA_int, EMASA_int, RET1N_int, (STOVA_int && !CENA_int)} 
     === 1'bx) begin
      QA_int = {124{1'bx}};
    end else if ((AA_int >= WORDS) && (CENA_int === 1'b0)) begin
      QA_int = 0 ? QA_int : {124{1'bx}};
    end else if (CENA_int === 1'b0 && (^AA_int) === 1'bx) begin
      failedWrite(0);
      QA_int = {124{1'bx}};
    end else if (CENA_int === 1'b0) begin
      mux_address = (AA_int & 1'b1);
      row_address = (AA_int >> 1);
      if (row_address > 255)
        row = {248{1'bx}};
      else
        row = mem[row_address];
      data_out = (row >> mux_address);
      QA_int = {data_out[246], data_out[244], data_out[242], data_out[240], data_out[238],
        data_out[236], data_out[234], data_out[232], data_out[230], data_out[228],
        data_out[226], data_out[224], data_out[222], data_out[220], data_out[218],
        data_out[216], data_out[214], data_out[212], data_out[210], data_out[208],
        data_out[206], data_out[204], data_out[202], data_out[200], data_out[198],
        data_out[196], data_out[194], data_out[192], data_out[190], data_out[188],
        data_out[186], data_out[184], data_out[182], data_out[180], data_out[178],
        data_out[176], data_out[174], data_out[172], data_out[170], data_out[168],
        data_out[166], data_out[164], data_out[162], data_out[160], data_out[158],
        data_out[156], data_out[154], data_out[152], data_out[150], data_out[148],
        data_out[146], data_out[144], data_out[142], data_out[140], data_out[138],
        data_out[136], data_out[134], data_out[132], data_out[130], data_out[128],
        data_out[126], data_out[124], data_out[122], data_out[120], data_out[118],
        data_out[116], data_out[114], data_out[112], data_out[110], data_out[108],
        data_out[106], data_out[104], data_out[102], data_out[100], data_out[98], data_out[96],
        data_out[94], data_out[92], data_out[90], data_out[88], data_out[86], data_out[84],
        data_out[82], data_out[80], data_out[78], data_out[76], data_out[74], data_out[72],
        data_out[70], data_out[68], data_out[66], data_out[64], data_out[62], data_out[60],
        data_out[58], data_out[56], data_out[54], data_out[52], data_out[50], data_out[48],
        data_out[46], data_out[44], data_out[42], data_out[40], data_out[38], data_out[36],
        data_out[34], data_out[32], data_out[30], data_out[28], data_out[26], data_out[24],
        data_out[22], data_out[20], data_out[18], data_out[16], data_out[14], data_out[12],
        data_out[10], data_out[8], data_out[6], data_out[4], data_out[2], data_out[0]};
    end
  end
  endtask

  task WriteB;
  begin
    if (RET1N_int === 1'bx || RET1N_int === 1'bz) begin
      failedWrite(1);
      QA_int = {124{1'bx}};
    end else if (RET1N_int === 1'b0 && CENB_int === 1'b0) begin
      failedWrite(1);
      QA_int = {124{1'bx}};
    end else if (RET1N_int === 1'b0) begin
      // no cycle in retention mode
    end else if (^{CENB_int, EMAB_int, EMAWB_int, RET1N_int, (STOVB_int && !CENB_int)} 
     === 1'bx) begin
      failedWrite(1);
    end else if ((AB_int >= WORDS) && (CENB_int === 1'b0)) begin
    end else if (CENB_int === 1'b0 && (^AB_int) === 1'bx) begin
      failedWrite(1);
    end else if (CENB_int === 1'b0) begin
      mux_address = (AB_int & 1'b1);
      row_address = (AB_int >> 1);
      if (row_address > 255)
        row = {248{1'bx}};
      else
        row = mem[row_address];
      writeEnable = ~{124{CENB_int}};
      row_mask =  ( {1'b0, writeEnable[123], 1'b0, writeEnable[122], 1'b0, writeEnable[121],
        1'b0, writeEnable[120], 1'b0, writeEnable[119], 1'b0, writeEnable[118], 1'b0, writeEnable[117],
        1'b0, writeEnable[116], 1'b0, writeEnable[115], 1'b0, writeEnable[114], 1'b0, writeEnable[113],
        1'b0, writeEnable[112], 1'b0, writeEnable[111], 1'b0, writeEnable[110], 1'b0, writeEnable[109],
        1'b0, writeEnable[108], 1'b0, writeEnable[107], 1'b0, writeEnable[106], 1'b0, writeEnable[105],
        1'b0, writeEnable[104], 1'b0, writeEnable[103], 1'b0, writeEnable[102], 1'b0, writeEnable[101],
        1'b0, writeEnable[100], 1'b0, writeEnable[99], 1'b0, writeEnable[98], 1'b0, writeEnable[97],
        1'b0, writeEnable[96], 1'b0, writeEnable[95], 1'b0, writeEnable[94], 1'b0, writeEnable[93],
        1'b0, writeEnable[92], 1'b0, writeEnable[91], 1'b0, writeEnable[90], 1'b0, writeEnable[89],
        1'b0, writeEnable[88], 1'b0, writeEnable[87], 1'b0, writeEnable[86], 1'b0, writeEnable[85],
        1'b0, writeEnable[84], 1'b0, writeEnable[83], 1'b0, writeEnable[82], 1'b0, writeEnable[81],
        1'b0, writeEnable[80], 1'b0, writeEnable[79], 1'b0, writeEnable[78], 1'b0, writeEnable[77],
        1'b0, writeEnable[76], 1'b0, writeEnable[75], 1'b0, writeEnable[74], 1'b0, writeEnable[73],
        1'b0, writeEnable[72], 1'b0, writeEnable[71], 1'b0, writeEnable[70], 1'b0, writeEnable[69],
        1'b0, writeEnable[68], 1'b0, writeEnable[67], 1'b0, writeEnable[66], 1'b0, writeEnable[65],
        1'b0, writeEnable[64], 1'b0, writeEnable[63], 1'b0, writeEnable[62], 1'b0, writeEnable[61],
        1'b0, writeEnable[60], 1'b0, writeEnable[59], 1'b0, writeEnable[58], 1'b0, writeEnable[57],
        1'b0, writeEnable[56], 1'b0, writeEnable[55], 1'b0, writeEnable[54], 1'b0, writeEnable[53],
        1'b0, writeEnable[52], 1'b0, writeEnable[51], 1'b0, writeEnable[50], 1'b0, writeEnable[49],
        1'b0, writeEnable[48], 1'b0, writeEnable[47], 1'b0, writeEnable[46], 1'b0, writeEnable[45],
        1'b0, writeEnable[44], 1'b0, writeEnable[43], 1'b0, writeEnable[42], 1'b0, writeEnable[41],
        1'b0, writeEnable[40], 1'b0, writeEnable[39], 1'b0, writeEnable[38], 1'b0, writeEnable[37],
        1'b0, writeEnable[36], 1'b0, writeEnable[35], 1'b0, writeEnable[34], 1'b0, writeEnable[33],
        1'b0, writeEnable[32], 1'b0, writeEnable[31], 1'b0, writeEnable[30], 1'b0, writeEnable[29],
        1'b0, writeEnable[28], 1'b0, writeEnable[27], 1'b0, writeEnable[26], 1'b0, writeEnable[25],
        1'b0, writeEnable[24], 1'b0, writeEnable[23], 1'b0, writeEnable[22], 1'b0, writeEnable[21],
        1'b0, writeEnable[20], 1'b0, writeEnable[19], 1'b0, writeEnable[18], 1'b0, writeEnable[17],
        1'b0, writeEnable[16], 1'b0, writeEnable[15], 1'b0, writeEnable[14], 1'b0, writeEnable[13],
        1'b0, writeEnable[12], 1'b0, writeEnable[11], 1'b0, writeEnable[10], 1'b0, writeEnable[9],
        1'b0, writeEnable[8], 1'b0, writeEnable[7], 1'b0, writeEnable[6], 1'b0, writeEnable[5],
        1'b0, writeEnable[4], 1'b0, writeEnable[3], 1'b0, writeEnable[2], 1'b0, writeEnable[1],
        1'b0, writeEnable[0]} << mux_address);
      new_data =  ( {1'b0, DB_int[123], 1'b0, DB_int[122], 1'b0, DB_int[121], 1'b0, DB_int[120],
        1'b0, DB_int[119], 1'b0, DB_int[118], 1'b0, DB_int[117], 1'b0, DB_int[116],
        1'b0, DB_int[115], 1'b0, DB_int[114], 1'b0, DB_int[113], 1'b0, DB_int[112],
        1'b0, DB_int[111], 1'b0, DB_int[110], 1'b0, DB_int[109], 1'b0, DB_int[108],
        1'b0, DB_int[107], 1'b0, DB_int[106], 1'b0, DB_int[105], 1'b0, DB_int[104],
        1'b0, DB_int[103], 1'b0, DB_int[102], 1'b0, DB_int[101], 1'b0, DB_int[100],
        1'b0, DB_int[99], 1'b0, DB_int[98], 1'b0, DB_int[97], 1'b0, DB_int[96], 1'b0, DB_int[95],
        1'b0, DB_int[94], 1'b0, DB_int[93], 1'b0, DB_int[92], 1'b0, DB_int[91], 1'b0, DB_int[90],
        1'b0, DB_int[89], 1'b0, DB_int[88], 1'b0, DB_int[87], 1'b0, DB_int[86], 1'b0, DB_int[85],
        1'b0, DB_int[84], 1'b0, DB_int[83], 1'b0, DB_int[82], 1'b0, DB_int[81], 1'b0, DB_int[80],
        1'b0, DB_int[79], 1'b0, DB_int[78], 1'b0, DB_int[77], 1'b0, DB_int[76], 1'b0, DB_int[75],
        1'b0, DB_int[74], 1'b0, DB_int[73], 1'b0, DB_int[72], 1'b0, DB_int[71], 1'b0, DB_int[70],
        1'b0, DB_int[69], 1'b0, DB_int[68], 1'b0, DB_int[67], 1'b0, DB_int[66], 1'b0, DB_int[65],
        1'b0, DB_int[64], 1'b0, DB_int[63], 1'b0, DB_int[62], 1'b0, DB_int[61], 1'b0, DB_int[60],
        1'b0, DB_int[59], 1'b0, DB_int[58], 1'b0, DB_int[57], 1'b0, DB_int[56], 1'b0, DB_int[55],
        1'b0, DB_int[54], 1'b0, DB_int[53], 1'b0, DB_int[52], 1'b0, DB_int[51], 1'b0, DB_int[50],
        1'b0, DB_int[49], 1'b0, DB_int[48], 1'b0, DB_int[47], 1'b0, DB_int[46], 1'b0, DB_int[45],
        1'b0, DB_int[44], 1'b0, DB_int[43], 1'b0, DB_int[42], 1'b0, DB_int[41], 1'b0, DB_int[40],
        1'b0, DB_int[39], 1'b0, DB_int[38], 1'b0, DB_int[37], 1'b0, DB_int[36], 1'b0, DB_int[35],
        1'b0, DB_int[34], 1'b0, DB_int[33], 1'b0, DB_int[32], 1'b0, DB_int[31], 1'b0, DB_int[30],
        1'b0, DB_int[29], 1'b0, DB_int[28], 1'b0, DB_int[27], 1'b0, DB_int[26], 1'b0, DB_int[25],
        1'b0, DB_int[24], 1'b0, DB_int[23], 1'b0, DB_int[22], 1'b0, DB_int[21], 1'b0, DB_int[20],
        1'b0, DB_int[19], 1'b0, DB_int[18], 1'b0, DB_int[17], 1'b0, DB_int[16], 1'b0, DB_int[15],
        1'b0, DB_int[14], 1'b0, DB_int[13], 1'b0, DB_int[12], 1'b0, DB_int[11], 1'b0, DB_int[10],
        1'b0, DB_int[9], 1'b0, DB_int[8], 1'b0, DB_int[7], 1'b0, DB_int[6], 1'b0, DB_int[5],
        1'b0, DB_int[4], 1'b0, DB_int[3], 1'b0, DB_int[2], 1'b0, DB_int[1], 1'b0, DB_int[0]} << mux_address);
      row = (row & ~row_mask) | (row_mask & (~row_mask | new_data));
      mem[row_address] = row;
    end
  end
  endtask
  always @ (CENA_ or TCENA_ or TENA_ or CLKA_) begin
  	if(CLKA_ == 1'b0) begin
  		CENA_p2 = CENA_;
  		TCENA_p2 = TCENA_;
  	end
  end

  always @ RET1N_ begin
    if (CLKA_ == 1'b1) begin
      failedWrite(0);
      QA_int = {124{1'bx}};
    end
    if (RET1N_ === 1'bx || RET1N_ === 1'bz) begin
      failedWrite(0);
      QA_int = {124{1'bx}};
    end else if (RET1N_ === 1'b0 && RET1N_int === 1'b1 && (CENA_p2 === 1'b0 || TCENA_p2 === 1'b0) ) begin
      failedWrite(0);
      QA_int = {124{1'bx}};
    end else if (RET1N_ === 1'b1 && RET1N_int === 1'b0 && (CENA_p2 === 1'b0 || TCENA_p2 === 1'b0) ) begin
      failedWrite(0);
      QA_int = {124{1'bx}};
    end
    if (RET1N_ == 1'b0) begin
      QA_int = {124{1'bx}};
      QA_int_delayed = {124{1'bx}};
      CENA_int = 1'bx;
      AA_int = {9{1'bx}};
      EMAA_int = {3{1'bx}};
      EMASA_int = 1'bx;
      TENA_int = 1'bx;
      BENA_int = 1'bx;
      TCENA_int = 1'bx;
      TAA_int = {9{1'bx}};
      TQA_int = {124{1'bx}};
      RET1N_int = 1'bx;
      STOVA_int = 1'bx;
      COLLDISN_int = 1'bx;
    end else begin
      QA_int = {124{1'bx}};
      QA_int_delayed = {124{1'bx}};
      CENA_int = 1'bx;
      AA_int = {9{1'bx}};
      EMAA_int = {3{1'bx}};
      EMASA_int = 1'bx;
      TENA_int = 1'bx;
      BENA_int = 1'bx;
      TCENA_int = 1'bx;
      TAA_int = {9{1'bx}};
      TQA_int = {124{1'bx}};
      RET1N_int = 1'bx;
      STOVA_int = 1'bx;
      COLLDISN_int = 1'bx;
    end
    RET1N_int = RET1N_;
  end


  always @ CLKA_ begin
// If POWER_PINS is defined at Simulator Command Line, it selects the module definition with Power Ports
`ifdef POWER_PINS
    if (VDDCE === 1'bx || VDDCE === 1'bz)
      $display("ERROR: Illegal value for VDDCE %b", VDDCE);
    if (VDDPE === 1'bx || VDDPE === 1'bz)
      $display("ERROR: Illegal value for VDDPE %b", VDDPE);
    if (VSSE === 1'bx || VSSE === 1'bz)
      $display("ERROR: Illegal value for VSSE %b", VSSE);
`endif
  if (RET1N_ == 1'b0) begin
      // no cycle in retention mode
  end else begin
    if ((CLKA_ === 1'bx || CLKA_ === 1'bz) && RET1N_ !== 1'b0) begin
      failedWrite(0);
      QA_int = {124{1'bx}};
    end else if (CLKA_ === 1'b1 && LAST_CLKA === 1'b0) begin
      CENA_int = TENA_ ? CENA_ : TCENA_;
      EMAA_int = EMAA_;
      EMASA_int = EMASA_;
      TENA_int = TENA_;
      BENA_int = BENA_;
      TQA_int = TQA_;
      RET1N_int = RET1N_;
      STOVA_int = STOVA_;
      COLLDISN_int = COLLDISN_;
      if (CENA_int != 1'b1) begin
        AA_int = TENA_ ? AA_ : TAA_;
        TCENA_int = TCENA_;
        TAA_int = TAA_;
      end
      clk0_int = 1'b0;
    ReadA;
      if (CENA_int === 1'b0) previous_CLKA = $realtime;
    #0;
      if (((previous_CLKA == previous_CLKB) || ((STOVA_int==1'b1 || STOVB_int==1'b1) 
       && CLKA_ == 1'b1 && CLKB_ == 1'b1)) && (CENA_int !== 1'b1 && CENB_int !== 1'b1) 
       && COLLDISN_int === 1'b1 && is_contention(AA_int, AB_int, 1'b1, 1'b0)) begin
          $display("%s contention: write B succeeds, read A fails in %m at %0t",ASSERT_PREFIX, $time);
          ROW_CC = 1;
          COL_CC = 1;
        QA_int = {124{1'bx}};
      end else if (((previous_CLKA == previous_CLKB) || ((STOVA_int==1'b1 || STOVB_int==1'b1) 
       && CLKA_ == 1'b1 && CLKB_ == 1'b1)) && (CENA_int !== 1'b1 && CENB_int !== 1'b1) 
       && COLLDISN_int === 1'b1 && row_contention(AA_int, AB_int, 1'b1, 1'b0)) begin
         //  $display("%s row contention: in %m at %0t",ASSERT_PREFIX, $time);
          ROW_CC = 1;
         //  $display("%s contention: write B succeeds, read A succeeds in %m at %0t",ASSERT_PREFIX, $time);
          READ_WRITE = 1;
      end else if (((previous_CLKA == previous_CLKB) || ((STOVA_int==1'b1 || STOVB_int==1'b1) 
       && CLKA_ == 1'b1 && CLKB_ == 1'b1)) && (CENA_int !== 1'b1 && CENB_int !== 1'b1) 
       && (COLLDISN_int === 1'b0 || COLLDISN_int === 1'bx) && row_contention(AA_int,
        AB_int, 1'b1, 1'b0)) begin
          $display("%s row contention: in %m at %0t",ASSERT_PREFIX, $time);
          ROW_CC = 1;
          $display("%s contention: write B fails in %m at %0t",ASSERT_PREFIX, $time);
          READ_WRITE = 1;
        DB_int = {124{1'bx}};
        WriteB;
        if (col_contention(AA_int,AB_int)) begin
          $display("%s contention: read A fails in %m at %0t",ASSERT_PREFIX, $time);
          COL_CC = 1;
          READ_WRITE = 1;
        QA_int = {124{1'bx}};
      end else begin
          $display("%s contention: read A succeeds in %m at %0t",ASSERT_PREFIX, $time);
          READ_WRITE = 1;
      end
      end
    end else if (CLKA_ === 1'b0 && LAST_CLKA === 1'b1) begin
      QA_int_delayed = QA_int;
    end
    LAST_CLKA = CLKA_;
  end
  end
  always @ (CENB_ or TCENB_ or TENB_ or CLKB_) begin
  	if(CLKB_ == 1'b0) begin
  		CENB_p2 = CENB_;
  		TCENB_p2 = TCENB_;
  	end
  end

  always @ RET1N_ begin
    if (CLKB_ == 1'b1) begin
      failedWrite(1);
      QA_int = {124{1'bx}};
    end
    if (RET1N_ === 1'bx || RET1N_ === 1'bz) begin
      failedWrite(1);
      QA_int = {124{1'bx}};
    end else if (RET1N_ === 1'b0 && RET1N_int === 1'b1 && (CENB_p2 === 1'b0 || TCENB_p2 === 1'b0) ) begin
      failedWrite(1);
      QA_int = {124{1'bx}};
    end else if (RET1N_ === 1'b1 && RET1N_int === 1'b0 && (CENB_p2 === 1'b0 || TCENB_p2 === 1'b0) ) begin
      failedWrite(1);
      QA_int = {124{1'bx}};
    end
    if (RET1N_ == 1'b0) begin
      CENB_int = 1'bx;
      AB_int = {9{1'bx}};
      DB_int = {124{1'bx}};
      EMAB_int = {3{1'bx}};
      EMAWB_int = {2{1'bx}};
      TENB_int = 1'bx;
      TCENB_int = 1'bx;
      TAB_int = {9{1'bx}};
      TDB_int = {124{1'bx}};
      RET1N_int = 1'bx;
      STOVB_int = 1'bx;
      COLLDISN_int = 1'bx;
    end else begin
      CENB_int = 1'bx;
      AB_int = {9{1'bx}};
      DB_int = {124{1'bx}};
      EMAB_int = {3{1'bx}};
      EMAWB_int = {2{1'bx}};
      TENB_int = 1'bx;
      TCENB_int = 1'bx;
      TAB_int = {9{1'bx}};
      TDB_int = {124{1'bx}};
      RET1N_int = 1'bx;
      STOVB_int = 1'bx;
      COLLDISN_int = 1'bx;
    end
    RET1N_int = RET1N_;
  end

  always @ CLKB_ begin
  if (RET1N_ == 1'b0) begin
      // no cycle in retention mode
  end else begin
    if ((CLKB_ === 1'bx || CLKB_ === 1'bz) && RET1N_ !== 1'b0) begin
      QA_int = {124{1'bx}};
    end else if (CLKB_ === 1'b1 && LAST_CLKB === 1'b0) begin
      CENB_int = TENB_ ? CENB_ : TCENB_;
      EMAB_int = EMAB_;
      EMAWB_int = EMAWB_;
      TENB_int = TENB_;
      RET1N_int = RET1N_;
      STOVB_int = STOVB_;
      COLLDISN_int = COLLDISN_;
      if (CENB_int != 1'b1) begin
        AB_int = TENB_ ? AB_ : TAB_;
        DB_int = TENB_ ? DB_ : TDB_;
        TCENB_int = TCENB_;
        TAB_int = TAB_;
        TDB_int = TDB_;
      end
      clk1_int = 1'b0;
    WriteB;
      if (CENB_int === 1'b0) previous_CLKB = $realtime;
    #0;
      if (((previous_CLKA == previous_CLKB) || ((STOVA_int==1'b1 || STOVB_int==1'b1) 
       && CLKA_ == 1'b1 && CLKB_ == 1'b1)) && COLLDISN_int === 1'b1 && (CENA_int !== 
       1'b1 && CENB_int !== 1'b1) && is_contention(AA_int, AB_int, 1'b1, 1'b0)) begin
          $display("%s contention: write B succeeds, read A fails in %m at %0t",ASSERT_PREFIX, $time);
          ROW_CC = 1;
          COL_CC = 1;
        QA_int = {124{1'bx}};
      end else if (((previous_CLKA == previous_CLKB) || ((STOVA_int==1'b1 || STOVB_int==1'b1) 
       && CLKA_ == 1'b1 && CLKB_ == 1'b1)) && COLLDISN_int === 1'b1 && (CENA_int !== 
       1'b1 && CENB_int !== 1'b1) && row_contention(AA_int, AB_int, 1'b1, 1'b0)) begin
         //  $display("%s row contention: in %m at %0t",ASSERT_PREFIX, $time);
          ROW_CC = 1;
         //  $display("%s contention: write B succeeds, read A succeeds in %m at %0t",ASSERT_PREFIX, $time);
          READ_WRITE = 1;
      end else if (((previous_CLKA == previous_CLKB) || ((STOVA_int==1'b1 || STOVB_int==1'b1) 
       && CLKA_ == 1'b1 && CLKB_ == 1'b1)) && (CENA_int !== 1'b1 && CENB_int !== 1'b1) 
       && (COLLDISN_int === 1'b0 || COLLDISN_int === 1'bx) && row_contention(AA_int,
        AB_int,1'b1, 1'b0)) begin
          $display("%s row contention: in %m at %0t",ASSERT_PREFIX, $time);
          ROW_CC = 1;
          $display("%s contention: write B fails in %m at %0t",ASSERT_PREFIX, $time);
          READ_WRITE = 1;
        DB_int = {124{1'bx}};
        WriteB;
        if (col_contention(AA_int,AB_int)) begin
          $display("%s contention: read A fails in %m at %0t",ASSERT_PREFIX, $time);
          COL_CC = 1;
          READ_WRITE = 1;
        QA_int = {124{1'bx}};
      end else begin
          $display("%s contention: read A succeeds in %m at %0t",ASSERT_PREFIX, $time);
          READ_WRITE = 1;
      end
      end
    end
    LAST_CLKB = CLKB_;
  end
  end

  function row_contention;
    input [8:0] aa;
    input [8:0] ab;
    input  wena;
    input  wenb;
    reg result;
    reg sameRow;
    reg sameMux;
    reg anyWrite;
  begin
    anyWrite = ((& wena) === 1'b1 && (& wenb) === 1'b1) ? 1'b0 : 1'b1;
    sameMux = (aa[0:0] == ab[0:0]) ? 1'b1 : 1'b0;
    if (aa[8:1] == ab[8:1]) begin
      sameRow = 1'b1;
    end else begin
      sameRow = 1'b0;
    end
    if (sameRow == 1'b1 && anyWrite == 1'b1)
      row_contention = 1'b1;
    else if (sameRow == 1'b1 && sameMux == 1'b1)
      row_contention = 1'b1;
    else
      row_contention = 1'b0;
  end
  endfunction

  function col_contention;
    input [8:0] aa;
    input [8:0] ab;
  begin
    if (aa[0:0] == ab[0:0])
      col_contention = 1'b1;
    else
      col_contention = 1'b0;
  end
  endfunction

  function is_contention;
    input [8:0] aa;
    input [8:0] ab;
    input  wena;
    input  wenb;
    reg result;
  begin
    if ((& wena) === 1'b1 && (& wenb) === 1'b1) begin
      result = 1'b0;
    end else if (aa == ab) begin
      result = 1'b1;
    end else begin
      result = 1'b0;
    end
    is_contention = result;
  end
  endfunction


endmodule
`endcelldefine
`else
`celldefine
// If POWER_PINS is defined at Simulator Command Line, it selects the module definition with Power Ports
`ifdef POWER_PINS
module RF_2p_CRT_4x512 (VDDCE, VDDPE, VSSE, CENYA, AYA, CENYB, AYB, DYB, QA, CLKA,
    CENA, AA, CLKB, CENB, AB, DB, EMAA, EMASA, EMAB, EMAWB, TENA, BENA, TCENA, TAA,
    TQA, TENB, TCENB, TAB, TDB, RET1N, STOVA, STOVB, COLLDISN);
`else
module RF_2p_CRT_4x512 (CENYA, AYA, CENYB, AYB, DYB, QA, CLKA, CENA, AA, CLKB, CENB,
    AB, DB, EMAA, EMASA, EMAB, EMAWB, TENA, BENA, TCENA, TAA, TQA, TENB, TCENB, TAB,
    TDB, RET1N, STOVA, STOVB, COLLDISN);
`endif

  parameter ASSERT_PREFIX = "";
  parameter BITS = 124;
  parameter WORDS = 512;
  parameter MUX = 2;
  parameter MEM_WIDTH = 248; // redun block size 2, 124 on left, 124 on right
  parameter MEM_HEIGHT = 256;
  parameter WP_SIZE = 124 ;
  parameter UPM_WIDTH = 3;
  parameter UPMW_WIDTH = 2;
  parameter UPMS_WIDTH = 1;

  output  CENYA;
  output [8:0] AYA;
  output  CENYB;
  output [8:0] AYB;
  output [123:0] DYB;
  output [123:0] QA;
  input  CLKA;
  input  CENA;
  input [8:0] AA;
  input  CLKB;
  input  CENB;
  input [8:0] AB;
  input [123:0] DB;
  input [2:0] EMAA;
  input  EMASA;
  input [2:0] EMAB;
  input [1:0] EMAWB;
  input  TENA;
  input  BENA;
  input  TCENA;
  input [8:0] TAA;
  input [123:0] TQA;
  input  TENB;
  input  TCENB;
  input [8:0] TAB;
  input [123:0] TDB;
  input  RET1N;
  input  STOVA;
  input  STOVB;
  input  COLLDISN;
`ifdef POWER_PINS
  inout VDDCE;
  inout VDDPE;
  inout VSSE;
`endif

  integer row_address;
  integer mux_address;
  reg [247:0] mem [0:255];
  reg [247:0] row;
  reg LAST_CLKA;
  reg [247:0] row_mask;
  reg [247:0] new_data;
  reg [247:0] data_out;
  reg LAST_CLKB;
  reg [123:0] QA_int;
  reg [123:0] QA_int_delayed;
  reg [123:0] writeEnable;
  real previous_CLKA;
  real previous_CLKB;
  initial previous_CLKA = 0;
  initial previous_CLKB = 0;
  reg READ_WRITE, WRITE_WRITE, READ_READ, ROW_CC, COL_CC;
  reg READ_WRITE_1, WRITE_WRITE_1, READ_READ_1;
  reg  cont_flag0_int;
  reg  cont_flag1_int;
  initial cont_flag0_int = 1'b0;
  initial cont_flag1_int = 1'b0;

  reg NOT_CENA, NOT_AA8, NOT_AA7, NOT_AA6, NOT_AA5, NOT_AA4, NOT_AA3, NOT_AA2, NOT_AA1;
  reg NOT_AA0, NOT_CENB, NOT_AB8, NOT_AB7, NOT_AB6, NOT_AB5, NOT_AB4, NOT_AB3, NOT_AB2;
  reg NOT_AB1, NOT_AB0, NOT_DB123, NOT_DB122, NOT_DB121, NOT_DB120, NOT_DB119, NOT_DB118;
  reg NOT_DB117, NOT_DB116, NOT_DB115, NOT_DB114, NOT_DB113, NOT_DB112, NOT_DB111;
  reg NOT_DB110, NOT_DB109, NOT_DB108, NOT_DB107, NOT_DB106, NOT_DB105, NOT_DB104;
  reg NOT_DB103, NOT_DB102, NOT_DB101, NOT_DB100, NOT_DB99, NOT_DB98, NOT_DB97, NOT_DB96;
  reg NOT_DB95, NOT_DB94, NOT_DB93, NOT_DB92, NOT_DB91, NOT_DB90, NOT_DB89, NOT_DB88;
  reg NOT_DB87, NOT_DB86, NOT_DB85, NOT_DB84, NOT_DB83, NOT_DB82, NOT_DB81, NOT_DB80;
  reg NOT_DB79, NOT_DB78, NOT_DB77, NOT_DB76, NOT_DB75, NOT_DB74, NOT_DB73, NOT_DB72;
  reg NOT_DB71, NOT_DB70, NOT_DB69, NOT_DB68, NOT_DB67, NOT_DB66, NOT_DB65, NOT_DB64;
  reg NOT_DB63, NOT_DB62, NOT_DB61, NOT_DB60, NOT_DB59, NOT_DB58, NOT_DB57, NOT_DB56;
  reg NOT_DB55, NOT_DB54, NOT_DB53, NOT_DB52, NOT_DB51, NOT_DB50, NOT_DB49, NOT_DB48;
  reg NOT_DB47, NOT_DB46, NOT_DB45, NOT_DB44, NOT_DB43, NOT_DB42, NOT_DB41, NOT_DB40;
  reg NOT_DB39, NOT_DB38, NOT_DB37, NOT_DB36, NOT_DB35, NOT_DB34, NOT_DB33, NOT_DB32;
  reg NOT_DB31, NOT_DB30, NOT_DB29, NOT_DB28, NOT_DB27, NOT_DB26, NOT_DB25, NOT_DB24;
  reg NOT_DB23, NOT_DB22, NOT_DB21, NOT_DB20, NOT_DB19, NOT_DB18, NOT_DB17, NOT_DB16;
  reg NOT_DB15, NOT_DB14, NOT_DB13, NOT_DB12, NOT_DB11, NOT_DB10, NOT_DB9, NOT_DB8;
  reg NOT_DB7, NOT_DB6, NOT_DB5, NOT_DB4, NOT_DB3, NOT_DB2, NOT_DB1, NOT_DB0, NOT_EMAA2;
  reg NOT_EMAA1, NOT_EMAA0, NOT_EMASA, NOT_EMAB2, NOT_EMAB1, NOT_EMAB0, NOT_EMAWB1;
  reg NOT_EMAWB0, NOT_TENA, NOT_TCENA, NOT_TAA8, NOT_TAA7, NOT_TAA6, NOT_TAA5, NOT_TAA4;
  reg NOT_TAA3, NOT_TAA2, NOT_TAA1, NOT_TAA0, NOT_TENB, NOT_TCENB, NOT_TAB8, NOT_TAB7;
  reg NOT_TAB6, NOT_TAB5, NOT_TAB4, NOT_TAB3, NOT_TAB2, NOT_TAB1, NOT_TAB0, NOT_TDB123;
  reg NOT_TDB122, NOT_TDB121, NOT_TDB120, NOT_TDB119, NOT_TDB118, NOT_TDB117, NOT_TDB116;
  reg NOT_TDB115, NOT_TDB114, NOT_TDB113, NOT_TDB112, NOT_TDB111, NOT_TDB110, NOT_TDB109;
  reg NOT_TDB108, NOT_TDB107, NOT_TDB106, NOT_TDB105, NOT_TDB104, NOT_TDB103, NOT_TDB102;
  reg NOT_TDB101, NOT_TDB100, NOT_TDB99, NOT_TDB98, NOT_TDB97, NOT_TDB96, NOT_TDB95;
  reg NOT_TDB94, NOT_TDB93, NOT_TDB92, NOT_TDB91, NOT_TDB90, NOT_TDB89, NOT_TDB88;
  reg NOT_TDB87, NOT_TDB86, NOT_TDB85, NOT_TDB84, NOT_TDB83, NOT_TDB82, NOT_TDB81;
  reg NOT_TDB80, NOT_TDB79, NOT_TDB78, NOT_TDB77, NOT_TDB76, NOT_TDB75, NOT_TDB74;
  reg NOT_TDB73, NOT_TDB72, NOT_TDB71, NOT_TDB70, NOT_TDB69, NOT_TDB68, NOT_TDB67;
  reg NOT_TDB66, NOT_TDB65, NOT_TDB64, NOT_TDB63, NOT_TDB62, NOT_TDB61, NOT_TDB60;
  reg NOT_TDB59, NOT_TDB58, NOT_TDB57, NOT_TDB56, NOT_TDB55, NOT_TDB54, NOT_TDB53;
  reg NOT_TDB52, NOT_TDB51, NOT_TDB50, NOT_TDB49, NOT_TDB48, NOT_TDB47, NOT_TDB46;
  reg NOT_TDB45, NOT_TDB44, NOT_TDB43, NOT_TDB42, NOT_TDB41, NOT_TDB40, NOT_TDB39;
  reg NOT_TDB38, NOT_TDB37, NOT_TDB36, NOT_TDB35, NOT_TDB34, NOT_TDB33, NOT_TDB32;
  reg NOT_TDB31, NOT_TDB30, NOT_TDB29, NOT_TDB28, NOT_TDB27, NOT_TDB26, NOT_TDB25;
  reg NOT_TDB24, NOT_TDB23, NOT_TDB22, NOT_TDB21, NOT_TDB20, NOT_TDB19, NOT_TDB18;
  reg NOT_TDB17, NOT_TDB16, NOT_TDB15, NOT_TDB14, NOT_TDB13, NOT_TDB12, NOT_TDB11;
  reg NOT_TDB10, NOT_TDB9, NOT_TDB8, NOT_TDB7, NOT_TDB6, NOT_TDB5, NOT_TDB4, NOT_TDB3;
  reg NOT_TDB2, NOT_TDB1, NOT_TDB0, NOT_RET1N, NOT_STOVA, NOT_STOVB, NOT_COLLDISN;
  reg NOT_CONTA, NOT_CLKA_PER, NOT_CLKA_MINH, NOT_CLKA_MINL, NOT_CONTB, NOT_CLKB_PER;
  reg NOT_CLKB_MINH, NOT_CLKB_MINL;
  reg clk0_int;
  reg clk1_int;

  wire  CENYA_;
  wire [8:0] AYA_;
  wire  CENYB_;
  wire [8:0] AYB_;
  wire [123:0] DYB_;
  wire [123:0] QA_;
 wire  CLKA_;
  wire  CENA_;
  reg  CENA_int;
  reg  CENA_p2;
  wire [8:0] AA_;
  reg [8:0] AA_int;
 wire  CLKB_;
  wire  CENB_;
  reg  CENB_int;
  reg  CENB_p2;
  wire [8:0] AB_;
  reg [8:0] AB_int;
  wire [123:0] DB_;
  reg [123:0] DB_int;
  wire [2:0] EMAA_;
  reg [2:0] EMAA_int;
  wire  EMASA_;
  reg  EMASA_int;
  wire [2:0] EMAB_;
  reg [2:0] EMAB_int;
  wire [1:0] EMAWB_;
  reg [1:0] EMAWB_int;
  wire  TENA_;
  reg  TENA_int;
  wire  BENA_;
  reg  BENA_int;
  wire  TCENA_;
  reg  TCENA_int;
  reg  TCENA_p2;
  wire [8:0] TAA_;
  reg [8:0] TAA_int;
  wire [123:0] TQA_;
  reg [123:0] TQA_int;
  wire  TENB_;
  reg  TENB_int;
  wire  TCENB_;
  reg  TCENB_int;
  reg  TCENB_p2;
  wire [8:0] TAB_;
  reg [8:0] TAB_int;
  wire [123:0] TDB_;
  reg [123:0] TDB_int;
  wire  RET1N_;
  reg  RET1N_int;
  wire  STOVA_;
  reg  STOVA_int;
  wire  STOVB_;
  reg  STOVB_int;
  wire  COLLDISN_;
  reg  COLLDISN_int;

  buf B0(CENYA, CENYA_);
  buf B1(AYA[0], AYA_[0]);
  buf B2(AYA[1], AYA_[1]);
  buf B3(AYA[2], AYA_[2]);
  buf B4(AYA[3], AYA_[3]);
  buf B5(AYA[4], AYA_[4]);
  buf B6(AYA[5], AYA_[5]);
  buf B7(AYA[6], AYA_[6]);
  buf B8(AYA[7], AYA_[7]);
  buf B9(AYA[8], AYA_[8]);
  buf B10(CENYB, CENYB_);
  buf B11(AYB[0], AYB_[0]);
  buf B12(AYB[1], AYB_[1]);
  buf B13(AYB[2], AYB_[2]);
  buf B14(AYB[3], AYB_[3]);
  buf B15(AYB[4], AYB_[4]);
  buf B16(AYB[5], AYB_[5]);
  buf B17(AYB[6], AYB_[6]);
  buf B18(AYB[7], AYB_[7]);
  buf B19(AYB[8], AYB_[8]);
  buf B20(DYB[0], DYB_[0]);
  buf B21(DYB[1], DYB_[1]);
  buf B22(DYB[2], DYB_[2]);
  buf B23(DYB[3], DYB_[3]);
  buf B24(DYB[4], DYB_[4]);
  buf B25(DYB[5], DYB_[5]);
  buf B26(DYB[6], DYB_[6]);
  buf B27(DYB[7], DYB_[7]);
  buf B28(DYB[8], DYB_[8]);
  buf B29(DYB[9], DYB_[9]);
  buf B30(DYB[10], DYB_[10]);
  buf B31(DYB[11], DYB_[11]);
  buf B32(DYB[12], DYB_[12]);
  buf B33(DYB[13], DYB_[13]);
  buf B34(DYB[14], DYB_[14]);
  buf B35(DYB[15], DYB_[15]);
  buf B36(DYB[16], DYB_[16]);
  buf B37(DYB[17], DYB_[17]);
  buf B38(DYB[18], DYB_[18]);
  buf B39(DYB[19], DYB_[19]);
  buf B40(DYB[20], DYB_[20]);
  buf B41(DYB[21], DYB_[21]);
  buf B42(DYB[22], DYB_[22]);
  buf B43(DYB[23], DYB_[23]);
  buf B44(DYB[24], DYB_[24]);
  buf B45(DYB[25], DYB_[25]);
  buf B46(DYB[26], DYB_[26]);
  buf B47(DYB[27], DYB_[27]);
  buf B48(DYB[28], DYB_[28]);
  buf B49(DYB[29], DYB_[29]);
  buf B50(DYB[30], DYB_[30]);
  buf B51(DYB[31], DYB_[31]);
  buf B52(DYB[32], DYB_[32]);
  buf B53(DYB[33], DYB_[33]);
  buf B54(DYB[34], DYB_[34]);
  buf B55(DYB[35], DYB_[35]);
  buf B56(DYB[36], DYB_[36]);
  buf B57(DYB[37], DYB_[37]);
  buf B58(DYB[38], DYB_[38]);
  buf B59(DYB[39], DYB_[39]);
  buf B60(DYB[40], DYB_[40]);
  buf B61(DYB[41], DYB_[41]);
  buf B62(DYB[42], DYB_[42]);
  buf B63(DYB[43], DYB_[43]);
  buf B64(DYB[44], DYB_[44]);
  buf B65(DYB[45], DYB_[45]);
  buf B66(DYB[46], DYB_[46]);
  buf B67(DYB[47], DYB_[47]);
  buf B68(DYB[48], DYB_[48]);
  buf B69(DYB[49], DYB_[49]);
  buf B70(DYB[50], DYB_[50]);
  buf B71(DYB[51], DYB_[51]);
  buf B72(DYB[52], DYB_[52]);
  buf B73(DYB[53], DYB_[53]);
  buf B74(DYB[54], DYB_[54]);
  buf B75(DYB[55], DYB_[55]);
  buf B76(DYB[56], DYB_[56]);
  buf B77(DYB[57], DYB_[57]);
  buf B78(DYB[58], DYB_[58]);
  buf B79(DYB[59], DYB_[59]);
  buf B80(DYB[60], DYB_[60]);
  buf B81(DYB[61], DYB_[61]);
  buf B82(DYB[62], DYB_[62]);
  buf B83(DYB[63], DYB_[63]);
  buf B84(DYB[64], DYB_[64]);
  buf B85(DYB[65], DYB_[65]);
  buf B86(DYB[66], DYB_[66]);
  buf B87(DYB[67], DYB_[67]);
  buf B88(DYB[68], DYB_[68]);
  buf B89(DYB[69], DYB_[69]);
  buf B90(DYB[70], DYB_[70]);
  buf B91(DYB[71], DYB_[71]);
  buf B92(DYB[72], DYB_[72]);
  buf B93(DYB[73], DYB_[73]);
  buf B94(DYB[74], DYB_[74]);
  buf B95(DYB[75], DYB_[75]);
  buf B96(DYB[76], DYB_[76]);
  buf B97(DYB[77], DYB_[77]);
  buf B98(DYB[78], DYB_[78]);
  buf B99(DYB[79], DYB_[79]);
  buf B100(DYB[80], DYB_[80]);
  buf B101(DYB[81], DYB_[81]);
  buf B102(DYB[82], DYB_[82]);
  buf B103(DYB[83], DYB_[83]);
  buf B104(DYB[84], DYB_[84]);
  buf B105(DYB[85], DYB_[85]);
  buf B106(DYB[86], DYB_[86]);
  buf B107(DYB[87], DYB_[87]);
  buf B108(DYB[88], DYB_[88]);
  buf B109(DYB[89], DYB_[89]);
  buf B110(DYB[90], DYB_[90]);
  buf B111(DYB[91], DYB_[91]);
  buf B112(DYB[92], DYB_[92]);
  buf B113(DYB[93], DYB_[93]);
  buf B114(DYB[94], DYB_[94]);
  buf B115(DYB[95], DYB_[95]);
  buf B116(DYB[96], DYB_[96]);
  buf B117(DYB[97], DYB_[97]);
  buf B118(DYB[98], DYB_[98]);
  buf B119(DYB[99], DYB_[99]);
  buf B120(DYB[100], DYB_[100]);
  buf B121(DYB[101], DYB_[101]);
  buf B122(DYB[102], DYB_[102]);
  buf B123(DYB[103], DYB_[103]);
  buf B124(DYB[104], DYB_[104]);
  buf B125(DYB[105], DYB_[105]);
  buf B126(DYB[106], DYB_[106]);
  buf B127(DYB[107], DYB_[107]);
  buf B128(DYB[108], DYB_[108]);
  buf B129(DYB[109], DYB_[109]);
  buf B130(DYB[110], DYB_[110]);
  buf B131(DYB[111], DYB_[111]);
  buf B132(DYB[112], DYB_[112]);
  buf B133(DYB[113], DYB_[113]);
  buf B134(DYB[114], DYB_[114]);
  buf B135(DYB[115], DYB_[115]);
  buf B136(DYB[116], DYB_[116]);
  buf B137(DYB[117], DYB_[117]);
  buf B138(DYB[118], DYB_[118]);
  buf B139(DYB[119], DYB_[119]);
  buf B140(DYB[120], DYB_[120]);
  buf B141(DYB[121], DYB_[121]);
  buf B142(DYB[122], DYB_[122]);
  buf B143(DYB[123], DYB_[123]);
  buf B144(QA[0], QA_[0]);
  buf B145(QA[1], QA_[1]);
  buf B146(QA[2], QA_[2]);
  buf B147(QA[3], QA_[3]);
  buf B148(QA[4], QA_[4]);
  buf B149(QA[5], QA_[5]);
  buf B150(QA[6], QA_[6]);
  buf B151(QA[7], QA_[7]);
  buf B152(QA[8], QA_[8]);
  buf B153(QA[9], QA_[9]);
  buf B154(QA[10], QA_[10]);
  buf B155(QA[11], QA_[11]);
  buf B156(QA[12], QA_[12]);
  buf B157(QA[13], QA_[13]);
  buf B158(QA[14], QA_[14]);
  buf B159(QA[15], QA_[15]);
  buf B160(QA[16], QA_[16]);
  buf B161(QA[17], QA_[17]);
  buf B162(QA[18], QA_[18]);
  buf B163(QA[19], QA_[19]);
  buf B164(QA[20], QA_[20]);
  buf B165(QA[21], QA_[21]);
  buf B166(QA[22], QA_[22]);
  buf B167(QA[23], QA_[23]);
  buf B168(QA[24], QA_[24]);
  buf B169(QA[25], QA_[25]);
  buf B170(QA[26], QA_[26]);
  buf B171(QA[27], QA_[27]);
  buf B172(QA[28], QA_[28]);
  buf B173(QA[29], QA_[29]);
  buf B174(QA[30], QA_[30]);
  buf B175(QA[31], QA_[31]);
  buf B176(QA[32], QA_[32]);
  buf B177(QA[33], QA_[33]);
  buf B178(QA[34], QA_[34]);
  buf B179(QA[35], QA_[35]);
  buf B180(QA[36], QA_[36]);
  buf B181(QA[37], QA_[37]);
  buf B182(QA[38], QA_[38]);
  buf B183(QA[39], QA_[39]);
  buf B184(QA[40], QA_[40]);
  buf B185(QA[41], QA_[41]);
  buf B186(QA[42], QA_[42]);
  buf B187(QA[43], QA_[43]);
  buf B188(QA[44], QA_[44]);
  buf B189(QA[45], QA_[45]);
  buf B190(QA[46], QA_[46]);
  buf B191(QA[47], QA_[47]);
  buf B192(QA[48], QA_[48]);
  buf B193(QA[49], QA_[49]);
  buf B194(QA[50], QA_[50]);
  buf B195(QA[51], QA_[51]);
  buf B196(QA[52], QA_[52]);
  buf B197(QA[53], QA_[53]);
  buf B198(QA[54], QA_[54]);
  buf B199(QA[55], QA_[55]);
  buf B200(QA[56], QA_[56]);
  buf B201(QA[57], QA_[57]);
  buf B202(QA[58], QA_[58]);
  buf B203(QA[59], QA_[59]);
  buf B204(QA[60], QA_[60]);
  buf B205(QA[61], QA_[61]);
  buf B206(QA[62], QA_[62]);
  buf B207(QA[63], QA_[63]);
  buf B208(QA[64], QA_[64]);
  buf B209(QA[65], QA_[65]);
  buf B210(QA[66], QA_[66]);
  buf B211(QA[67], QA_[67]);
  buf B212(QA[68], QA_[68]);
  buf B213(QA[69], QA_[69]);
  buf B214(QA[70], QA_[70]);
  buf B215(QA[71], QA_[71]);
  buf B216(QA[72], QA_[72]);
  buf B217(QA[73], QA_[73]);
  buf B218(QA[74], QA_[74]);
  buf B219(QA[75], QA_[75]);
  buf B220(QA[76], QA_[76]);
  buf B221(QA[77], QA_[77]);
  buf B222(QA[78], QA_[78]);
  buf B223(QA[79], QA_[79]);
  buf B224(QA[80], QA_[80]);
  buf B225(QA[81], QA_[81]);
  buf B226(QA[82], QA_[82]);
  buf B227(QA[83], QA_[83]);
  buf B228(QA[84], QA_[84]);
  buf B229(QA[85], QA_[85]);
  buf B230(QA[86], QA_[86]);
  buf B231(QA[87], QA_[87]);
  buf B232(QA[88], QA_[88]);
  buf B233(QA[89], QA_[89]);
  buf B234(QA[90], QA_[90]);
  buf B235(QA[91], QA_[91]);
  buf B236(QA[92], QA_[92]);
  buf B237(QA[93], QA_[93]);
  buf B238(QA[94], QA_[94]);
  buf B239(QA[95], QA_[95]);
  buf B240(QA[96], QA_[96]);
  buf B241(QA[97], QA_[97]);
  buf B242(QA[98], QA_[98]);
  buf B243(QA[99], QA_[99]);
  buf B244(QA[100], QA_[100]);
  buf B245(QA[101], QA_[101]);
  buf B246(QA[102], QA_[102]);
  buf B247(QA[103], QA_[103]);
  buf B248(QA[104], QA_[104]);
  buf B249(QA[105], QA_[105]);
  buf B250(QA[106], QA_[106]);
  buf B251(QA[107], QA_[107]);
  buf B252(QA[108], QA_[108]);
  buf B253(QA[109], QA_[109]);
  buf B254(QA[110], QA_[110]);
  buf B255(QA[111], QA_[111]);
  buf B256(QA[112], QA_[112]);
  buf B257(QA[113], QA_[113]);
  buf B258(QA[114], QA_[114]);
  buf B259(QA[115], QA_[115]);
  buf B260(QA[116], QA_[116]);
  buf B261(QA[117], QA_[117]);
  buf B262(QA[118], QA_[118]);
  buf B263(QA[119], QA_[119]);
  buf B264(QA[120], QA_[120]);
  buf B265(QA[121], QA_[121]);
  buf B266(QA[122], QA_[122]);
  buf B267(QA[123], QA_[123]);
  buf B268(CLKA_, CLKA);
  buf B269(CENA_, CENA);
  buf B270(AA_[0], AA[0]);
  buf B271(AA_[1], AA[1]);
  buf B272(AA_[2], AA[2]);
  buf B273(AA_[3], AA[3]);
  buf B274(AA_[4], AA[4]);
  buf B275(AA_[5], AA[5]);
  buf B276(AA_[6], AA[6]);
  buf B277(AA_[7], AA[7]);
  buf B278(AA_[8], AA[8]);
  buf B279(CLKB_, CLKB);
  buf B280(CENB_, CENB);
  buf B281(AB_[0], AB[0]);
  buf B282(AB_[1], AB[1]);
  buf B283(AB_[2], AB[2]);
  buf B284(AB_[3], AB[3]);
  buf B285(AB_[4], AB[4]);
  buf B286(AB_[5], AB[5]);
  buf B287(AB_[6], AB[6]);
  buf B288(AB_[7], AB[7]);
  buf B289(AB_[8], AB[8]);
  buf B290(DB_[0], DB[0]);
  buf B291(DB_[1], DB[1]);
  buf B292(DB_[2], DB[2]);
  buf B293(DB_[3], DB[3]);
  buf B294(DB_[4], DB[4]);
  buf B295(DB_[5], DB[5]);
  buf B296(DB_[6], DB[6]);
  buf B297(DB_[7], DB[7]);
  buf B298(DB_[8], DB[8]);
  buf B299(DB_[9], DB[9]);
  buf B300(DB_[10], DB[10]);
  buf B301(DB_[11], DB[11]);
  buf B302(DB_[12], DB[12]);
  buf B303(DB_[13], DB[13]);
  buf B304(DB_[14], DB[14]);
  buf B305(DB_[15], DB[15]);
  buf B306(DB_[16], DB[16]);
  buf B307(DB_[17], DB[17]);
  buf B308(DB_[18], DB[18]);
  buf B309(DB_[19], DB[19]);
  buf B310(DB_[20], DB[20]);
  buf B311(DB_[21], DB[21]);
  buf B312(DB_[22], DB[22]);
  buf B313(DB_[23], DB[23]);
  buf B314(DB_[24], DB[24]);
  buf B315(DB_[25], DB[25]);
  buf B316(DB_[26], DB[26]);
  buf B317(DB_[27], DB[27]);
  buf B318(DB_[28], DB[28]);
  buf B319(DB_[29], DB[29]);
  buf B320(DB_[30], DB[30]);
  buf B321(DB_[31], DB[31]);
  buf B322(DB_[32], DB[32]);
  buf B323(DB_[33], DB[33]);
  buf B324(DB_[34], DB[34]);
  buf B325(DB_[35], DB[35]);
  buf B326(DB_[36], DB[36]);
  buf B327(DB_[37], DB[37]);
  buf B328(DB_[38], DB[38]);
  buf B329(DB_[39], DB[39]);
  buf B330(DB_[40], DB[40]);
  buf B331(DB_[41], DB[41]);
  buf B332(DB_[42], DB[42]);
  buf B333(DB_[43], DB[43]);
  buf B334(DB_[44], DB[44]);
  buf B335(DB_[45], DB[45]);
  buf B336(DB_[46], DB[46]);
  buf B337(DB_[47], DB[47]);
  buf B338(DB_[48], DB[48]);
  buf B339(DB_[49], DB[49]);
  buf B340(DB_[50], DB[50]);
  buf B341(DB_[51], DB[51]);
  buf B342(DB_[52], DB[52]);
  buf B343(DB_[53], DB[53]);
  buf B344(DB_[54], DB[54]);
  buf B345(DB_[55], DB[55]);
  buf B346(DB_[56], DB[56]);
  buf B347(DB_[57], DB[57]);
  buf B348(DB_[58], DB[58]);
  buf B349(DB_[59], DB[59]);
  buf B350(DB_[60], DB[60]);
  buf B351(DB_[61], DB[61]);
  buf B352(DB_[62], DB[62]);
  buf B353(DB_[63], DB[63]);
  buf B354(DB_[64], DB[64]);
  buf B355(DB_[65], DB[65]);
  buf B356(DB_[66], DB[66]);
  buf B357(DB_[67], DB[67]);
  buf B358(DB_[68], DB[68]);
  buf B359(DB_[69], DB[69]);
  buf B360(DB_[70], DB[70]);
  buf B361(DB_[71], DB[71]);
  buf B362(DB_[72], DB[72]);
  buf B363(DB_[73], DB[73]);
  buf B364(DB_[74], DB[74]);
  buf B365(DB_[75], DB[75]);
  buf B366(DB_[76], DB[76]);
  buf B367(DB_[77], DB[77]);
  buf B368(DB_[78], DB[78]);
  buf B369(DB_[79], DB[79]);
  buf B370(DB_[80], DB[80]);
  buf B371(DB_[81], DB[81]);
  buf B372(DB_[82], DB[82]);
  buf B373(DB_[83], DB[83]);
  buf B374(DB_[84], DB[84]);
  buf B375(DB_[85], DB[85]);
  buf B376(DB_[86], DB[86]);
  buf B377(DB_[87], DB[87]);
  buf B378(DB_[88], DB[88]);
  buf B379(DB_[89], DB[89]);
  buf B380(DB_[90], DB[90]);
  buf B381(DB_[91], DB[91]);
  buf B382(DB_[92], DB[92]);
  buf B383(DB_[93], DB[93]);
  buf B384(DB_[94], DB[94]);
  buf B385(DB_[95], DB[95]);
  buf B386(DB_[96], DB[96]);
  buf B387(DB_[97], DB[97]);
  buf B388(DB_[98], DB[98]);
  buf B389(DB_[99], DB[99]);
  buf B390(DB_[100], DB[100]);
  buf B391(DB_[101], DB[101]);
  buf B392(DB_[102], DB[102]);
  buf B393(DB_[103], DB[103]);
  buf B394(DB_[104], DB[104]);
  buf B395(DB_[105], DB[105]);
  buf B396(DB_[106], DB[106]);
  buf B397(DB_[107], DB[107]);
  buf B398(DB_[108], DB[108]);
  buf B399(DB_[109], DB[109]);
  buf B400(DB_[110], DB[110]);
  buf B401(DB_[111], DB[111]);
  buf B402(DB_[112], DB[112]);
  buf B403(DB_[113], DB[113]);
  buf B404(DB_[114], DB[114]);
  buf B405(DB_[115], DB[115]);
  buf B406(DB_[116], DB[116]);
  buf B407(DB_[117], DB[117]);
  buf B408(DB_[118], DB[118]);
  buf B409(DB_[119], DB[119]);
  buf B410(DB_[120], DB[120]);
  buf B411(DB_[121], DB[121]);
  buf B412(DB_[122], DB[122]);
  buf B413(DB_[123], DB[123]);
  buf B414(EMAA_[0], EMAA[0]);
  buf B415(EMAA_[1], EMAA[1]);
  buf B416(EMAA_[2], EMAA[2]);
  buf B417(EMASA_, EMASA);
  buf B418(EMAB_[0], EMAB[0]);
  buf B419(EMAB_[1], EMAB[1]);
  buf B420(EMAB_[2], EMAB[2]);
  buf B421(EMAWB_[0], EMAWB[0]);
  buf B422(EMAWB_[1], EMAWB[1]);
  buf B423(TENA_, TENA);
  buf B424(BENA_, BENA);
  buf B425(TCENA_, TCENA);
  buf B426(TAA_[0], TAA[0]);
  buf B427(TAA_[1], TAA[1]);
  buf B428(TAA_[2], TAA[2]);
  buf B429(TAA_[3], TAA[3]);
  buf B430(TAA_[4], TAA[4]);
  buf B431(TAA_[5], TAA[5]);
  buf B432(TAA_[6], TAA[6]);
  buf B433(TAA_[7], TAA[7]);
  buf B434(TAA_[8], TAA[8]);
  buf B435(TQA_[0], TQA[0]);
  buf B436(TQA_[1], TQA[1]);
  buf B437(TQA_[2], TQA[2]);
  buf B438(TQA_[3], TQA[3]);
  buf B439(TQA_[4], TQA[4]);
  buf B440(TQA_[5], TQA[5]);
  buf B441(TQA_[6], TQA[6]);
  buf B442(TQA_[7], TQA[7]);
  buf B443(TQA_[8], TQA[8]);
  buf B444(TQA_[9], TQA[9]);
  buf B445(TQA_[10], TQA[10]);
  buf B446(TQA_[11], TQA[11]);
  buf B447(TQA_[12], TQA[12]);
  buf B448(TQA_[13], TQA[13]);
  buf B449(TQA_[14], TQA[14]);
  buf B450(TQA_[15], TQA[15]);
  buf B451(TQA_[16], TQA[16]);
  buf B452(TQA_[17], TQA[17]);
  buf B453(TQA_[18], TQA[18]);
  buf B454(TQA_[19], TQA[19]);
  buf B455(TQA_[20], TQA[20]);
  buf B456(TQA_[21], TQA[21]);
  buf B457(TQA_[22], TQA[22]);
  buf B458(TQA_[23], TQA[23]);
  buf B459(TQA_[24], TQA[24]);
  buf B460(TQA_[25], TQA[25]);
  buf B461(TQA_[26], TQA[26]);
  buf B462(TQA_[27], TQA[27]);
  buf B463(TQA_[28], TQA[28]);
  buf B464(TQA_[29], TQA[29]);
  buf B465(TQA_[30], TQA[30]);
  buf B466(TQA_[31], TQA[31]);
  buf B467(TQA_[32], TQA[32]);
  buf B468(TQA_[33], TQA[33]);
  buf B469(TQA_[34], TQA[34]);
  buf B470(TQA_[35], TQA[35]);
  buf B471(TQA_[36], TQA[36]);
  buf B472(TQA_[37], TQA[37]);
  buf B473(TQA_[38], TQA[38]);
  buf B474(TQA_[39], TQA[39]);
  buf B475(TQA_[40], TQA[40]);
  buf B476(TQA_[41], TQA[41]);
  buf B477(TQA_[42], TQA[42]);
  buf B478(TQA_[43], TQA[43]);
  buf B479(TQA_[44], TQA[44]);
  buf B480(TQA_[45], TQA[45]);
  buf B481(TQA_[46], TQA[46]);
  buf B482(TQA_[47], TQA[47]);
  buf B483(TQA_[48], TQA[48]);
  buf B484(TQA_[49], TQA[49]);
  buf B485(TQA_[50], TQA[50]);
  buf B486(TQA_[51], TQA[51]);
  buf B487(TQA_[52], TQA[52]);
  buf B488(TQA_[53], TQA[53]);
  buf B489(TQA_[54], TQA[54]);
  buf B490(TQA_[55], TQA[55]);
  buf B491(TQA_[56], TQA[56]);
  buf B492(TQA_[57], TQA[57]);
  buf B493(TQA_[58], TQA[58]);
  buf B494(TQA_[59], TQA[59]);
  buf B495(TQA_[60], TQA[60]);
  buf B496(TQA_[61], TQA[61]);
  buf B497(TQA_[62], TQA[62]);
  buf B498(TQA_[63], TQA[63]);
  buf B499(TQA_[64], TQA[64]);
  buf B500(TQA_[65], TQA[65]);
  buf B501(TQA_[66], TQA[66]);
  buf B502(TQA_[67], TQA[67]);
  buf B503(TQA_[68], TQA[68]);
  buf B504(TQA_[69], TQA[69]);
  buf B505(TQA_[70], TQA[70]);
  buf B506(TQA_[71], TQA[71]);
  buf B507(TQA_[72], TQA[72]);
  buf B508(TQA_[73], TQA[73]);
  buf B509(TQA_[74], TQA[74]);
  buf B510(TQA_[75], TQA[75]);
  buf B511(TQA_[76], TQA[76]);
  buf B512(TQA_[77], TQA[77]);
  buf B513(TQA_[78], TQA[78]);
  buf B514(TQA_[79], TQA[79]);
  buf B515(TQA_[80], TQA[80]);
  buf B516(TQA_[81], TQA[81]);
  buf B517(TQA_[82], TQA[82]);
  buf B518(TQA_[83], TQA[83]);
  buf B519(TQA_[84], TQA[84]);
  buf B520(TQA_[85], TQA[85]);
  buf B521(TQA_[86], TQA[86]);
  buf B522(TQA_[87], TQA[87]);
  buf B523(TQA_[88], TQA[88]);
  buf B524(TQA_[89], TQA[89]);
  buf B525(TQA_[90], TQA[90]);
  buf B526(TQA_[91], TQA[91]);
  buf B527(TQA_[92], TQA[92]);
  buf B528(TQA_[93], TQA[93]);
  buf B529(TQA_[94], TQA[94]);
  buf B530(TQA_[95], TQA[95]);
  buf B531(TQA_[96], TQA[96]);
  buf B532(TQA_[97], TQA[97]);
  buf B533(TQA_[98], TQA[98]);
  buf B534(TQA_[99], TQA[99]);
  buf B535(TQA_[100], TQA[100]);
  buf B536(TQA_[101], TQA[101]);
  buf B537(TQA_[102], TQA[102]);
  buf B538(TQA_[103], TQA[103]);
  buf B539(TQA_[104], TQA[104]);
  buf B540(TQA_[105], TQA[105]);
  buf B541(TQA_[106], TQA[106]);
  buf B542(TQA_[107], TQA[107]);
  buf B543(TQA_[108], TQA[108]);
  buf B544(TQA_[109], TQA[109]);
  buf B545(TQA_[110], TQA[110]);
  buf B546(TQA_[111], TQA[111]);
  buf B547(TQA_[112], TQA[112]);
  buf B548(TQA_[113], TQA[113]);
  buf B549(TQA_[114], TQA[114]);
  buf B550(TQA_[115], TQA[115]);
  buf B551(TQA_[116], TQA[116]);
  buf B552(TQA_[117], TQA[117]);
  buf B553(TQA_[118], TQA[118]);
  buf B554(TQA_[119], TQA[119]);
  buf B555(TQA_[120], TQA[120]);
  buf B556(TQA_[121], TQA[121]);
  buf B557(TQA_[122], TQA[122]);
  buf B558(TQA_[123], TQA[123]);
  buf B559(TENB_, TENB);
  buf B560(TCENB_, TCENB);
  buf B561(TAB_[0], TAB[0]);
  buf B562(TAB_[1], TAB[1]);
  buf B563(TAB_[2], TAB[2]);
  buf B564(TAB_[3], TAB[3]);
  buf B565(TAB_[4], TAB[4]);
  buf B566(TAB_[5], TAB[5]);
  buf B567(TAB_[6], TAB[6]);
  buf B568(TAB_[7], TAB[7]);
  buf B569(TAB_[8], TAB[8]);
  buf B570(TDB_[0], TDB[0]);
  buf B571(TDB_[1], TDB[1]);
  buf B572(TDB_[2], TDB[2]);
  buf B573(TDB_[3], TDB[3]);
  buf B574(TDB_[4], TDB[4]);
  buf B575(TDB_[5], TDB[5]);
  buf B576(TDB_[6], TDB[6]);
  buf B577(TDB_[7], TDB[7]);
  buf B578(TDB_[8], TDB[8]);
  buf B579(TDB_[9], TDB[9]);
  buf B580(TDB_[10], TDB[10]);
  buf B581(TDB_[11], TDB[11]);
  buf B582(TDB_[12], TDB[12]);
  buf B583(TDB_[13], TDB[13]);
  buf B584(TDB_[14], TDB[14]);
  buf B585(TDB_[15], TDB[15]);
  buf B586(TDB_[16], TDB[16]);
  buf B587(TDB_[17], TDB[17]);
  buf B588(TDB_[18], TDB[18]);
  buf B589(TDB_[19], TDB[19]);
  buf B590(TDB_[20], TDB[20]);
  buf B591(TDB_[21], TDB[21]);
  buf B592(TDB_[22], TDB[22]);
  buf B593(TDB_[23], TDB[23]);
  buf B594(TDB_[24], TDB[24]);
  buf B595(TDB_[25], TDB[25]);
  buf B596(TDB_[26], TDB[26]);
  buf B597(TDB_[27], TDB[27]);
  buf B598(TDB_[28], TDB[28]);
  buf B599(TDB_[29], TDB[29]);
  buf B600(TDB_[30], TDB[30]);
  buf B601(TDB_[31], TDB[31]);
  buf B602(TDB_[32], TDB[32]);
  buf B603(TDB_[33], TDB[33]);
  buf B604(TDB_[34], TDB[34]);
  buf B605(TDB_[35], TDB[35]);
  buf B606(TDB_[36], TDB[36]);
  buf B607(TDB_[37], TDB[37]);
  buf B608(TDB_[38], TDB[38]);
  buf B609(TDB_[39], TDB[39]);
  buf B610(TDB_[40], TDB[40]);
  buf B611(TDB_[41], TDB[41]);
  buf B612(TDB_[42], TDB[42]);
  buf B613(TDB_[43], TDB[43]);
  buf B614(TDB_[44], TDB[44]);
  buf B615(TDB_[45], TDB[45]);
  buf B616(TDB_[46], TDB[46]);
  buf B617(TDB_[47], TDB[47]);
  buf B618(TDB_[48], TDB[48]);
  buf B619(TDB_[49], TDB[49]);
  buf B620(TDB_[50], TDB[50]);
  buf B621(TDB_[51], TDB[51]);
  buf B622(TDB_[52], TDB[52]);
  buf B623(TDB_[53], TDB[53]);
  buf B624(TDB_[54], TDB[54]);
  buf B625(TDB_[55], TDB[55]);
  buf B626(TDB_[56], TDB[56]);
  buf B627(TDB_[57], TDB[57]);
  buf B628(TDB_[58], TDB[58]);
  buf B629(TDB_[59], TDB[59]);
  buf B630(TDB_[60], TDB[60]);
  buf B631(TDB_[61], TDB[61]);
  buf B632(TDB_[62], TDB[62]);
  buf B633(TDB_[63], TDB[63]);
  buf B634(TDB_[64], TDB[64]);
  buf B635(TDB_[65], TDB[65]);
  buf B636(TDB_[66], TDB[66]);
  buf B637(TDB_[67], TDB[67]);
  buf B638(TDB_[68], TDB[68]);
  buf B639(TDB_[69], TDB[69]);
  buf B640(TDB_[70], TDB[70]);
  buf B641(TDB_[71], TDB[71]);
  buf B642(TDB_[72], TDB[72]);
  buf B643(TDB_[73], TDB[73]);
  buf B644(TDB_[74], TDB[74]);
  buf B645(TDB_[75], TDB[75]);
  buf B646(TDB_[76], TDB[76]);
  buf B647(TDB_[77], TDB[77]);
  buf B648(TDB_[78], TDB[78]);
  buf B649(TDB_[79], TDB[79]);
  buf B650(TDB_[80], TDB[80]);
  buf B651(TDB_[81], TDB[81]);
  buf B652(TDB_[82], TDB[82]);
  buf B653(TDB_[83], TDB[83]);
  buf B654(TDB_[84], TDB[84]);
  buf B655(TDB_[85], TDB[85]);
  buf B656(TDB_[86], TDB[86]);
  buf B657(TDB_[87], TDB[87]);
  buf B658(TDB_[88], TDB[88]);
  buf B659(TDB_[89], TDB[89]);
  buf B660(TDB_[90], TDB[90]);
  buf B661(TDB_[91], TDB[91]);
  buf B662(TDB_[92], TDB[92]);
  buf B663(TDB_[93], TDB[93]);
  buf B664(TDB_[94], TDB[94]);
  buf B665(TDB_[95], TDB[95]);
  buf B666(TDB_[96], TDB[96]);
  buf B667(TDB_[97], TDB[97]);
  buf B668(TDB_[98], TDB[98]);
  buf B669(TDB_[99], TDB[99]);
  buf B670(TDB_[100], TDB[100]);
  buf B671(TDB_[101], TDB[101]);
  buf B672(TDB_[102], TDB[102]);
  buf B673(TDB_[103], TDB[103]);
  buf B674(TDB_[104], TDB[104]);
  buf B675(TDB_[105], TDB[105]);
  buf B676(TDB_[106], TDB[106]);
  buf B677(TDB_[107], TDB[107]);
  buf B678(TDB_[108], TDB[108]);
  buf B679(TDB_[109], TDB[109]);
  buf B680(TDB_[110], TDB[110]);
  buf B681(TDB_[111], TDB[111]);
  buf B682(TDB_[112], TDB[112]);
  buf B683(TDB_[113], TDB[113]);
  buf B684(TDB_[114], TDB[114]);
  buf B685(TDB_[115], TDB[115]);
  buf B686(TDB_[116], TDB[116]);
  buf B687(TDB_[117], TDB[117]);
  buf B688(TDB_[118], TDB[118]);
  buf B689(TDB_[119], TDB[119]);
  buf B690(TDB_[120], TDB[120]);
  buf B691(TDB_[121], TDB[121]);
  buf B692(TDB_[122], TDB[122]);
  buf B693(TDB_[123], TDB[123]);
  buf B694(RET1N_, RET1N);
  buf B695(STOVA_, STOVA);
  buf B696(STOVB_, STOVB);
  buf B697(COLLDISN_, COLLDISN);

  assign CENYA_ = RET1N_ ? (TENA_ ? CENA_ : TCENA_) : 1'bx;
  assign AYA_ = RET1N_ ? (TENA_ ? AA_ : TAA_) : {9{1'bx}};
  assign CENYB_ = RET1N_ ? (TENB_ ? CENB_ : TCENB_) : 1'bx;
  assign AYB_ = RET1N_ ? (TENB_ ? AB_ : TAB_) : {9{1'bx}};
  assign DYB_ = RET1N_ ? (TENB_ ? DB_ : TDB_) : {124{1'bx}};
   `ifdef ARM_FAULT_MODELING
     RF_2p_CRT_4x512_error_injection u1(.CLK(CLKA_), .Q_out(QA_), .A(AA_int), .CEN(CENA_int), .TQ(TQA_), .BEN(BENA_), .Q_in(QA_int));
  `else
  assign QA_ = RET1N_ ? (BENA_ ? ((STOVA_ ? (QA_int_delayed) : (QA_int))) : TQA_) : {124{1'bx}};
  `endif

// If INITIALIZE_MEMORY is defined at Simulator Command Line, it Initializes the Memory with all ZEROS.
`ifdef INITIALIZE_MEMORY
  integer i;
  initial
    for (i = 0; i < MEM_HEIGHT; i = i + 1)
      mem[i] = {MEM_WIDTH{1'b0}};
`endif

  task failedWrite;
  input port_f;
  integer i;
  begin
    for (i = 0; i < MEM_HEIGHT; i = i + 1)
      mem[i] = {MEM_WIDTH{1'bx}};
  end
  endtask

  function isBitX;
    input bitval;
    begin
      isBitX = ( bitval===1'bx || bitval==1'bz ) ? 1'b1 : 1'b0;
    end
  endfunction


task loadmem;
	input [1000*8-1:0] filename;
	reg [BITS-1:0] memld [0:WORDS-1];
	integer i;
	reg [BITS-1:0] wordtemp;
	reg [8:0] Atemp;
  begin
	$readmemb(filename, memld);
     if (CENA_ === 1'b1 && CENB_ === 1'b1) begin
	  for (i=0;i<WORDS;i=i+1) begin
	  wordtemp = memld[i];
	  Atemp = i;
	  mux_address = (Atemp & 1'b1);
      row_address = (Atemp >> 1);
      row = mem[row_address];
        writeEnable = {124{1'b1}};
        row_mask =  ( {1'b0, writeEnable[123], 1'b0, writeEnable[122], 1'b0, writeEnable[121],
          1'b0, writeEnable[120], 1'b0, writeEnable[119], 1'b0, writeEnable[118], 1'b0, writeEnable[117],
          1'b0, writeEnable[116], 1'b0, writeEnable[115], 1'b0, writeEnable[114], 1'b0, writeEnable[113],
          1'b0, writeEnable[112], 1'b0, writeEnable[111], 1'b0, writeEnable[110], 1'b0, writeEnable[109],
          1'b0, writeEnable[108], 1'b0, writeEnable[107], 1'b0, writeEnable[106], 1'b0, writeEnable[105],
          1'b0, writeEnable[104], 1'b0, writeEnable[103], 1'b0, writeEnable[102], 1'b0, writeEnable[101],
          1'b0, writeEnable[100], 1'b0, writeEnable[99], 1'b0, writeEnable[98], 1'b0, writeEnable[97],
          1'b0, writeEnable[96], 1'b0, writeEnable[95], 1'b0, writeEnable[94], 1'b0, writeEnable[93],
          1'b0, writeEnable[92], 1'b0, writeEnable[91], 1'b0, writeEnable[90], 1'b0, writeEnable[89],
          1'b0, writeEnable[88], 1'b0, writeEnable[87], 1'b0, writeEnable[86], 1'b0, writeEnable[85],
          1'b0, writeEnable[84], 1'b0, writeEnable[83], 1'b0, writeEnable[82], 1'b0, writeEnable[81],
          1'b0, writeEnable[80], 1'b0, writeEnable[79], 1'b0, writeEnable[78], 1'b0, writeEnable[77],
          1'b0, writeEnable[76], 1'b0, writeEnable[75], 1'b0, writeEnable[74], 1'b0, writeEnable[73],
          1'b0, writeEnable[72], 1'b0, writeEnable[71], 1'b0, writeEnable[70], 1'b0, writeEnable[69],
          1'b0, writeEnable[68], 1'b0, writeEnable[67], 1'b0, writeEnable[66], 1'b0, writeEnable[65],
          1'b0, writeEnable[64], 1'b0, writeEnable[63], 1'b0, writeEnable[62], 1'b0, writeEnable[61],
          1'b0, writeEnable[60], 1'b0, writeEnable[59], 1'b0, writeEnable[58], 1'b0, writeEnable[57],
          1'b0, writeEnable[56], 1'b0, writeEnable[55], 1'b0, writeEnable[54], 1'b0, writeEnable[53],
          1'b0, writeEnable[52], 1'b0, writeEnable[51], 1'b0, writeEnable[50], 1'b0, writeEnable[49],
          1'b0, writeEnable[48], 1'b0, writeEnable[47], 1'b0, writeEnable[46], 1'b0, writeEnable[45],
          1'b0, writeEnable[44], 1'b0, writeEnable[43], 1'b0, writeEnable[42], 1'b0, writeEnable[41],
          1'b0, writeEnable[40], 1'b0, writeEnable[39], 1'b0, writeEnable[38], 1'b0, writeEnable[37],
          1'b0, writeEnable[36], 1'b0, writeEnable[35], 1'b0, writeEnable[34], 1'b0, writeEnable[33],
          1'b0, writeEnable[32], 1'b0, writeEnable[31], 1'b0, writeEnable[30], 1'b0, writeEnable[29],
          1'b0, writeEnable[28], 1'b0, writeEnable[27], 1'b0, writeEnable[26], 1'b0, writeEnable[25],
          1'b0, writeEnable[24], 1'b0, writeEnable[23], 1'b0, writeEnable[22], 1'b0, writeEnable[21],
          1'b0, writeEnable[20], 1'b0, writeEnable[19], 1'b0, writeEnable[18], 1'b0, writeEnable[17],
          1'b0, writeEnable[16], 1'b0, writeEnable[15], 1'b0, writeEnable[14], 1'b0, writeEnable[13],
          1'b0, writeEnable[12], 1'b0, writeEnable[11], 1'b0, writeEnable[10], 1'b0, writeEnable[9],
          1'b0, writeEnable[8], 1'b0, writeEnable[7], 1'b0, writeEnable[6], 1'b0, writeEnable[5],
          1'b0, writeEnable[4], 1'b0, writeEnable[3], 1'b0, writeEnable[2], 1'b0, writeEnable[1],
          1'b0, writeEnable[0]} << mux_address);
        new_data =  ( {1'b0, wordtemp[123], 1'b0, wordtemp[122], 1'b0, wordtemp[121],
          1'b0, wordtemp[120], 1'b0, wordtemp[119], 1'b0, wordtemp[118], 1'b0, wordtemp[117],
          1'b0, wordtemp[116], 1'b0, wordtemp[115], 1'b0, wordtemp[114], 1'b0, wordtemp[113],
          1'b0, wordtemp[112], 1'b0, wordtemp[111], 1'b0, wordtemp[110], 1'b0, wordtemp[109],
          1'b0, wordtemp[108], 1'b0, wordtemp[107], 1'b0, wordtemp[106], 1'b0, wordtemp[105],
          1'b0, wordtemp[104], 1'b0, wordtemp[103], 1'b0, wordtemp[102], 1'b0, wordtemp[101],
          1'b0, wordtemp[100], 1'b0, wordtemp[99], 1'b0, wordtemp[98], 1'b0, wordtemp[97],
          1'b0, wordtemp[96], 1'b0, wordtemp[95], 1'b0, wordtemp[94], 1'b0, wordtemp[93],
          1'b0, wordtemp[92], 1'b0, wordtemp[91], 1'b0, wordtemp[90], 1'b0, wordtemp[89],
          1'b0, wordtemp[88], 1'b0, wordtemp[87], 1'b0, wordtemp[86], 1'b0, wordtemp[85],
          1'b0, wordtemp[84], 1'b0, wordtemp[83], 1'b0, wordtemp[82], 1'b0, wordtemp[81],
          1'b0, wordtemp[80], 1'b0, wordtemp[79], 1'b0, wordtemp[78], 1'b0, wordtemp[77],
          1'b0, wordtemp[76], 1'b0, wordtemp[75], 1'b0, wordtemp[74], 1'b0, wordtemp[73],
          1'b0, wordtemp[72], 1'b0, wordtemp[71], 1'b0, wordtemp[70], 1'b0, wordtemp[69],
          1'b0, wordtemp[68], 1'b0, wordtemp[67], 1'b0, wordtemp[66], 1'b0, wordtemp[65],
          1'b0, wordtemp[64], 1'b0, wordtemp[63], 1'b0, wordtemp[62], 1'b0, wordtemp[61],
          1'b0, wordtemp[60], 1'b0, wordtemp[59], 1'b0, wordtemp[58], 1'b0, wordtemp[57],
          1'b0, wordtemp[56], 1'b0, wordtemp[55], 1'b0, wordtemp[54], 1'b0, wordtemp[53],
          1'b0, wordtemp[52], 1'b0, wordtemp[51], 1'b0, wordtemp[50], 1'b0, wordtemp[49],
          1'b0, wordtemp[48], 1'b0, wordtemp[47], 1'b0, wordtemp[46], 1'b0, wordtemp[45],
          1'b0, wordtemp[44], 1'b0, wordtemp[43], 1'b0, wordtemp[42], 1'b0, wordtemp[41],
          1'b0, wordtemp[40], 1'b0, wordtemp[39], 1'b0, wordtemp[38], 1'b0, wordtemp[37],
          1'b0, wordtemp[36], 1'b0, wordtemp[35], 1'b0, wordtemp[34], 1'b0, wordtemp[33],
          1'b0, wordtemp[32], 1'b0, wordtemp[31], 1'b0, wordtemp[30], 1'b0, wordtemp[29],
          1'b0, wordtemp[28], 1'b0, wordtemp[27], 1'b0, wordtemp[26], 1'b0, wordtemp[25],
          1'b0, wordtemp[24], 1'b0, wordtemp[23], 1'b0, wordtemp[22], 1'b0, wordtemp[21],
          1'b0, wordtemp[20], 1'b0, wordtemp[19], 1'b0, wordtemp[18], 1'b0, wordtemp[17],
          1'b0, wordtemp[16], 1'b0, wordtemp[15], 1'b0, wordtemp[14], 1'b0, wordtemp[13],
          1'b0, wordtemp[12], 1'b0, wordtemp[11], 1'b0, wordtemp[10], 1'b0, wordtemp[9],
          1'b0, wordtemp[8], 1'b0, wordtemp[7], 1'b0, wordtemp[6], 1'b0, wordtemp[5],
          1'b0, wordtemp[4], 1'b0, wordtemp[3], 1'b0, wordtemp[2], 1'b0, wordtemp[1],
          1'b0, wordtemp[0]} << mux_address);
      row = (row & ~row_mask) | (row_mask & (~row_mask | new_data));
      mem[row_address] = row;
  	end
  end
  end
  endtask

task dumpmem;
	input [1000*8-1:0] filename_dump;
	integer i, dump_file_desc;
	reg [BITS-1:0] wordtemp;
	reg [8:0] Atemp;
  begin
	dump_file_desc = $fopen(filename_dump);
     if (CENA_ === 1'b1 && CENB_ === 1'b1) begin
	  for (i=0;i<WORDS;i=i+1) begin
	  Atemp = i;
	  mux_address = (Atemp & 1'b1);
      row_address = (Atemp >> 1);
      row = mem[row_address];
        writeEnable = {124{1'b1}};
      data_out = (row >> mux_address);
      QA_int = {data_out[246], data_out[244], data_out[242], data_out[240], data_out[238],
        data_out[236], data_out[234], data_out[232], data_out[230], data_out[228],
        data_out[226], data_out[224], data_out[222], data_out[220], data_out[218],
        data_out[216], data_out[214], data_out[212], data_out[210], data_out[208],
        data_out[206], data_out[204], data_out[202], data_out[200], data_out[198],
        data_out[196], data_out[194], data_out[192], data_out[190], data_out[188],
        data_out[186], data_out[184], data_out[182], data_out[180], data_out[178],
        data_out[176], data_out[174], data_out[172], data_out[170], data_out[168],
        data_out[166], data_out[164], data_out[162], data_out[160], data_out[158],
        data_out[156], data_out[154], data_out[152], data_out[150], data_out[148],
        data_out[146], data_out[144], data_out[142], data_out[140], data_out[138],
        data_out[136], data_out[134], data_out[132], data_out[130], data_out[128],
        data_out[126], data_out[124], data_out[122], data_out[120], data_out[118],
        data_out[116], data_out[114], data_out[112], data_out[110], data_out[108],
        data_out[106], data_out[104], data_out[102], data_out[100], data_out[98], data_out[96],
        data_out[94], data_out[92], data_out[90], data_out[88], data_out[86], data_out[84],
        data_out[82], data_out[80], data_out[78], data_out[76], data_out[74], data_out[72],
        data_out[70], data_out[68], data_out[66], data_out[64], data_out[62], data_out[60],
        data_out[58], data_out[56], data_out[54], data_out[52], data_out[50], data_out[48],
        data_out[46], data_out[44], data_out[42], data_out[40], data_out[38], data_out[36],
        data_out[34], data_out[32], data_out[30], data_out[28], data_out[26], data_out[24],
        data_out[22], data_out[20], data_out[18], data_out[16], data_out[14], data_out[12],
        data_out[10], data_out[8], data_out[6], data_out[4], data_out[2], data_out[0]};
   	$fdisplay(dump_file_desc, "%b", QA_int);
  end
  	end
//    $fclose(filename_dump);
  end
  endtask


  task ReadA;
  begin
    if (RET1N_int === 1'bx || RET1N_int === 1'bz) begin
      failedWrite(0);
      QA_int = {124{1'bx}};
    end else if (RET1N_int === 1'b0 && CENA_int === 1'b0) begin
      failedWrite(0);
      QA_int = {124{1'bx}};
    end else if (RET1N_int === 1'b0) begin
      // no cycle in retention mode
    end else if (^{CENA_int, EMAA_int, EMASA_int, RET1N_int, (STOVA_int && !CENA_int)} 
     === 1'bx) begin
      QA_int = {124{1'bx}};
    end else if ((AA_int >= WORDS) && (CENA_int === 1'b0)) begin
      QA_int = 0 ? QA_int : {124{1'bx}};
    end else if (CENA_int === 1'b0 && (^AA_int) === 1'bx) begin
      failedWrite(0);
      QA_int = {124{1'bx}};
    end else if (CENA_int === 1'b0) begin
      mux_address = (AA_int & 1'b1);
      row_address = (AA_int >> 1);
      if (row_address > 255)
        row = {248{1'bx}};
      else
        row = mem[row_address];
      data_out = (row >> mux_address);
      QA_int = {data_out[246], data_out[244], data_out[242], data_out[240], data_out[238],
        data_out[236], data_out[234], data_out[232], data_out[230], data_out[228],
        data_out[226], data_out[224], data_out[222], data_out[220], data_out[218],
        data_out[216], data_out[214], data_out[212], data_out[210], data_out[208],
        data_out[206], data_out[204], data_out[202], data_out[200], data_out[198],
        data_out[196], data_out[194], data_out[192], data_out[190], data_out[188],
        data_out[186], data_out[184], data_out[182], data_out[180], data_out[178],
        data_out[176], data_out[174], data_out[172], data_out[170], data_out[168],
        data_out[166], data_out[164], data_out[162], data_out[160], data_out[158],
        data_out[156], data_out[154], data_out[152], data_out[150], data_out[148],
        data_out[146], data_out[144], data_out[142], data_out[140], data_out[138],
        data_out[136], data_out[134], data_out[132], data_out[130], data_out[128],
        data_out[126], data_out[124], data_out[122], data_out[120], data_out[118],
        data_out[116], data_out[114], data_out[112], data_out[110], data_out[108],
        data_out[106], data_out[104], data_out[102], data_out[100], data_out[98], data_out[96],
        data_out[94], data_out[92], data_out[90], data_out[88], data_out[86], data_out[84],
        data_out[82], data_out[80], data_out[78], data_out[76], data_out[74], data_out[72],
        data_out[70], data_out[68], data_out[66], data_out[64], data_out[62], data_out[60],
        data_out[58], data_out[56], data_out[54], data_out[52], data_out[50], data_out[48],
        data_out[46], data_out[44], data_out[42], data_out[40], data_out[38], data_out[36],
        data_out[34], data_out[32], data_out[30], data_out[28], data_out[26], data_out[24],
        data_out[22], data_out[20], data_out[18], data_out[16], data_out[14], data_out[12],
        data_out[10], data_out[8], data_out[6], data_out[4], data_out[2], data_out[0]};
    end
  end
  endtask

  task WriteB;
  begin
    if (RET1N_int === 1'bx || RET1N_int === 1'bz) begin
      failedWrite(1);
      QA_int = {124{1'bx}};
    end else if (RET1N_int === 1'b0 && CENB_int === 1'b0) begin
      failedWrite(1);
      QA_int = {124{1'bx}};
    end else if (RET1N_int === 1'b0) begin
      // no cycle in retention mode
    end else if (^{CENB_int, EMAB_int, EMAWB_int, RET1N_int, (STOVB_int && !CENB_int)} 
     === 1'bx) begin
      failedWrite(1);
    end else if ((AB_int >= WORDS) && (CENB_int === 1'b0)) begin
    end else if (CENB_int === 1'b0 && (^AB_int) === 1'bx) begin
      failedWrite(1);
    end else if (CENB_int === 1'b0) begin
      mux_address = (AB_int & 1'b1);
      row_address = (AB_int >> 1);
      if (row_address > 255)
        row = {248{1'bx}};
      else
        row = mem[row_address];
      writeEnable = ~{124{CENB_int}};
      row_mask =  ( {1'b0, writeEnable[123], 1'b0, writeEnable[122], 1'b0, writeEnable[121],
        1'b0, writeEnable[120], 1'b0, writeEnable[119], 1'b0, writeEnable[118], 1'b0, writeEnable[117],
        1'b0, writeEnable[116], 1'b0, writeEnable[115], 1'b0, writeEnable[114], 1'b0, writeEnable[113],
        1'b0, writeEnable[112], 1'b0, writeEnable[111], 1'b0, writeEnable[110], 1'b0, writeEnable[109],
        1'b0, writeEnable[108], 1'b0, writeEnable[107], 1'b0, writeEnable[106], 1'b0, writeEnable[105],
        1'b0, writeEnable[104], 1'b0, writeEnable[103], 1'b0, writeEnable[102], 1'b0, writeEnable[101],
        1'b0, writeEnable[100], 1'b0, writeEnable[99], 1'b0, writeEnable[98], 1'b0, writeEnable[97],
        1'b0, writeEnable[96], 1'b0, writeEnable[95], 1'b0, writeEnable[94], 1'b0, writeEnable[93],
        1'b0, writeEnable[92], 1'b0, writeEnable[91], 1'b0, writeEnable[90], 1'b0, writeEnable[89],
        1'b0, writeEnable[88], 1'b0, writeEnable[87], 1'b0, writeEnable[86], 1'b0, writeEnable[85],
        1'b0, writeEnable[84], 1'b0, writeEnable[83], 1'b0, writeEnable[82], 1'b0, writeEnable[81],
        1'b0, writeEnable[80], 1'b0, writeEnable[79], 1'b0, writeEnable[78], 1'b0, writeEnable[77],
        1'b0, writeEnable[76], 1'b0, writeEnable[75], 1'b0, writeEnable[74], 1'b0, writeEnable[73],
        1'b0, writeEnable[72], 1'b0, writeEnable[71], 1'b0, writeEnable[70], 1'b0, writeEnable[69],
        1'b0, writeEnable[68], 1'b0, writeEnable[67], 1'b0, writeEnable[66], 1'b0, writeEnable[65],
        1'b0, writeEnable[64], 1'b0, writeEnable[63], 1'b0, writeEnable[62], 1'b0, writeEnable[61],
        1'b0, writeEnable[60], 1'b0, writeEnable[59], 1'b0, writeEnable[58], 1'b0, writeEnable[57],
        1'b0, writeEnable[56], 1'b0, writeEnable[55], 1'b0, writeEnable[54], 1'b0, writeEnable[53],
        1'b0, writeEnable[52], 1'b0, writeEnable[51], 1'b0, writeEnable[50], 1'b0, writeEnable[49],
        1'b0, writeEnable[48], 1'b0, writeEnable[47], 1'b0, writeEnable[46], 1'b0, writeEnable[45],
        1'b0, writeEnable[44], 1'b0, writeEnable[43], 1'b0, writeEnable[42], 1'b0, writeEnable[41],
        1'b0, writeEnable[40], 1'b0, writeEnable[39], 1'b0, writeEnable[38], 1'b0, writeEnable[37],
        1'b0, writeEnable[36], 1'b0, writeEnable[35], 1'b0, writeEnable[34], 1'b0, writeEnable[33],
        1'b0, writeEnable[32], 1'b0, writeEnable[31], 1'b0, writeEnable[30], 1'b0, writeEnable[29],
        1'b0, writeEnable[28], 1'b0, writeEnable[27], 1'b0, writeEnable[26], 1'b0, writeEnable[25],
        1'b0, writeEnable[24], 1'b0, writeEnable[23], 1'b0, writeEnable[22], 1'b0, writeEnable[21],
        1'b0, writeEnable[20], 1'b0, writeEnable[19], 1'b0, writeEnable[18], 1'b0, writeEnable[17],
        1'b0, writeEnable[16], 1'b0, writeEnable[15], 1'b0, writeEnable[14], 1'b0, writeEnable[13],
        1'b0, writeEnable[12], 1'b0, writeEnable[11], 1'b0, writeEnable[10], 1'b0, writeEnable[9],
        1'b0, writeEnable[8], 1'b0, writeEnable[7], 1'b0, writeEnable[6], 1'b0, writeEnable[5],
        1'b0, writeEnable[4], 1'b0, writeEnable[3], 1'b0, writeEnable[2], 1'b0, writeEnable[1],
        1'b0, writeEnable[0]} << mux_address);
      new_data =  ( {1'b0, DB_int[123], 1'b0, DB_int[122], 1'b0, DB_int[121], 1'b0, DB_int[120],
        1'b0, DB_int[119], 1'b0, DB_int[118], 1'b0, DB_int[117], 1'b0, DB_int[116],
        1'b0, DB_int[115], 1'b0, DB_int[114], 1'b0, DB_int[113], 1'b0, DB_int[112],
        1'b0, DB_int[111], 1'b0, DB_int[110], 1'b0, DB_int[109], 1'b0, DB_int[108],
        1'b0, DB_int[107], 1'b0, DB_int[106], 1'b0, DB_int[105], 1'b0, DB_int[104],
        1'b0, DB_int[103], 1'b0, DB_int[102], 1'b0, DB_int[101], 1'b0, DB_int[100],
        1'b0, DB_int[99], 1'b0, DB_int[98], 1'b0, DB_int[97], 1'b0, DB_int[96], 1'b0, DB_int[95],
        1'b0, DB_int[94], 1'b0, DB_int[93], 1'b0, DB_int[92], 1'b0, DB_int[91], 1'b0, DB_int[90],
        1'b0, DB_int[89], 1'b0, DB_int[88], 1'b0, DB_int[87], 1'b0, DB_int[86], 1'b0, DB_int[85],
        1'b0, DB_int[84], 1'b0, DB_int[83], 1'b0, DB_int[82], 1'b0, DB_int[81], 1'b0, DB_int[80],
        1'b0, DB_int[79], 1'b0, DB_int[78], 1'b0, DB_int[77], 1'b0, DB_int[76], 1'b0, DB_int[75],
        1'b0, DB_int[74], 1'b0, DB_int[73], 1'b0, DB_int[72], 1'b0, DB_int[71], 1'b0, DB_int[70],
        1'b0, DB_int[69], 1'b0, DB_int[68], 1'b0, DB_int[67], 1'b0, DB_int[66], 1'b0, DB_int[65],
        1'b0, DB_int[64], 1'b0, DB_int[63], 1'b0, DB_int[62], 1'b0, DB_int[61], 1'b0, DB_int[60],
        1'b0, DB_int[59], 1'b0, DB_int[58], 1'b0, DB_int[57], 1'b0, DB_int[56], 1'b0, DB_int[55],
        1'b0, DB_int[54], 1'b0, DB_int[53], 1'b0, DB_int[52], 1'b0, DB_int[51], 1'b0, DB_int[50],
        1'b0, DB_int[49], 1'b0, DB_int[48], 1'b0, DB_int[47], 1'b0, DB_int[46], 1'b0, DB_int[45],
        1'b0, DB_int[44], 1'b0, DB_int[43], 1'b0, DB_int[42], 1'b0, DB_int[41], 1'b0, DB_int[40],
        1'b0, DB_int[39], 1'b0, DB_int[38], 1'b0, DB_int[37], 1'b0, DB_int[36], 1'b0, DB_int[35],
        1'b0, DB_int[34], 1'b0, DB_int[33], 1'b0, DB_int[32], 1'b0, DB_int[31], 1'b0, DB_int[30],
        1'b0, DB_int[29], 1'b0, DB_int[28], 1'b0, DB_int[27], 1'b0, DB_int[26], 1'b0, DB_int[25],
        1'b0, DB_int[24], 1'b0, DB_int[23], 1'b0, DB_int[22], 1'b0, DB_int[21], 1'b0, DB_int[20],
        1'b0, DB_int[19], 1'b0, DB_int[18], 1'b0, DB_int[17], 1'b0, DB_int[16], 1'b0, DB_int[15],
        1'b0, DB_int[14], 1'b0, DB_int[13], 1'b0, DB_int[12], 1'b0, DB_int[11], 1'b0, DB_int[10],
        1'b0, DB_int[9], 1'b0, DB_int[8], 1'b0, DB_int[7], 1'b0, DB_int[6], 1'b0, DB_int[5],
        1'b0, DB_int[4], 1'b0, DB_int[3], 1'b0, DB_int[2], 1'b0, DB_int[1], 1'b0, DB_int[0]} << mux_address);
      row = (row & ~row_mask) | (row_mask & (~row_mask | new_data));
      mem[row_address] = row;
    end
  end
  endtask
  always @ (CENA_ or TCENA_ or TENA_ or CLKA_) begin
  	if(CLKA_ == 1'b0) begin
  		CENA_p2 = CENA_;
  		TCENA_p2 = TCENA_;
  	end
  end

  always @ RET1N_ begin
    if (CLKA_ == 1'b1) begin
      failedWrite(0);
      QA_int = {124{1'bx}};
    end
    if (RET1N_ === 1'bx || RET1N_ === 1'bz) begin
      failedWrite(0);
      QA_int = {124{1'bx}};
    end else if (RET1N_ === 1'b0 && RET1N_int === 1'b1 && (CENA_p2 === 1'b0 || TCENA_p2 === 1'b0) ) begin
      failedWrite(0);
      QA_int = {124{1'bx}};
    end else if (RET1N_ === 1'b1 && RET1N_int === 1'b0 && (CENA_p2 === 1'b0 || TCENA_p2 === 1'b0) ) begin
      failedWrite(0);
      QA_int = {124{1'bx}};
    end
    if (RET1N_ == 1'b0) begin
      QA_int = {124{1'bx}};
      QA_int_delayed = {124{1'bx}};
      CENA_int = 1'bx;
      AA_int = {9{1'bx}};
      EMAA_int = {3{1'bx}};
      EMASA_int = 1'bx;
      TENA_int = 1'bx;
      BENA_int = 1'bx;
      TCENA_int = 1'bx;
      TAA_int = {9{1'bx}};
      TQA_int = {124{1'bx}};
      RET1N_int = 1'bx;
      STOVA_int = 1'bx;
      COLLDISN_int = 1'bx;
    end else begin
      QA_int = {124{1'bx}};
      QA_int_delayed = {124{1'bx}};
      CENA_int = 1'bx;
      AA_int = {9{1'bx}};
      EMAA_int = {3{1'bx}};
      EMASA_int = 1'bx;
      TENA_int = 1'bx;
      BENA_int = 1'bx;
      TCENA_int = 1'bx;
      TAA_int = {9{1'bx}};
      TQA_int = {124{1'bx}};
      RET1N_int = 1'bx;
      STOVA_int = 1'bx;
      COLLDISN_int = 1'bx;
    end
    RET1N_int = RET1N_;
  end


  always @ CLKA_ begin
// If POWER_PINS is defined at Simulator Command Line, it selects the module definition with Power Ports
`ifdef POWER_PINS
    if (VDDCE === 1'bx || VDDCE === 1'bz)
      $display("ERROR: Illegal value for VDDCE %b", VDDCE);
    if (VDDPE === 1'bx || VDDPE === 1'bz)
      $display("ERROR: Illegal value for VDDPE %b", VDDPE);
    if (VSSE === 1'bx || VSSE === 1'bz)
      $display("ERROR: Illegal value for VSSE %b", VSSE);
`endif
  if (RET1N_ == 1'b0) begin
      // no cycle in retention mode
  end else begin
    if ((CLKA_ === 1'bx || CLKA_ === 1'bz) && RET1N_ !== 1'b0) begin
      failedWrite(0);
      QA_int = {124{1'bx}};
    end else if (CLKA_ === 1'b1 && LAST_CLKA === 1'b0) begin
      CENA_int = TENA_ ? CENA_ : TCENA_;
      EMAA_int = EMAA_;
      EMASA_int = EMASA_;
      TENA_int = TENA_;
      BENA_int = BENA_;
      TQA_int = TQA_;
      RET1N_int = RET1N_;
      STOVA_int = STOVA_;
      COLLDISN_int = COLLDISN_;
      if (CENA_int != 1'b1) begin
        AA_int = TENA_ ? AA_ : TAA_;
        TCENA_int = TCENA_;
        TAA_int = TAA_;
      end
      clk0_int = 1'b0;
    ReadA;
      if (CENA_int === 1'b0) previous_CLKA = $realtime;
    #0;
      if (((previous_CLKA == previous_CLKB) || ((STOVA_int==1'b1 || STOVB_int==1'b1) 
       && CLKA_ == 1'b1 && CLKB_ == 1'b1)) && (CENA_int !== 1'b1 && CENB_int !== 1'b1) 
       && COLLDISN_int === 1'b1 && is_contention(AA_int, AB_int, 1'b1, 1'b0)) begin
          $display("%s contention: write B succeeds, read A fails in %m at %0t",ASSERT_PREFIX, $time);
          ROW_CC = 1;
          COL_CC = 1;
        QA_int = {124{1'bx}};
      end else if (((previous_CLKA == previous_CLKB) || ((STOVA_int==1'b1 || STOVB_int==1'b1) 
       && CLKA_ == 1'b1 && CLKB_ == 1'b1)) && (CENA_int !== 1'b1 && CENB_int !== 1'b1) 
       && COLLDISN_int === 1'b1 && row_contention(AA_int, AB_int, 1'b1, 1'b0)) begin
         //  $display("%s row contention: in %m at %0t",ASSERT_PREFIX, $time);
          ROW_CC = 1;
         //  $display("%s contention: write B succeeds, read A succeeds in %m at %0t",ASSERT_PREFIX, $time);
          READ_WRITE = 1;
      end else if (((previous_CLKA == previous_CLKB) || ((STOVA_int==1'b1 || STOVB_int==1'b1) 
       && CLKA_ == 1'b1 && CLKB_ == 1'b1)) && (CENA_int !== 1'b1 && CENB_int !== 1'b1) 
       && (COLLDISN_int === 1'b0 || COLLDISN_int === 1'bx) && row_contention(AA_int,
        AB_int, 1'b1, 1'b0)) begin
          $display("%s row contention: in %m at %0t",ASSERT_PREFIX, $time);
          ROW_CC = 1;
          $display("%s contention: write B fails in %m at %0t",ASSERT_PREFIX, $time);
          READ_WRITE = 1;
        DB_int = {124{1'bx}};
        WriteB;
        if (col_contention(AA_int,AB_int)) begin
          $display("%s contention: read A fails in %m at %0t",ASSERT_PREFIX, $time);
          COL_CC = 1;
          READ_WRITE = 1;
        QA_int = {124{1'bx}};
      end else begin
          $display("%s contention: read A succeeds in %m at %0t",ASSERT_PREFIX, $time);
          READ_WRITE = 1;
      end
      end
    end else if (CLKA_ === 1'b0 && LAST_CLKA === 1'b1) begin
      QA_int_delayed = QA_int;
    end
    LAST_CLKA = CLKA_;
  end
  end

  reg globalNotifier0;
  initial globalNotifier0 = 1'b0;
  initial cont_flag0_int = 1'b0;

  always @ globalNotifier0 begin
    if ($realtime == 0) begin
    end else if (CENA_int === 1'bx || EMAA_int[0] === 1'bx || EMAA_int[1] === 1'bx || 
      EMAA_int[2] === 1'bx || EMASA_int === 1'bx || RET1N_int === 1'bx || (STOVA_int && !CENA_int) === 1'bx || 
      TENA_int === 1'bx || clk0_int === 1'bx) begin
      QA_int = {124{1'bx}};
    end else if  (cont_flag0_int === 1'bx && COLLDISN_int === 1'b1 &&  (CENA_int !== 
     1'b1 && CENB_int !== 1'b1) && is_contention(AA_int, AB_int, 1'b1, 1'b0)) begin
      cont_flag0_int = 1'b0;
          $display("%s contention: write B succeeds, read A fails in %m at %0t",ASSERT_PREFIX, $time);
          ROW_CC = 1;
          COL_CC = 1;
        QA_int = {124{1'bx}};
    end else if  ((CENA_int !== 1'b1 && CENB_int !== 1'b1) && cont_flag0_int === 1'bx 
     && (COLLDISN_int === 1'b0 || COLLDISN_int === 1'bx) && row_contention(AA_int,
      AB_int,1'b1, 1'b0)) begin
      cont_flag0_int = 1'b0;
          $display("%s row contention: in %m at %0t",ASSERT_PREFIX, $time);
          ROW_CC = 1;
          $display("%s contention: write B fails in %m at %0t",ASSERT_PREFIX, $time);
          READ_WRITE = 1;
        DB_int = {124{1'bx}};
        WriteB;
        if (col_contention(AA_int,AB_int)) begin
          $display("%s contention: read A fails in %m at %0t",ASSERT_PREFIX, $time);
          COL_CC = 1;
          READ_WRITE = 1;
        QA_int = {124{1'bx}};
      end else begin
          $display("%s contention: read A succeeds in %m at %0t",ASSERT_PREFIX, $time);
          READ_WRITE = 1;
      end
    end else begin
      ReadA;
   end
    globalNotifier0 = 1'b0;
  end
  always @ (CENB_ or TCENB_ or TENB_ or CLKB_) begin
  	if(CLKB_ == 1'b0) begin
  		CENB_p2 = CENB_;
  		TCENB_p2 = TCENB_;
  	end
  end

  always @ RET1N_ begin
    if (CLKB_ == 1'b1) begin
      failedWrite(1);
      QA_int = {124{1'bx}};
    end
    if (RET1N_ === 1'bx || RET1N_ === 1'bz) begin
      failedWrite(1);
      QA_int = {124{1'bx}};
    end else if (RET1N_ === 1'b0 && RET1N_int === 1'b1 && (CENB_p2 === 1'b0 || TCENB_p2 === 1'b0) ) begin
      failedWrite(1);
      QA_int = {124{1'bx}};
    end else if (RET1N_ === 1'b1 && RET1N_int === 1'b0 && (CENB_p2 === 1'b0 || TCENB_p2 === 1'b0) ) begin
      failedWrite(1);
      QA_int = {124{1'bx}};
    end
    if (RET1N_ == 1'b0) begin
      CENB_int = 1'bx;
      AB_int = {9{1'bx}};
      DB_int = {124{1'bx}};
      EMAB_int = {3{1'bx}};
      EMAWB_int = {2{1'bx}};
      TENB_int = 1'bx;
      TCENB_int = 1'bx;
      TAB_int = {9{1'bx}};
      TDB_int = {124{1'bx}};
      RET1N_int = 1'bx;
      STOVB_int = 1'bx;
      COLLDISN_int = 1'bx;
    end else begin
      CENB_int = 1'bx;
      AB_int = {9{1'bx}};
      DB_int = {124{1'bx}};
      EMAB_int = {3{1'bx}};
      EMAWB_int = {2{1'bx}};
      TENB_int = 1'bx;
      TCENB_int = 1'bx;
      TAB_int = {9{1'bx}};
      TDB_int = {124{1'bx}};
      RET1N_int = 1'bx;
      STOVB_int = 1'bx;
      COLLDISN_int = 1'bx;
    end
    RET1N_int = RET1N_;
  end

  always @ CLKB_ begin
  if (RET1N_ == 1'b0) begin
      // no cycle in retention mode
  end else begin
    if ((CLKB_ === 1'bx || CLKB_ === 1'bz) && RET1N_ !== 1'b0) begin
      QA_int = {124{1'bx}};
    end else if (CLKB_ === 1'b1 && LAST_CLKB === 1'b0) begin
      CENB_int = TENB_ ? CENB_ : TCENB_;
      EMAB_int = EMAB_;
      EMAWB_int = EMAWB_;
      TENB_int = TENB_;
      RET1N_int = RET1N_;
      STOVB_int = STOVB_;
      COLLDISN_int = COLLDISN_;
      if (CENB_int != 1'b1) begin
        AB_int = TENB_ ? AB_ : TAB_;
        DB_int = TENB_ ? DB_ : TDB_;
        TCENB_int = TCENB_;
        TAB_int = TAB_;
        TDB_int = TDB_;
      end
      clk1_int = 1'b0;
    WriteB;
      if (CENB_int === 1'b0) previous_CLKB = $realtime;
    #0;
      if (((previous_CLKA == previous_CLKB) || ((STOVA_int==1'b1 || STOVB_int==1'b1) 
       && CLKA_ == 1'b1 && CLKB_ == 1'b1)) && COLLDISN_int === 1'b1 && (CENA_int !== 
       1'b1 && CENB_int !== 1'b1) && is_contention(AA_int, AB_int, 1'b1, 1'b0)) begin
          $display("%s contention: write B succeeds, read A fails in %m at %0t",ASSERT_PREFIX, $time);
          ROW_CC = 1;
          COL_CC = 1;
        QA_int = {124{1'bx}};
      end else if (((previous_CLKA == previous_CLKB) || ((STOVA_int==1'b1 || STOVB_int==1'b1) 
       && CLKA_ == 1'b1 && CLKB_ == 1'b1)) && COLLDISN_int === 1'b1 && (CENA_int !== 
       1'b1 && CENB_int !== 1'b1) && row_contention(AA_int, AB_int, 1'b1, 1'b0)) begin
         //  $display("%s row contention: in %m at %0t",ASSERT_PREFIX, $time);
          ROW_CC = 1;
         //  $display("%s contention: write B succeeds, read A succeeds in %m at %0t",ASSERT_PREFIX, $time);
          READ_WRITE = 1;
      end else if (((previous_CLKA == previous_CLKB) || ((STOVA_int==1'b1 || STOVB_int==1'b1) 
       && CLKA_ == 1'b1 && CLKB_ == 1'b1)) && (CENA_int !== 1'b1 && CENB_int !== 1'b1) 
       && (COLLDISN_int === 1'b0 || COLLDISN_int === 1'bx) && row_contention(AA_int,
        AB_int,1'b1, 1'b0)) begin
          $display("%s row contention: in %m at %0t",ASSERT_PREFIX, $time);
          ROW_CC = 1;
          $display("%s contention: write B fails in %m at %0t",ASSERT_PREFIX, $time);
          READ_WRITE = 1;
        DB_int = {124{1'bx}};
        WriteB;
        if (col_contention(AA_int,AB_int)) begin
          $display("%s contention: read A fails in %m at %0t",ASSERT_PREFIX, $time);
          COL_CC = 1;
          READ_WRITE = 1;
        QA_int = {124{1'bx}};
      end else begin
          $display("%s contention: read A succeeds in %m at %0t",ASSERT_PREFIX, $time);
          READ_WRITE = 1;
      end
      end
    end
    LAST_CLKB = CLKB_;
  end
  end

  reg globalNotifier1;
  initial globalNotifier1 = 1'b0;
  initial cont_flag1_int = 1'b0;

  always @ globalNotifier1 begin
    if ($realtime == 0) begin
    end else if (CENB_int === 1'bx || EMAB_int[0] === 1'bx || EMAB_int[1] === 1'bx || 
      EMAB_int[2] === 1'bx || EMAWB_int[0] === 1'bx || EMAWB_int[1] === 1'bx || RET1N_int === 1'bx || 
      (STOVB_int && !CENB_int) === 1'bx || TENB_int === 1'bx || clk1_int === 1'bx) begin
      failedWrite(1);
    end else if  (cont_flag1_int === 1'bx && COLLDISN_int === 1'b1 &&  (CENA_int !== 
     1'b1 && CENB_int !== 1'b1) && is_contention(AA_int, AB_int, 1'b1, 1'b0)) begin
      cont_flag1_int = 1'b0;
          $display("%s contention: write B succeeds, read A fails in %m at %0t",ASSERT_PREFIX, $time);
          ROW_CC = 1;
          COL_CC = 1;
        QA_int = {124{1'bx}};
    end else if  ((CENA_int !== 1'b1 && CENB_int !== 1'b1) && cont_flag1_int === 1'bx 
     && (COLLDISN_int === 1'b0 || COLLDISN_int === 1'bx) && row_contention(AA_int,
      AB_int,1'b1, 1'b0)) begin
      cont_flag1_int = 1'b0;
          $display("%s row contention: in %m at %0t",ASSERT_PREFIX, $time);
          ROW_CC = 1;
          $display("%s contention: write B fails in %m at %0t",ASSERT_PREFIX, $time);
          READ_WRITE = 1;
        DB_int = {124{1'bx}};
        WriteB;
        if (col_contention(AA_int,AB_int)) begin
          $display("%s contention: read A fails in %m at %0t",ASSERT_PREFIX, $time);
          COL_CC = 1;
          READ_WRITE = 1;
        QA_int = {124{1'bx}};
      end else begin
          $display("%s contention: read A succeeds in %m at %0t",ASSERT_PREFIX, $time);
          READ_WRITE = 1;
      end
    end else begin
      WriteB;
   end
    globalNotifier1 = 1'b0;
  end

  function row_contention;
    input [8:0] aa;
    input [8:0] ab;
    input  wena;
    input  wenb;
    reg result;
    reg sameRow;
    reg sameMux;
    reg anyWrite;
  begin
    anyWrite = ((& wena) === 1'b1 && (& wenb) === 1'b1) ? 1'b0 : 1'b1;
    sameMux = (aa[0:0] == ab[0:0]) ? 1'b1 : 1'b0;
    if (aa[8:1] == ab[8:1]) begin
      sameRow = 1'b1;
    end else begin
      sameRow = 1'b0;
    end
    if (sameRow == 1'b1 && anyWrite == 1'b1)
      row_contention = 1'b1;
    else if (sameRow == 1'b1 && sameMux == 1'b1)
      row_contention = 1'b1;
    else
      row_contention = 1'b0;
  end
  endfunction

  function col_contention;
    input [8:0] aa;
    input [8:0] ab;
  begin
    if (aa[0:0] == ab[0:0])
      col_contention = 1'b1;
    else
      col_contention = 1'b0;
  end
  endfunction

  function is_contention;
    input [8:0] aa;
    input [8:0] ab;
    input  wena;
    input  wenb;
    reg result;
  begin
    if ((& wena) === 1'b1 && (& wenb) === 1'b1) begin
      result = 1'b0;
    end else if (aa == ab) begin
      result = 1'b1;
    end else begin
      result = 1'b0;
    end
    is_contention = result;
  end
  endfunction

   wire contA_flag = (CENA_int !== 1'b1 && ((TENB_ ? CENB_ : TCENB_) !== 1'b1)) && ((COLLDISN_int === 1'b1 && is_contention(TENB_ ? AB_ : TAB_, AA_int,  1'b0, 1'b1)) ||
              ((COLLDISN_int === 1'b0 || COLLDISN_int === 1'bx) && row_contention(TENB_ ? AB_ : TAB_, AA_int,  1'b0, 1'b1)));
   wire contB_flag = (CENB_int !== 1'b1 && ((TENA_ ? CENA_ : TCENA_) !== 1'b1)) && ((COLLDISN_int === 1'b1 && is_contention(TENA_ ? AA_ : TAA_, AB_int,  1'b1, 1'b0)) ||
              ((COLLDISN_int === 1'b0 || COLLDISN_int === 1'bx) && row_contention(TENA_ ? AA_ : TAA_, AB_int,  1'b1, 1'b0)));

  always @ NOT_CENA begin
    CENA_int = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_AA8 begin
    AA_int[8] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_AA7 begin
    AA_int[7] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_AA6 begin
    AA_int[6] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_AA5 begin
    AA_int[5] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_AA4 begin
    AA_int[4] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_AA3 begin
    AA_int[3] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_AA2 begin
    AA_int[2] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_AA1 begin
    AA_int[1] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_AA0 begin
    AA_int[0] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_CENB begin
    CENB_int = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_AB8 begin
    AB_int[8] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_AB7 begin
    AB_int[7] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_AB6 begin
    AB_int[6] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_AB5 begin
    AB_int[5] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_AB4 begin
    AB_int[4] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_AB3 begin
    AB_int[3] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_AB2 begin
    AB_int[2] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_AB1 begin
    AB_int[1] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_AB0 begin
    AB_int[0] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_DB123 begin
    DB_int[123] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_DB122 begin
    DB_int[122] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_DB121 begin
    DB_int[121] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_DB120 begin
    DB_int[120] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_DB119 begin
    DB_int[119] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_DB118 begin
    DB_int[118] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_DB117 begin
    DB_int[117] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_DB116 begin
    DB_int[116] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_DB115 begin
    DB_int[115] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_DB114 begin
    DB_int[114] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_DB113 begin
    DB_int[113] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_DB112 begin
    DB_int[112] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_DB111 begin
    DB_int[111] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_DB110 begin
    DB_int[110] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_DB109 begin
    DB_int[109] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_DB108 begin
    DB_int[108] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_DB107 begin
    DB_int[107] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_DB106 begin
    DB_int[106] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_DB105 begin
    DB_int[105] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_DB104 begin
    DB_int[104] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_DB103 begin
    DB_int[103] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_DB102 begin
    DB_int[102] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_DB101 begin
    DB_int[101] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_DB100 begin
    DB_int[100] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_DB99 begin
    DB_int[99] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_DB98 begin
    DB_int[98] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_DB97 begin
    DB_int[97] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_DB96 begin
    DB_int[96] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_DB95 begin
    DB_int[95] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_DB94 begin
    DB_int[94] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_DB93 begin
    DB_int[93] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_DB92 begin
    DB_int[92] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_DB91 begin
    DB_int[91] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_DB90 begin
    DB_int[90] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_DB89 begin
    DB_int[89] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_DB88 begin
    DB_int[88] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_DB87 begin
    DB_int[87] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_DB86 begin
    DB_int[86] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_DB85 begin
    DB_int[85] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_DB84 begin
    DB_int[84] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_DB83 begin
    DB_int[83] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_DB82 begin
    DB_int[82] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_DB81 begin
    DB_int[81] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_DB80 begin
    DB_int[80] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_DB79 begin
    DB_int[79] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_DB78 begin
    DB_int[78] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_DB77 begin
    DB_int[77] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_DB76 begin
    DB_int[76] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_DB75 begin
    DB_int[75] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_DB74 begin
    DB_int[74] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_DB73 begin
    DB_int[73] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_DB72 begin
    DB_int[72] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_DB71 begin
    DB_int[71] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_DB70 begin
    DB_int[70] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_DB69 begin
    DB_int[69] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_DB68 begin
    DB_int[68] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_DB67 begin
    DB_int[67] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_DB66 begin
    DB_int[66] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_DB65 begin
    DB_int[65] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_DB64 begin
    DB_int[64] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_DB63 begin
    DB_int[63] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_DB62 begin
    DB_int[62] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_DB61 begin
    DB_int[61] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_DB60 begin
    DB_int[60] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_DB59 begin
    DB_int[59] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_DB58 begin
    DB_int[58] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_DB57 begin
    DB_int[57] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_DB56 begin
    DB_int[56] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_DB55 begin
    DB_int[55] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_DB54 begin
    DB_int[54] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_DB53 begin
    DB_int[53] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_DB52 begin
    DB_int[52] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_DB51 begin
    DB_int[51] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_DB50 begin
    DB_int[50] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_DB49 begin
    DB_int[49] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_DB48 begin
    DB_int[48] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_DB47 begin
    DB_int[47] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_DB46 begin
    DB_int[46] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_DB45 begin
    DB_int[45] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_DB44 begin
    DB_int[44] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_DB43 begin
    DB_int[43] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_DB42 begin
    DB_int[42] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_DB41 begin
    DB_int[41] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_DB40 begin
    DB_int[40] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_DB39 begin
    DB_int[39] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_DB38 begin
    DB_int[38] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_DB37 begin
    DB_int[37] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_DB36 begin
    DB_int[36] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_DB35 begin
    DB_int[35] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_DB34 begin
    DB_int[34] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_DB33 begin
    DB_int[33] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_DB32 begin
    DB_int[32] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_DB31 begin
    DB_int[31] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_DB30 begin
    DB_int[30] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_DB29 begin
    DB_int[29] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_DB28 begin
    DB_int[28] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_DB27 begin
    DB_int[27] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_DB26 begin
    DB_int[26] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_DB25 begin
    DB_int[25] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_DB24 begin
    DB_int[24] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_DB23 begin
    DB_int[23] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_DB22 begin
    DB_int[22] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_DB21 begin
    DB_int[21] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_DB20 begin
    DB_int[20] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_DB19 begin
    DB_int[19] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_DB18 begin
    DB_int[18] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_DB17 begin
    DB_int[17] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_DB16 begin
    DB_int[16] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_DB15 begin
    DB_int[15] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_DB14 begin
    DB_int[14] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_DB13 begin
    DB_int[13] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_DB12 begin
    DB_int[12] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_DB11 begin
    DB_int[11] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_DB10 begin
    DB_int[10] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_DB9 begin
    DB_int[9] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_DB8 begin
    DB_int[8] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_DB7 begin
    DB_int[7] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_DB6 begin
    DB_int[6] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_DB5 begin
    DB_int[5] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_DB4 begin
    DB_int[4] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_DB3 begin
    DB_int[3] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_DB2 begin
    DB_int[2] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_DB1 begin
    DB_int[1] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_DB0 begin
    DB_int[0] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_EMAA2 begin
    EMAA_int[2] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_EMAA1 begin
    EMAA_int[1] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_EMAA0 begin
    EMAA_int[0] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_EMASA begin
    EMASA_int = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_EMAB2 begin
    EMAB_int[2] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_EMAB1 begin
    EMAB_int[1] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_EMAB0 begin
    EMAB_int[0] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_EMAWB1 begin
    EMAWB_int[1] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_EMAWB0 begin
    EMAWB_int[0] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_TENA begin
    TENA_int = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_TCENA begin
    CENA_int = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_TAA8 begin
    AA_int[8] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_TAA7 begin
    AA_int[7] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_TAA6 begin
    AA_int[6] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_TAA5 begin
    AA_int[5] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_TAA4 begin
    AA_int[4] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_TAA3 begin
    AA_int[3] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_TAA2 begin
    AA_int[2] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_TAA1 begin
    AA_int[1] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_TAA0 begin
    AA_int[0] = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_TENB begin
    TENB_int = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_TCENB begin
    CENB_int = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_TAB8 begin
    AB_int[8] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_TAB7 begin
    AB_int[7] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_TAB6 begin
    AB_int[6] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_TAB5 begin
    AB_int[5] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_TAB4 begin
    AB_int[4] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_TAB3 begin
    AB_int[3] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_TAB2 begin
    AB_int[2] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_TAB1 begin
    AB_int[1] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_TAB0 begin
    AB_int[0] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_TDB123 begin
    DB_int[123] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_TDB122 begin
    DB_int[122] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_TDB121 begin
    DB_int[121] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_TDB120 begin
    DB_int[120] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_TDB119 begin
    DB_int[119] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_TDB118 begin
    DB_int[118] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_TDB117 begin
    DB_int[117] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_TDB116 begin
    DB_int[116] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_TDB115 begin
    DB_int[115] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_TDB114 begin
    DB_int[114] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_TDB113 begin
    DB_int[113] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_TDB112 begin
    DB_int[112] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_TDB111 begin
    DB_int[111] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_TDB110 begin
    DB_int[110] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_TDB109 begin
    DB_int[109] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_TDB108 begin
    DB_int[108] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_TDB107 begin
    DB_int[107] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_TDB106 begin
    DB_int[106] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_TDB105 begin
    DB_int[105] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_TDB104 begin
    DB_int[104] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_TDB103 begin
    DB_int[103] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_TDB102 begin
    DB_int[102] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_TDB101 begin
    DB_int[101] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_TDB100 begin
    DB_int[100] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_TDB99 begin
    DB_int[99] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_TDB98 begin
    DB_int[98] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_TDB97 begin
    DB_int[97] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_TDB96 begin
    DB_int[96] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_TDB95 begin
    DB_int[95] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_TDB94 begin
    DB_int[94] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_TDB93 begin
    DB_int[93] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_TDB92 begin
    DB_int[92] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_TDB91 begin
    DB_int[91] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_TDB90 begin
    DB_int[90] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_TDB89 begin
    DB_int[89] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_TDB88 begin
    DB_int[88] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_TDB87 begin
    DB_int[87] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_TDB86 begin
    DB_int[86] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_TDB85 begin
    DB_int[85] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_TDB84 begin
    DB_int[84] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_TDB83 begin
    DB_int[83] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_TDB82 begin
    DB_int[82] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_TDB81 begin
    DB_int[81] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_TDB80 begin
    DB_int[80] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_TDB79 begin
    DB_int[79] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_TDB78 begin
    DB_int[78] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_TDB77 begin
    DB_int[77] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_TDB76 begin
    DB_int[76] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_TDB75 begin
    DB_int[75] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_TDB74 begin
    DB_int[74] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_TDB73 begin
    DB_int[73] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_TDB72 begin
    DB_int[72] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_TDB71 begin
    DB_int[71] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_TDB70 begin
    DB_int[70] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_TDB69 begin
    DB_int[69] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_TDB68 begin
    DB_int[68] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_TDB67 begin
    DB_int[67] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_TDB66 begin
    DB_int[66] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_TDB65 begin
    DB_int[65] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_TDB64 begin
    DB_int[64] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_TDB63 begin
    DB_int[63] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_TDB62 begin
    DB_int[62] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_TDB61 begin
    DB_int[61] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_TDB60 begin
    DB_int[60] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_TDB59 begin
    DB_int[59] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_TDB58 begin
    DB_int[58] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_TDB57 begin
    DB_int[57] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_TDB56 begin
    DB_int[56] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_TDB55 begin
    DB_int[55] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_TDB54 begin
    DB_int[54] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_TDB53 begin
    DB_int[53] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_TDB52 begin
    DB_int[52] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_TDB51 begin
    DB_int[51] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_TDB50 begin
    DB_int[50] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_TDB49 begin
    DB_int[49] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_TDB48 begin
    DB_int[48] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_TDB47 begin
    DB_int[47] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_TDB46 begin
    DB_int[46] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_TDB45 begin
    DB_int[45] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_TDB44 begin
    DB_int[44] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_TDB43 begin
    DB_int[43] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_TDB42 begin
    DB_int[42] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_TDB41 begin
    DB_int[41] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_TDB40 begin
    DB_int[40] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_TDB39 begin
    DB_int[39] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_TDB38 begin
    DB_int[38] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_TDB37 begin
    DB_int[37] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_TDB36 begin
    DB_int[36] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_TDB35 begin
    DB_int[35] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_TDB34 begin
    DB_int[34] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_TDB33 begin
    DB_int[33] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_TDB32 begin
    DB_int[32] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_TDB31 begin
    DB_int[31] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_TDB30 begin
    DB_int[30] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_TDB29 begin
    DB_int[29] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_TDB28 begin
    DB_int[28] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_TDB27 begin
    DB_int[27] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_TDB26 begin
    DB_int[26] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_TDB25 begin
    DB_int[25] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_TDB24 begin
    DB_int[24] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_TDB23 begin
    DB_int[23] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_TDB22 begin
    DB_int[22] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_TDB21 begin
    DB_int[21] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_TDB20 begin
    DB_int[20] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_TDB19 begin
    DB_int[19] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_TDB18 begin
    DB_int[18] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_TDB17 begin
    DB_int[17] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_TDB16 begin
    DB_int[16] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_TDB15 begin
    DB_int[15] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_TDB14 begin
    DB_int[14] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_TDB13 begin
    DB_int[13] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_TDB12 begin
    DB_int[12] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_TDB11 begin
    DB_int[11] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_TDB10 begin
    DB_int[10] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_TDB9 begin
    DB_int[9] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_TDB8 begin
    DB_int[8] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_TDB7 begin
    DB_int[7] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_TDB6 begin
    DB_int[6] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_TDB5 begin
    DB_int[5] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_TDB4 begin
    DB_int[4] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_TDB3 begin
    DB_int[3] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_TDB2 begin
    DB_int[2] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_TDB1 begin
    DB_int[1] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_TDB0 begin
    DB_int[0] = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_RET1N begin
    RET1N_int = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_STOVA begin
    STOVA_int = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_STOVB begin
    STOVB_int = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_COLLDISN begin
    COLLDISN_int = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end

  always @ NOT_CONTA begin
    cont_flag0_int = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_CLKA_PER begin
    clk0_int = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_CLKA_MINH begin
    clk0_int = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_CLKA_MINL begin
    clk0_int = 1'bx;
    if ( globalNotifier0 === 1'b0 ) globalNotifier0 = 1'bx;
  end
  always @ NOT_CONTB begin
    cont_flag1_int = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_CLKB_PER begin
    clk1_int = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_CLKB_MINH begin
    clk1_int = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end
  always @ NOT_CLKB_MINL begin
    clk1_int = 1'bx;
    if ( globalNotifier1 === 1'b0 ) globalNotifier1 = 1'bx;
  end


  wire contA_STOVAeq0andEMAA2eq0andEMAA1eq0andEMAA0eq0;
  wire contA_STOVAeq0andEMAA2eq0andEMAA1eq0andEMAA0eq1;
  wire contA_STOVAeq0andEMAA2eq0andEMAA1eq1andEMAA0eq0;
  wire contA_STOVAeq0andEMAA2eq0andEMAA1eq1andEMAA0eq1;
  wire contA_STOVAeq0andEMAA2eq1andEMAA1eq0andEMAA0eq0;
  wire contA_STOVAeq0andEMAA2eq1andEMAA1eq0andEMAA0eq1;
  wire contA_STOVAeq0andEMAA2eq1andEMAA1eq1andEMAA0eq0;
  wire contA_STOVAeq0andEMAA2eq1andEMAA1eq1andEMAA0eq1;
  wire STOVAeq0andEMAA2eq0andEMAA1eq0andEMAA0eq0andEMASAeq0;
  wire STOVAeq0andEMAA2eq0andEMAA1eq0andEMAA0eq0andEMASAeq1;
  wire STOVAeq0andEMAA2eq0andEMAA1eq0andEMAA0eq1andEMASAeq0;
  wire STOVAeq0andEMAA2eq0andEMAA1eq0andEMAA0eq1andEMASAeq1;
  wire STOVAeq0andEMAA2eq0andEMAA1eq1andEMAA0eq0andEMASAeq0;
  wire STOVAeq0andEMAA2eq0andEMAA1eq1andEMAA0eq0andEMASAeq1;
  wire STOVAeq0andEMAA2eq0andEMAA1eq1andEMAA0eq1andEMASAeq0;
  wire STOVAeq0andEMAA2eq0andEMAA1eq1andEMAA0eq1andEMASAeq1;
  wire STOVAeq0andEMAA2eq1andEMAA1eq0andEMAA0eq0andEMASAeq0;
  wire STOVAeq0andEMAA2eq1andEMAA1eq0andEMAA0eq0andEMASAeq1;
  wire STOVAeq0andEMAA2eq1andEMAA1eq0andEMAA0eq1andEMASAeq0;
  wire STOVAeq0andEMAA2eq1andEMAA1eq0andEMAA0eq1andEMASAeq1;
  wire STOVAeq0andEMAA2eq1andEMAA1eq1andEMAA0eq0andEMASAeq0;
  wire STOVAeq0andEMAA2eq1andEMAA1eq1andEMAA0eq0andEMASAeq1;
  wire STOVAeq0andEMAA2eq1andEMAA1eq1andEMAA0eq1andEMASAeq0;
  wire STOVAeq0andEMAA2eq1andEMAA1eq1andEMAA0eq1andEMASAeq1;
  wire contB_STOVBeq0andEMAB2eq0andEMAB1eq0andEMAB0eq0andEMAWB1eq0andEMAWB0eq0;
  wire contB_STOVBeq0andEMAB2eq0andEMAB1eq0andEMAB0eq0andEMAWB1eq0andEMAWB0eq1;
  wire contB_STOVBeq0andEMAB2eq0andEMAB1eq0andEMAB0eq0andEMAWB1eq1andEMAWB0eq0;
  wire contB_STOVBeq0andEMAB2eq0andEMAB1eq0andEMAB0eq0andEMAWB1eq1andEMAWB0eq1;
  wire contB_STOVBeq0andEMAB2eq0andEMAB1eq0andEMAB0eq1andEMAWB1eq0andEMAWB0eq0;
  wire contB_STOVBeq0andEMAB2eq0andEMAB1eq0andEMAB0eq1andEMAWB1eq0andEMAWB0eq1;
  wire contB_STOVBeq0andEMAB2eq0andEMAB1eq0andEMAB0eq1andEMAWB1eq1andEMAWB0eq0;
  wire contB_STOVBeq0andEMAB2eq0andEMAB1eq0andEMAB0eq1andEMAWB1eq1andEMAWB0eq1;
  wire contB_STOVBeq0andEMAB2eq0andEMAB1eq1andEMAB0eq0andEMAWB1eq0andEMAWB0eq0;
  wire contB_STOVBeq0andEMAB2eq0andEMAB1eq1andEMAB0eq0andEMAWB1eq0andEMAWB0eq1;
  wire contB_STOVBeq0andEMAB2eq0andEMAB1eq1andEMAB0eq0andEMAWB1eq1andEMAWB0eq0;
  wire contB_STOVBeq0andEMAB2eq0andEMAB1eq1andEMAB0eq0andEMAWB1eq1andEMAWB0eq1;
  wire contB_STOVBeq0andEMAB2eq0andEMAB1eq1andEMAB0eq1andEMAWB1eq0andEMAWB0eq0;
  wire contB_STOVBeq0andEMAB2eq0andEMAB1eq1andEMAB0eq1andEMAWB1eq0andEMAWB0eq1;
  wire contB_STOVBeq0andEMAB2eq0andEMAB1eq1andEMAB0eq1andEMAWB1eq1andEMAWB0eq0;
  wire contB_STOVBeq0andEMAB2eq0andEMAB1eq1andEMAB0eq1andEMAWB1eq1andEMAWB0eq1;
  wire contB_STOVBeq0andEMAB2eq1andEMAB1eq0andEMAB0eq0andEMAWB1eq0andEMAWB0eq0;
  wire contB_STOVBeq0andEMAB2eq1andEMAB1eq0andEMAB0eq0andEMAWB1eq0andEMAWB0eq1;
  wire contB_STOVBeq0andEMAB2eq1andEMAB1eq0andEMAB0eq0andEMAWB1eq1andEMAWB0eq0;
  wire contB_STOVBeq0andEMAB2eq1andEMAB1eq0andEMAB0eq0andEMAWB1eq1andEMAWB0eq1;
  wire contB_STOVBeq0andEMAB2eq1andEMAB1eq0andEMAB0eq1andEMAWB1eq0andEMAWB0eq0;
  wire contB_STOVBeq0andEMAB2eq1andEMAB1eq0andEMAB0eq1andEMAWB1eq0andEMAWB0eq1;
  wire contB_STOVBeq0andEMAB2eq1andEMAB1eq0andEMAB0eq1andEMAWB1eq1andEMAWB0eq0;
  wire contB_STOVBeq0andEMAB2eq1andEMAB1eq0andEMAB0eq1andEMAWB1eq1andEMAWB0eq1;
  wire contB_STOVBeq0andEMAB2eq1andEMAB1eq1andEMAB0eq0andEMAWB1eq0andEMAWB0eq0;
  wire contB_STOVBeq0andEMAB2eq1andEMAB1eq1andEMAB0eq0andEMAWB1eq0andEMAWB0eq1;
  wire contB_STOVBeq0andEMAB2eq1andEMAB1eq1andEMAB0eq0andEMAWB1eq1andEMAWB0eq0;
  wire contB_STOVBeq0andEMAB2eq1andEMAB1eq1andEMAB0eq0andEMAWB1eq1andEMAWB0eq1;
  wire contB_STOVBeq0andEMAB2eq1andEMAB1eq1andEMAB0eq1andEMAWB1eq0andEMAWB0eq0;
  wire contB_STOVBeq0andEMAB2eq1andEMAB1eq1andEMAB0eq1andEMAWB1eq0andEMAWB0eq1;
  wire contB_STOVBeq0andEMAB2eq1andEMAB1eq1andEMAB0eq1andEMAWB1eq1andEMAWB0eq0;
  wire contB_STOVBeq0andEMAB2eq1andEMAB1eq1andEMAB0eq1andEMAWB1eq1andEMAWB0eq1;
  wire STOVBeq0andEMAB2eq0andEMAB1eq0andEMAB0eq0andEMAWB1eq0andEMAWB0eq0;
  wire STOVBeq0andEMAB2eq0andEMAB1eq0andEMAB0eq0andEMAWB1eq0andEMAWB0eq1;
  wire STOVBeq0andEMAB2eq0andEMAB1eq0andEMAB0eq0andEMAWB1eq1andEMAWB0eq0;
  wire STOVBeq0andEMAB2eq0andEMAB1eq0andEMAB0eq0andEMAWB1eq1andEMAWB0eq1;
  wire STOVBeq0andEMAB2eq0andEMAB1eq0andEMAB0eq1andEMAWB1eq0andEMAWB0eq0;
  wire STOVBeq0andEMAB2eq0andEMAB1eq0andEMAB0eq1andEMAWB1eq0andEMAWB0eq1;
  wire STOVBeq0andEMAB2eq0andEMAB1eq0andEMAB0eq1andEMAWB1eq1andEMAWB0eq0;
  wire STOVBeq0andEMAB2eq0andEMAB1eq0andEMAB0eq1andEMAWB1eq1andEMAWB0eq1;
  wire STOVBeq0andEMAB2eq0andEMAB1eq1andEMAB0eq0andEMAWB1eq0andEMAWB0eq0;
  wire STOVBeq0andEMAB2eq0andEMAB1eq1andEMAB0eq0andEMAWB1eq0andEMAWB0eq1;
  wire STOVBeq0andEMAB2eq0andEMAB1eq1andEMAB0eq0andEMAWB1eq1andEMAWB0eq0;
  wire STOVBeq0andEMAB2eq0andEMAB1eq1andEMAB0eq0andEMAWB1eq1andEMAWB0eq1;
  wire STOVBeq0andEMAB2eq0andEMAB1eq1andEMAB0eq1andEMAWB1eq0andEMAWB0eq0;
  wire STOVBeq0andEMAB2eq0andEMAB1eq1andEMAB0eq1andEMAWB1eq0andEMAWB0eq1;
  wire STOVBeq0andEMAB2eq0andEMAB1eq1andEMAB0eq1andEMAWB1eq1andEMAWB0eq0;
  wire STOVBeq0andEMAB2eq0andEMAB1eq1andEMAB0eq1andEMAWB1eq1andEMAWB0eq1;
  wire STOVBeq0andEMAB2eq1andEMAB1eq0andEMAB0eq0andEMAWB1eq0andEMAWB0eq0;
  wire STOVBeq0andEMAB2eq1andEMAB1eq0andEMAB0eq0andEMAWB1eq0andEMAWB0eq1;
  wire STOVBeq0andEMAB2eq1andEMAB1eq0andEMAB0eq0andEMAWB1eq1andEMAWB0eq0;
  wire STOVBeq0andEMAB2eq1andEMAB1eq0andEMAB0eq0andEMAWB1eq1andEMAWB0eq1;
  wire STOVBeq0andEMAB2eq1andEMAB1eq0andEMAB0eq1andEMAWB1eq0andEMAWB0eq0;
  wire STOVBeq0andEMAB2eq1andEMAB1eq0andEMAB0eq1andEMAWB1eq0andEMAWB0eq1;
  wire STOVBeq0andEMAB2eq1andEMAB1eq0andEMAB0eq1andEMAWB1eq1andEMAWB0eq0;
  wire STOVBeq0andEMAB2eq1andEMAB1eq0andEMAB0eq1andEMAWB1eq1andEMAWB0eq1;
  wire STOVBeq0andEMAB2eq1andEMAB1eq1andEMAB0eq0andEMAWB1eq0andEMAWB0eq0;
  wire STOVBeq0andEMAB2eq1andEMAB1eq1andEMAB0eq0andEMAWB1eq0andEMAWB0eq1;
  wire STOVBeq0andEMAB2eq1andEMAB1eq1andEMAB0eq0andEMAWB1eq1andEMAWB0eq0;
  wire STOVBeq0andEMAB2eq1andEMAB1eq1andEMAB0eq0andEMAWB1eq1andEMAWB0eq1;
  wire STOVBeq0andEMAB2eq1andEMAB1eq1andEMAB0eq1andEMAWB1eq0andEMAWB0eq0;
  wire STOVBeq0andEMAB2eq1andEMAB1eq1andEMAB0eq1andEMAWB1eq0andEMAWB0eq1;
  wire STOVBeq0andEMAB2eq1andEMAB1eq1andEMAB0eq1andEMAWB1eq1andEMAWB0eq0;
  wire STOVBeq0andEMAB2eq1andEMAB1eq1andEMAB0eq1andEMAWB1eq1andEMAWB0eq1;
  wire opopTENAeq1andCENAeq0cporopTENAeq0andTCENAeq0cpcpandopopTENBeq1andCENBeq0cporopTENBeq0andTCENBeq0cpcp;
  wire opTENAeq1andCENAeq0cporopTENAeq0andTCENAeq0cp;
  wire opTENBeq1andCENBeq0cporopTENBeq0andTCENBeq0cp;

  wire contA_STOVAeq1, STOVAeq0, STOVAeq1andEMASAeq0, STOVAeq1andEMASAeq1, TENAeq1;
  wire TENAeq1andCENAeq0, contB_STOVBeq1, STOVBeq0, STOVBeq1, TENBeq1, TENBeq1andCENBeq0;
  wire TENAeq0, TENAeq0andTCENAeq0, TENBeq0, TENBeq0andTCENBeq0;

  assign contA_STOVAeq0andEMAA2eq0andEMAA1eq0andEMAA0eq0 = 
         (!STOVA) && (!EMAA[2]) && (!EMAA[1]) && (!EMAA[0]) && !(TENA ? CENA : TCENA) && contA_flag;
  assign contA_STOVAeq0andEMAA2eq0andEMAA1eq0andEMAA0eq1 = 
         (!STOVA) && (!EMAA[2]) && (!EMAA[1]) && (EMAA[0]) && !(TENA ? CENA : TCENA) && contA_flag;
  assign contA_STOVAeq0andEMAA2eq0andEMAA1eq1andEMAA0eq0 = 
         (!STOVA) && (!EMAA[2]) && (EMAA[1]) && (!EMAA[0]) && !(TENA ? CENA : TCENA) && contA_flag;
  assign contA_STOVAeq0andEMAA2eq0andEMAA1eq1andEMAA0eq1 = 
         (!STOVA) && (!EMAA[2]) && (EMAA[1]) && (EMAA[0]) && !(TENA ? CENA : TCENA) && contA_flag;
  assign contA_STOVAeq0andEMAA2eq1andEMAA1eq0andEMAA0eq0 = 
         (!STOVA) && (EMAA[2]) && (!EMAA[1]) && (!EMAA[0]) && !(TENA ? CENA : TCENA) && contA_flag;
  assign contA_STOVAeq0andEMAA2eq1andEMAA1eq0andEMAA0eq1 = 
         (!STOVA) && (EMAA[2]) && (!EMAA[1]) && (EMAA[0]) && !(TENA ? CENA : TCENA) && contA_flag;
  assign contA_STOVAeq0andEMAA2eq1andEMAA1eq1andEMAA0eq0 = 
         (!STOVA) && (EMAA[2]) && (EMAA[1]) && (!EMAA[0]) && !(TENA ? CENA : TCENA) && contA_flag;
  assign contA_STOVAeq0andEMAA2eq1andEMAA1eq1andEMAA0eq1 = 
         (!STOVA) && (EMAA[2]) && (EMAA[1]) && (EMAA[0]) && !(TENA ? CENA : TCENA) && contA_flag;
  assign contA_STOVAeq1 = 
         (STOVA) && !(TENA ? CENA : TCENA) && contA_flag;
  assign STOVAeq0andEMAA2eq0andEMAA1eq0andEMAA0eq0andEMASAeq0 = 
         (!STOVA) && (!EMAA[2]) && (!EMAA[1]) && (!EMAA[0]) && (!EMASA) && !(TENA ? CENA : TCENA);
  assign STOVAeq0andEMAA2eq0andEMAA1eq0andEMAA0eq0andEMASAeq1 = 
         (!STOVA) && (!EMAA[2]) && (!EMAA[1]) && (!EMAA[0]) && (EMASA) && !(TENA ? CENA : TCENA);
  assign STOVAeq0andEMAA2eq0andEMAA1eq0andEMAA0eq1andEMASAeq0 = 
         (!STOVA) && (!EMAA[2]) && (!EMAA[1]) && (EMAA[0]) && (!EMASA) && !(TENA ? CENA : TCENA);
  assign STOVAeq0andEMAA2eq0andEMAA1eq0andEMAA0eq1andEMASAeq1 = 
         (!STOVA) && (!EMAA[2]) && (!EMAA[1]) && (EMAA[0]) && (EMASA) && !(TENA ? CENA : TCENA);
  assign STOVAeq0andEMAA2eq0andEMAA1eq1andEMAA0eq0andEMASAeq0 = 
         (!STOVA) && (!EMAA[2]) && (EMAA[1]) && (!EMAA[0]) && (!EMASA) && !(TENA ? CENA : TCENA);
  assign STOVAeq0andEMAA2eq0andEMAA1eq1andEMAA0eq0andEMASAeq1 = 
         (!STOVA) && (!EMAA[2]) && (EMAA[1]) && (!EMAA[0]) && (EMASA) && !(TENA ? CENA : TCENA);
  assign STOVAeq0andEMAA2eq0andEMAA1eq1andEMAA0eq1andEMASAeq0 = 
         (!STOVA) && (!EMAA[2]) && (EMAA[1]) && (EMAA[0]) && (!EMASA) && !(TENA ? CENA : TCENA);
  assign STOVAeq0andEMAA2eq0andEMAA1eq1andEMAA0eq1andEMASAeq1 = 
         (!STOVA) && (!EMAA[2]) && (EMAA[1]) && (EMAA[0]) && (EMASA) && !(TENA ? CENA : TCENA);
  assign STOVAeq0andEMAA2eq1andEMAA1eq0andEMAA0eq0andEMASAeq0 = 
         (!STOVA) && (EMAA[2]) && (!EMAA[1]) && (!EMAA[0]) && (!EMASA) && !(TENA ? CENA : TCENA);
  assign STOVAeq0andEMAA2eq1andEMAA1eq0andEMAA0eq0andEMASAeq1 = 
         (!STOVA) && (EMAA[2]) && (!EMAA[1]) && (!EMAA[0]) && (EMASA) && !(TENA ? CENA : TCENA);
  assign STOVAeq0andEMAA2eq1andEMAA1eq0andEMAA0eq1andEMASAeq0 = 
         (!STOVA) && (EMAA[2]) && (!EMAA[1]) && (EMAA[0]) && (!EMASA) && !(TENA ? CENA : TCENA);
  assign STOVAeq0andEMAA2eq1andEMAA1eq0andEMAA0eq1andEMASAeq1 = 
         (!STOVA) && (EMAA[2]) && (!EMAA[1]) && (EMAA[0]) && (EMASA) && !(TENA ? CENA : TCENA);
  assign STOVAeq0andEMAA2eq1andEMAA1eq1andEMAA0eq0andEMASAeq0 = 
         (!STOVA) && (EMAA[2]) && (EMAA[1]) && (!EMAA[0]) && (!EMASA) && !(TENA ? CENA : TCENA);
  assign STOVAeq0andEMAA2eq1andEMAA1eq1andEMAA0eq0andEMASAeq1 = 
         (!STOVA) && (EMAA[2]) && (EMAA[1]) && (!EMAA[0]) && (EMASA) && !(TENA ? CENA : TCENA);
  assign STOVAeq0andEMAA2eq1andEMAA1eq1andEMAA0eq1andEMASAeq0 = 
         (!STOVA) && (EMAA[2]) && (EMAA[1]) && (EMAA[0]) && (!EMASA) && !(TENA ? CENA : TCENA);
  assign STOVAeq0andEMAA2eq1andEMAA1eq1andEMAA0eq1andEMASAeq1 = 
         (!STOVA) && (EMAA[2]) && (EMAA[1]) && (EMAA[0]) && (EMASA) && !(TENA ? CENA : TCENA);
  assign STOVAeq1andEMASAeq0 = 
         (STOVA) && (!EMASA) && !(TENA ? CENA : TCENA);
  assign STOVAeq1andEMASAeq1 = 
         (STOVA) && (EMASA) && !(TENA ? CENA : TCENA);
  assign TENAeq1andCENAeq0 = 
         !(!TENA || CENA);
  assign contB_STOVBeq0andEMAB2eq0andEMAB1eq0andEMAB0eq0andEMAWB1eq0andEMAWB0eq0 = 
         (!STOVB) && (!EMAB[2]) && (!EMAB[1]) && (!EMAB[0]) && (!EMAWB[1]) && (!EMAWB[0]) && !(TENB ? CENB : TCENB) && contB_flag;
  assign contB_STOVBeq0andEMAB2eq0andEMAB1eq0andEMAB0eq0andEMAWB1eq0andEMAWB0eq1 = 
         (!STOVB) && (!EMAB[2]) && (!EMAB[1]) && (!EMAB[0]) && (!EMAWB[1]) && (EMAWB[0]) && !(TENB ? CENB : TCENB) && contB_flag;
  assign contB_STOVBeq0andEMAB2eq0andEMAB1eq0andEMAB0eq0andEMAWB1eq1andEMAWB0eq0 = 
         (!STOVB) && (!EMAB[2]) && (!EMAB[1]) && (!EMAB[0]) && (EMAWB[1]) && (!EMAWB[0]) && !(TENB ? CENB : TCENB) && contB_flag;
  assign contB_STOVBeq0andEMAB2eq0andEMAB1eq0andEMAB0eq0andEMAWB1eq1andEMAWB0eq1 = 
         (!STOVB) && (!EMAB[2]) && (!EMAB[1]) && (!EMAB[0]) && (EMAWB[1]) && (EMAWB[0]) && !(TENB ? CENB : TCENB) && contB_flag;
  assign contB_STOVBeq0andEMAB2eq0andEMAB1eq0andEMAB0eq1andEMAWB1eq0andEMAWB0eq0 = 
         (!STOVB) && (!EMAB[2]) && (!EMAB[1]) && (EMAB[0]) && (!EMAWB[1]) && (!EMAWB[0]) && !(TENB ? CENB : TCENB) && contB_flag;
  assign contB_STOVBeq0andEMAB2eq0andEMAB1eq0andEMAB0eq1andEMAWB1eq0andEMAWB0eq1 = 
         (!STOVB) && (!EMAB[2]) && (!EMAB[1]) && (EMAB[0]) && (!EMAWB[1]) && (EMAWB[0]) && !(TENB ? CENB : TCENB) && contB_flag;
  assign contB_STOVBeq0andEMAB2eq0andEMAB1eq0andEMAB0eq1andEMAWB1eq1andEMAWB0eq0 = 
         (!STOVB) && (!EMAB[2]) && (!EMAB[1]) && (EMAB[0]) && (EMAWB[1]) && (!EMAWB[0]) && !(TENB ? CENB : TCENB) && contB_flag;
  assign contB_STOVBeq0andEMAB2eq0andEMAB1eq0andEMAB0eq1andEMAWB1eq1andEMAWB0eq1 = 
         (!STOVB) && (!EMAB[2]) && (!EMAB[1]) && (EMAB[0]) && (EMAWB[1]) && (EMAWB[0]) && !(TENB ? CENB : TCENB) && contB_flag;
  assign contB_STOVBeq0andEMAB2eq0andEMAB1eq1andEMAB0eq0andEMAWB1eq0andEMAWB0eq0 = 
         (!STOVB) && (!EMAB[2]) && (EMAB[1]) && (!EMAB[0]) && (!EMAWB[1]) && (!EMAWB[0]) && !(TENB ? CENB : TCENB) && contB_flag;
  assign contB_STOVBeq0andEMAB2eq0andEMAB1eq1andEMAB0eq0andEMAWB1eq0andEMAWB0eq1 = 
         (!STOVB) && (!EMAB[2]) && (EMAB[1]) && (!EMAB[0]) && (!EMAWB[1]) && (EMAWB[0]) && !(TENB ? CENB : TCENB) && contB_flag;
  assign contB_STOVBeq0andEMAB2eq0andEMAB1eq1andEMAB0eq0andEMAWB1eq1andEMAWB0eq0 = 
         (!STOVB) && (!EMAB[2]) && (EMAB[1]) && (!EMAB[0]) && (EMAWB[1]) && (!EMAWB[0]) && !(TENB ? CENB : TCENB) && contB_flag;
  assign contB_STOVBeq0andEMAB2eq0andEMAB1eq1andEMAB0eq0andEMAWB1eq1andEMAWB0eq1 = 
         (!STOVB) && (!EMAB[2]) && (EMAB[1]) && (!EMAB[0]) && (EMAWB[1]) && (EMAWB[0]) && !(TENB ? CENB : TCENB) && contB_flag;
  assign contB_STOVBeq0andEMAB2eq0andEMAB1eq1andEMAB0eq1andEMAWB1eq0andEMAWB0eq0 = 
         (!STOVB) && (!EMAB[2]) && (EMAB[1]) && (EMAB[0]) && (!EMAWB[1]) && (!EMAWB[0]) && !(TENB ? CENB : TCENB) && contB_flag;
  assign contB_STOVBeq0andEMAB2eq0andEMAB1eq1andEMAB0eq1andEMAWB1eq0andEMAWB0eq1 = 
         (!STOVB) && (!EMAB[2]) && (EMAB[1]) && (EMAB[0]) && (!EMAWB[1]) && (EMAWB[0]) && !(TENB ? CENB : TCENB) && contB_flag;
  assign contB_STOVBeq0andEMAB2eq0andEMAB1eq1andEMAB0eq1andEMAWB1eq1andEMAWB0eq0 = 
         (!STOVB) && (!EMAB[2]) && (EMAB[1]) && (EMAB[0]) && (EMAWB[1]) && (!EMAWB[0]) && !(TENB ? CENB : TCENB) && contB_flag;
  assign contB_STOVBeq0andEMAB2eq0andEMAB1eq1andEMAB0eq1andEMAWB1eq1andEMAWB0eq1 = 
         (!STOVB) && (!EMAB[2]) && (EMAB[1]) && (EMAB[0]) && (EMAWB[1]) && (EMAWB[0]) && !(TENB ? CENB : TCENB) && contB_flag;
  assign contB_STOVBeq0andEMAB2eq1andEMAB1eq0andEMAB0eq0andEMAWB1eq0andEMAWB0eq0 = 
         (!STOVB) && (EMAB[2]) && (!EMAB[1]) && (!EMAB[0]) && (!EMAWB[1]) && (!EMAWB[0]) && !(TENB ? CENB : TCENB) && contB_flag;
  assign contB_STOVBeq0andEMAB2eq1andEMAB1eq0andEMAB0eq0andEMAWB1eq0andEMAWB0eq1 = 
         (!STOVB) && (EMAB[2]) && (!EMAB[1]) && (!EMAB[0]) && (!EMAWB[1]) && (EMAWB[0]) && !(TENB ? CENB : TCENB) && contB_flag;
  assign contB_STOVBeq0andEMAB2eq1andEMAB1eq0andEMAB0eq0andEMAWB1eq1andEMAWB0eq0 = 
         (!STOVB) && (EMAB[2]) && (!EMAB[1]) && (!EMAB[0]) && (EMAWB[1]) && (!EMAWB[0]) && !(TENB ? CENB : TCENB) && contB_flag;
  assign contB_STOVBeq0andEMAB2eq1andEMAB1eq0andEMAB0eq0andEMAWB1eq1andEMAWB0eq1 = 
         (!STOVB) && (EMAB[2]) && (!EMAB[1]) && (!EMAB[0]) && (EMAWB[1]) && (EMAWB[0]) && !(TENB ? CENB : TCENB) && contB_flag;
  assign contB_STOVBeq0andEMAB2eq1andEMAB1eq0andEMAB0eq1andEMAWB1eq0andEMAWB0eq0 = 
         (!STOVB) && (EMAB[2]) && (!EMAB[1]) && (EMAB[0]) && (!EMAWB[1]) && (!EMAWB[0]) && !(TENB ? CENB : TCENB) && contB_flag;
  assign contB_STOVBeq0andEMAB2eq1andEMAB1eq0andEMAB0eq1andEMAWB1eq0andEMAWB0eq1 = 
         (!STOVB) && (EMAB[2]) && (!EMAB[1]) && (EMAB[0]) && (!EMAWB[1]) && (EMAWB[0]) && !(TENB ? CENB : TCENB) && contB_flag;
  assign contB_STOVBeq0andEMAB2eq1andEMAB1eq0andEMAB0eq1andEMAWB1eq1andEMAWB0eq0 = 
         (!STOVB) && (EMAB[2]) && (!EMAB[1]) && (EMAB[0]) && (EMAWB[1]) && (!EMAWB[0]) && !(TENB ? CENB : TCENB) && contB_flag;
  assign contB_STOVBeq0andEMAB2eq1andEMAB1eq0andEMAB0eq1andEMAWB1eq1andEMAWB0eq1 = 
         (!STOVB) && (EMAB[2]) && (!EMAB[1]) && (EMAB[0]) && (EMAWB[1]) && (EMAWB[0]) && !(TENB ? CENB : TCENB) && contB_flag;
  assign contB_STOVBeq0andEMAB2eq1andEMAB1eq1andEMAB0eq0andEMAWB1eq0andEMAWB0eq0 = 
         (!STOVB) && (EMAB[2]) && (EMAB[1]) && (!EMAB[0]) && (!EMAWB[1]) && (!EMAWB[0]) && !(TENB ? CENB : TCENB) && contB_flag;
  assign contB_STOVBeq0andEMAB2eq1andEMAB1eq1andEMAB0eq0andEMAWB1eq0andEMAWB0eq1 = 
         (!STOVB) && (EMAB[2]) && (EMAB[1]) && (!EMAB[0]) && (!EMAWB[1]) && (EMAWB[0]) && !(TENB ? CENB : TCENB) && contB_flag;
  assign contB_STOVBeq0andEMAB2eq1andEMAB1eq1andEMAB0eq0andEMAWB1eq1andEMAWB0eq0 = 
         (!STOVB) && (EMAB[2]) && (EMAB[1]) && (!EMAB[0]) && (EMAWB[1]) && (!EMAWB[0]) && !(TENB ? CENB : TCENB) && contB_flag;
  assign contB_STOVBeq0andEMAB2eq1andEMAB1eq1andEMAB0eq0andEMAWB1eq1andEMAWB0eq1 = 
         (!STOVB) && (EMAB[2]) && (EMAB[1]) && (!EMAB[0]) && (EMAWB[1]) && (EMAWB[0]) && !(TENB ? CENB : TCENB) && contB_flag;
  assign contB_STOVBeq0andEMAB2eq1andEMAB1eq1andEMAB0eq1andEMAWB1eq0andEMAWB0eq0 = 
         (!STOVB) && (EMAB[2]) && (EMAB[1]) && (EMAB[0]) && (!EMAWB[1]) && (!EMAWB[0]) && !(TENB ? CENB : TCENB) && contB_flag;
  assign contB_STOVBeq0andEMAB2eq1andEMAB1eq1andEMAB0eq1andEMAWB1eq0andEMAWB0eq1 = 
         (!STOVB) && (EMAB[2]) && (EMAB[1]) && (EMAB[0]) && (!EMAWB[1]) && (EMAWB[0]) && !(TENB ? CENB : TCENB) && contB_flag;
  assign contB_STOVBeq0andEMAB2eq1andEMAB1eq1andEMAB0eq1andEMAWB1eq1andEMAWB0eq0 = 
         (!STOVB) && (EMAB[2]) && (EMAB[1]) && (EMAB[0]) && (EMAWB[1]) && (!EMAWB[0]) && !(TENB ? CENB : TCENB) && contB_flag;
  assign contB_STOVBeq0andEMAB2eq1andEMAB1eq1andEMAB0eq1andEMAWB1eq1andEMAWB0eq1 = 
         (!STOVB) && (EMAB[2]) && (EMAB[1]) && (EMAB[0]) && (EMAWB[1]) && (EMAWB[0]) && !(TENB ? CENB : TCENB) && contB_flag;
  assign contB_STOVBeq1 = 
         (STOVB) && !(TENB ? CENB : TCENB) && contB_flag;
  assign STOVBeq0andEMAB2eq0andEMAB1eq0andEMAB0eq0andEMAWB1eq0andEMAWB0eq0 = 
         (!STOVB) && (!EMAB[2]) && (!EMAB[1]) && (!EMAB[0]) && (!EMAWB[1]) && (!EMAWB[0]) && !(TENB ? CENB : TCENB);
  assign STOVBeq0andEMAB2eq0andEMAB1eq0andEMAB0eq0andEMAWB1eq0andEMAWB0eq1 = 
         (!STOVB) && (!EMAB[2]) && (!EMAB[1]) && (!EMAB[0]) && (!EMAWB[1]) && (EMAWB[0]) && !(TENB ? CENB : TCENB);
  assign STOVBeq0andEMAB2eq0andEMAB1eq0andEMAB0eq0andEMAWB1eq1andEMAWB0eq0 = 
         (!STOVB) && (!EMAB[2]) && (!EMAB[1]) && (!EMAB[0]) && (EMAWB[1]) && (!EMAWB[0]) && !(TENB ? CENB : TCENB);
  assign STOVBeq0andEMAB2eq0andEMAB1eq0andEMAB0eq0andEMAWB1eq1andEMAWB0eq1 = 
         (!STOVB) && (!EMAB[2]) && (!EMAB[1]) && (!EMAB[0]) && (EMAWB[1]) && (EMAWB[0]) && !(TENB ? CENB : TCENB);
  assign STOVBeq0andEMAB2eq0andEMAB1eq0andEMAB0eq1andEMAWB1eq0andEMAWB0eq0 = 
         (!STOVB) && (!EMAB[2]) && (!EMAB[1]) && (EMAB[0]) && (!EMAWB[1]) && (!EMAWB[0]) && !(TENB ? CENB : TCENB);
  assign STOVBeq0andEMAB2eq0andEMAB1eq0andEMAB0eq1andEMAWB1eq0andEMAWB0eq1 = 
         (!STOVB) && (!EMAB[2]) && (!EMAB[1]) && (EMAB[0]) && (!EMAWB[1]) && (EMAWB[0]) && !(TENB ? CENB : TCENB);
  assign STOVBeq0andEMAB2eq0andEMAB1eq0andEMAB0eq1andEMAWB1eq1andEMAWB0eq0 = 
         (!STOVB) && (!EMAB[2]) && (!EMAB[1]) && (EMAB[0]) && (EMAWB[1]) && (!EMAWB[0]) && !(TENB ? CENB : TCENB);
  assign STOVBeq0andEMAB2eq0andEMAB1eq0andEMAB0eq1andEMAWB1eq1andEMAWB0eq1 = 
         (!STOVB) && (!EMAB[2]) && (!EMAB[1]) && (EMAB[0]) && (EMAWB[1]) && (EMAWB[0]) && !(TENB ? CENB : TCENB);
  assign STOVBeq0andEMAB2eq0andEMAB1eq1andEMAB0eq0andEMAWB1eq0andEMAWB0eq0 = 
         (!STOVB) && (!EMAB[2]) && (EMAB[1]) && (!EMAB[0]) && (!EMAWB[1]) && (!EMAWB[0]) && !(TENB ? CENB : TCENB);
  assign STOVBeq0andEMAB2eq0andEMAB1eq1andEMAB0eq0andEMAWB1eq0andEMAWB0eq1 = 
         (!STOVB) && (!EMAB[2]) && (EMAB[1]) && (!EMAB[0]) && (!EMAWB[1]) && (EMAWB[0]) && !(TENB ? CENB : TCENB);
  assign STOVBeq0andEMAB2eq0andEMAB1eq1andEMAB0eq0andEMAWB1eq1andEMAWB0eq0 = 
         (!STOVB) && (!EMAB[2]) && (EMAB[1]) && (!EMAB[0]) && (EMAWB[1]) && (!EMAWB[0]) && !(TENB ? CENB : TCENB);
  assign STOVBeq0andEMAB2eq0andEMAB1eq1andEMAB0eq0andEMAWB1eq1andEMAWB0eq1 = 
         (!STOVB) && (!EMAB[2]) && (EMAB[1]) && (!EMAB[0]) && (EMAWB[1]) && (EMAWB[0]) && !(TENB ? CENB : TCENB);
  assign STOVBeq0andEMAB2eq0andEMAB1eq1andEMAB0eq1andEMAWB1eq0andEMAWB0eq0 = 
         (!STOVB) && (!EMAB[2]) && (EMAB[1]) && (EMAB[0]) && (!EMAWB[1]) && (!EMAWB[0]) && !(TENB ? CENB : TCENB);
  assign STOVBeq0andEMAB2eq0andEMAB1eq1andEMAB0eq1andEMAWB1eq0andEMAWB0eq1 = 
         (!STOVB) && (!EMAB[2]) && (EMAB[1]) && (EMAB[0]) && (!EMAWB[1]) && (EMAWB[0]) && !(TENB ? CENB : TCENB);
  assign STOVBeq0andEMAB2eq0andEMAB1eq1andEMAB0eq1andEMAWB1eq1andEMAWB0eq0 = 
         (!STOVB) && (!EMAB[2]) && (EMAB[1]) && (EMAB[0]) && (EMAWB[1]) && (!EMAWB[0]) && !(TENB ? CENB : TCENB);
  assign STOVBeq0andEMAB2eq0andEMAB1eq1andEMAB0eq1andEMAWB1eq1andEMAWB0eq1 = 
         (!STOVB) && (!EMAB[2]) && (EMAB[1]) && (EMAB[0]) && (EMAWB[1]) && (EMAWB[0]) && !(TENB ? CENB : TCENB);
  assign STOVBeq0andEMAB2eq1andEMAB1eq0andEMAB0eq0andEMAWB1eq0andEMAWB0eq0 = 
         (!STOVB) && (EMAB[2]) && (!EMAB[1]) && (!EMAB[0]) && (!EMAWB[1]) && (!EMAWB[0]) && !(TENB ? CENB : TCENB);
  assign STOVBeq0andEMAB2eq1andEMAB1eq0andEMAB0eq0andEMAWB1eq0andEMAWB0eq1 = 
         (!STOVB) && (EMAB[2]) && (!EMAB[1]) && (!EMAB[0]) && (!EMAWB[1]) && (EMAWB[0]) && !(TENB ? CENB : TCENB);
  assign STOVBeq0andEMAB2eq1andEMAB1eq0andEMAB0eq0andEMAWB1eq1andEMAWB0eq0 = 
         (!STOVB) && (EMAB[2]) && (!EMAB[1]) && (!EMAB[0]) && (EMAWB[1]) && (!EMAWB[0]) && !(TENB ? CENB : TCENB);
  assign STOVBeq0andEMAB2eq1andEMAB1eq0andEMAB0eq0andEMAWB1eq1andEMAWB0eq1 = 
         (!STOVB) && (EMAB[2]) && (!EMAB[1]) && (!EMAB[0]) && (EMAWB[1]) && (EMAWB[0]) && !(TENB ? CENB : TCENB);
  assign STOVBeq0andEMAB2eq1andEMAB1eq0andEMAB0eq1andEMAWB1eq0andEMAWB0eq0 = 
         (!STOVB) && (EMAB[2]) && (!EMAB[1]) && (EMAB[0]) && (!EMAWB[1]) && (!EMAWB[0]) && !(TENB ? CENB : TCENB);
  assign STOVBeq0andEMAB2eq1andEMAB1eq0andEMAB0eq1andEMAWB1eq0andEMAWB0eq1 = 
         (!STOVB) && (EMAB[2]) && (!EMAB[1]) && (EMAB[0]) && (!EMAWB[1]) && (EMAWB[0]) && !(TENB ? CENB : TCENB);
  assign STOVBeq0andEMAB2eq1andEMAB1eq0andEMAB0eq1andEMAWB1eq1andEMAWB0eq0 = 
         (!STOVB) && (EMAB[2]) && (!EMAB[1]) && (EMAB[0]) && (EMAWB[1]) && (!EMAWB[0]) && !(TENB ? CENB : TCENB);
  assign STOVBeq0andEMAB2eq1andEMAB1eq0andEMAB0eq1andEMAWB1eq1andEMAWB0eq1 = 
         (!STOVB) && (EMAB[2]) && (!EMAB[1]) && (EMAB[0]) && (EMAWB[1]) && (EMAWB[0]) && !(TENB ? CENB : TCENB);
  assign STOVBeq0andEMAB2eq1andEMAB1eq1andEMAB0eq0andEMAWB1eq0andEMAWB0eq0 = 
         (!STOVB) && (EMAB[2]) && (EMAB[1]) && (!EMAB[0]) && (!EMAWB[1]) && (!EMAWB[0]) && !(TENB ? CENB : TCENB);
  assign STOVBeq0andEMAB2eq1andEMAB1eq1andEMAB0eq0andEMAWB1eq0andEMAWB0eq1 = 
         (!STOVB) && (EMAB[2]) && (EMAB[1]) && (!EMAB[0]) && (!EMAWB[1]) && (EMAWB[0]) && !(TENB ? CENB : TCENB);
  assign STOVBeq0andEMAB2eq1andEMAB1eq1andEMAB0eq0andEMAWB1eq1andEMAWB0eq0 = 
         (!STOVB) && (EMAB[2]) && (EMAB[1]) && (!EMAB[0]) && (EMAWB[1]) && (!EMAWB[0]) && !(TENB ? CENB : TCENB);
  assign STOVBeq0andEMAB2eq1andEMAB1eq1andEMAB0eq0andEMAWB1eq1andEMAWB0eq1 = 
         (!STOVB) && (EMAB[2]) && (EMAB[1]) && (!EMAB[0]) && (EMAWB[1]) && (EMAWB[0]) && !(TENB ? CENB : TCENB);
  assign STOVBeq0andEMAB2eq1andEMAB1eq1andEMAB0eq1andEMAWB1eq0andEMAWB0eq0 = 
         (!STOVB) && (EMAB[2]) && (EMAB[1]) && (EMAB[0]) && (!EMAWB[1]) && (!EMAWB[0]) && !(TENB ? CENB : TCENB);
  assign STOVBeq0andEMAB2eq1andEMAB1eq1andEMAB0eq1andEMAWB1eq0andEMAWB0eq1 = 
         (!STOVB) && (EMAB[2]) && (EMAB[1]) && (EMAB[0]) && (!EMAWB[1]) && (EMAWB[0]) && !(TENB ? CENB : TCENB);
  assign STOVBeq0andEMAB2eq1andEMAB1eq1andEMAB0eq1andEMAWB1eq1andEMAWB0eq0 = 
         (!STOVB) && (EMAB[2]) && (EMAB[1]) && (EMAB[0]) && (EMAWB[1]) && (!EMAWB[0]) && !(TENB ? CENB : TCENB);
  assign STOVBeq0andEMAB2eq1andEMAB1eq1andEMAB0eq1andEMAWB1eq1andEMAWB0eq1 = 
         (!STOVB) && (EMAB[2]) && (EMAB[1]) && (EMAB[0]) && (EMAWB[1]) && (EMAWB[0]) && !(TENB ? CENB : TCENB);
  assign TENBeq1andCENBeq0 = 
         !(!TENB ||  CENB);
  assign TENAeq0andTCENAeq0 = 
         !(TENA || TCENA);
  assign TENBeq0andTCENBeq0 = 
         !(TENB ||  TCENB);
  assign opopTENAeq1andCENAeq0cporopTENAeq0andTCENAeq0cpcpandopopTENBeq1andCENBeq0cporopTENBeq0andTCENBeq0cpcp = 
         ((TENA ? CENA : TCENA) && (TENB ? CENB : TCENB));
  assign opTENAeq1andCENAeq0cporopTENAeq0andTCENAeq0cp = 
         !(TENA ? CENA : TCENA);
  assign opTENBeq1andCENBeq0cporopTENBeq0andTCENBeq0cp = 
         !(TENB ? CENB : TCENB);

  assign STOVAeq0 = (!STOVA) && !(TENA ? CENA : TCENA);
  assign TENAeq1 = TENA;
  assign STOVBeq0 = (!STOVB) && !(TENB ? CENB : TCENB);
  assign STOVBeq1 = (STOVB) && !(TENB ? CENB : TCENB);
  assign TENBeq1 = TENB;
  assign TENAeq0 = !TENA;
  assign TENBeq0 = !TENB;

  specify
    if (CENA == 1'b0 && TCENA == 1'b1)
       (TENA => CENYA) = (1.000, 1.000);
    if (CENA == 1'b1 && TCENA == 1'b0)
       (TENA => CENYA) = (1.000, 1.000);
    if (TENA == 1'b1)
       (CENA => CENYA) = (1.000, 1.000);
    if (TENA == 1'b0)
       (TCENA => CENYA) = (1.000, 1.000);
    if (AA[8] == 1'b0 && TAA[8] == 1'b1)
       (TENA => AYA[8]) = (1.000, 1.000);
    if (AA[8] == 1'b1 && TAA[8] == 1'b0)
       (TENA => AYA[8]) = (1.000, 1.000);
    if (AA[7] == 1'b0 && TAA[7] == 1'b1)
       (TENA => AYA[7]) = (1.000, 1.000);
    if (AA[7] == 1'b1 && TAA[7] == 1'b0)
       (TENA => AYA[7]) = (1.000, 1.000);
    if (AA[6] == 1'b0 && TAA[6] == 1'b1)
       (TENA => AYA[6]) = (1.000, 1.000);
    if (AA[6] == 1'b1 && TAA[6] == 1'b0)
       (TENA => AYA[6]) = (1.000, 1.000);
    if (AA[5] == 1'b0 && TAA[5] == 1'b1)
       (TENA => AYA[5]) = (1.000, 1.000);
    if (AA[5] == 1'b1 && TAA[5] == 1'b0)
       (TENA => AYA[5]) = (1.000, 1.000);
    if (AA[4] == 1'b0 && TAA[4] == 1'b1)
       (TENA => AYA[4]) = (1.000, 1.000);
    if (AA[4] == 1'b1 && TAA[4] == 1'b0)
       (TENA => AYA[4]) = (1.000, 1.000);
    if (AA[3] == 1'b0 && TAA[3] == 1'b1)
       (TENA => AYA[3]) = (1.000, 1.000);
    if (AA[3] == 1'b1 && TAA[3] == 1'b0)
       (TENA => AYA[3]) = (1.000, 1.000);
    if (AA[2] == 1'b0 && TAA[2] == 1'b1)
       (TENA => AYA[2]) = (1.000, 1.000);
    if (AA[2] == 1'b1 && TAA[2] == 1'b0)
       (TENA => AYA[2]) = (1.000, 1.000);
    if (AA[1] == 1'b0 && TAA[1] == 1'b1)
       (TENA => AYA[1]) = (1.000, 1.000);
    if (AA[1] == 1'b1 && TAA[1] == 1'b0)
       (TENA => AYA[1]) = (1.000, 1.000);
    if (AA[0] == 1'b0 && TAA[0] == 1'b1)
       (TENA => AYA[0]) = (1.000, 1.000);
    if (AA[0] == 1'b1 && TAA[0] == 1'b0)
       (TENA => AYA[0]) = (1.000, 1.000);
    if (TENA == 1'b1)
       (AA[8] => AYA[8]) = (1.000, 1.000);
    if (TENA == 1'b1)
       (AA[7] => AYA[7]) = (1.000, 1.000);
    if (TENA == 1'b1)
       (AA[6] => AYA[6]) = (1.000, 1.000);
    if (TENA == 1'b1)
       (AA[5] => AYA[5]) = (1.000, 1.000);
    if (TENA == 1'b1)
       (AA[4] => AYA[4]) = (1.000, 1.000);
    if (TENA == 1'b1)
       (AA[3] => AYA[3]) = (1.000, 1.000);
    if (TENA == 1'b1)
       (AA[2] => AYA[2]) = (1.000, 1.000);
    if (TENA == 1'b1)
       (AA[1] => AYA[1]) = (1.000, 1.000);
    if (TENA == 1'b1)
       (AA[0] => AYA[0]) = (1.000, 1.000);
    if (TENA == 1'b0)
       (TAA[8] => AYA[8]) = (1.000, 1.000);
    if (TENA == 1'b0)
       (TAA[7] => AYA[7]) = (1.000, 1.000);
    if (TENA == 1'b0)
       (TAA[6] => AYA[6]) = (1.000, 1.000);
    if (TENA == 1'b0)
       (TAA[5] => AYA[5]) = (1.000, 1.000);
    if (TENA == 1'b0)
       (TAA[4] => AYA[4]) = (1.000, 1.000);
    if (TENA == 1'b0)
       (TAA[3] => AYA[3]) = (1.000, 1.000);
    if (TENA == 1'b0)
       (TAA[2] => AYA[2]) = (1.000, 1.000);
    if (TENA == 1'b0)
       (TAA[1] => AYA[1]) = (1.000, 1.000);
    if (TENA == 1'b0)
       (TAA[0] => AYA[0]) = (1.000, 1.000);
    if (CENB == 1'b0 && TCENB == 1'b1)
       (TENB => CENYB) = (1.000, 1.000);
    if (CENB == 1'b1 && TCENB == 1'b0)
       (TENB => CENYB) = (1.000, 1.000);
    if (TENB == 1'b1)
       (CENB => CENYB) = (1.000, 1.000);
    if (TENB == 1'b0)
       (TCENB => CENYB) = (1.000, 1.000);
    if (AB[8] == 1'b0 && TAB[8] == 1'b1)
       (TENB => AYB[8]) = (1.000, 1.000);
    if (AB[8] == 1'b1 && TAB[8] == 1'b0)
       (TENB => AYB[8]) = (1.000, 1.000);
    if (AB[7] == 1'b0 && TAB[7] == 1'b1)
       (TENB => AYB[7]) = (1.000, 1.000);
    if (AB[7] == 1'b1 && TAB[7] == 1'b0)
       (TENB => AYB[7]) = (1.000, 1.000);
    if (AB[6] == 1'b0 && TAB[6] == 1'b1)
       (TENB => AYB[6]) = (1.000, 1.000);
    if (AB[6] == 1'b1 && TAB[6] == 1'b0)
       (TENB => AYB[6]) = (1.000, 1.000);
    if (AB[5] == 1'b0 && TAB[5] == 1'b1)
       (TENB => AYB[5]) = (1.000, 1.000);
    if (AB[5] == 1'b1 && TAB[5] == 1'b0)
       (TENB => AYB[5]) = (1.000, 1.000);
    if (AB[4] == 1'b0 && TAB[4] == 1'b1)
       (TENB => AYB[4]) = (1.000, 1.000);
    if (AB[4] == 1'b1 && TAB[4] == 1'b0)
       (TENB => AYB[4]) = (1.000, 1.000);
    if (AB[3] == 1'b0 && TAB[3] == 1'b1)
       (TENB => AYB[3]) = (1.000, 1.000);
    if (AB[3] == 1'b1 && TAB[3] == 1'b0)
       (TENB => AYB[3]) = (1.000, 1.000);
    if (AB[2] == 1'b0 && TAB[2] == 1'b1)
       (TENB => AYB[2]) = (1.000, 1.000);
    if (AB[2] == 1'b1 && TAB[2] == 1'b0)
       (TENB => AYB[2]) = (1.000, 1.000);
    if (AB[1] == 1'b0 && TAB[1] == 1'b1)
       (TENB => AYB[1]) = (1.000, 1.000);
    if (AB[1] == 1'b1 && TAB[1] == 1'b0)
       (TENB => AYB[1]) = (1.000, 1.000);
    if (AB[0] == 1'b0 && TAB[0] == 1'b1)
       (TENB => AYB[0]) = (1.000, 1.000);
    if (AB[0] == 1'b1 && TAB[0] == 1'b0)
       (TENB => AYB[0]) = (1.000, 1.000);
    if (TENB == 1'b1)
       (AB[8] => AYB[8]) = (1.000, 1.000);
    if (TENB == 1'b1)
       (AB[7] => AYB[7]) = (1.000, 1.000);
    if (TENB == 1'b1)
       (AB[6] => AYB[6]) = (1.000, 1.000);
    if (TENB == 1'b1)
       (AB[5] => AYB[5]) = (1.000, 1.000);
    if (TENB == 1'b1)
       (AB[4] => AYB[4]) = (1.000, 1.000);
    if (TENB == 1'b1)
       (AB[3] => AYB[3]) = (1.000, 1.000);
    if (TENB == 1'b1)
       (AB[2] => AYB[2]) = (1.000, 1.000);
    if (TENB == 1'b1)
       (AB[1] => AYB[1]) = (1.000, 1.000);
    if (TENB == 1'b1)
       (AB[0] => AYB[0]) = (1.000, 1.000);
    if (TENB == 1'b0)
       (TAB[8] => AYB[8]) = (1.000, 1.000);
    if (TENB == 1'b0)
       (TAB[7] => AYB[7]) = (1.000, 1.000);
    if (TENB == 1'b0)
       (TAB[6] => AYB[6]) = (1.000, 1.000);
    if (TENB == 1'b0)
       (TAB[5] => AYB[5]) = (1.000, 1.000);
    if (TENB == 1'b0)
       (TAB[4] => AYB[4]) = (1.000, 1.000);
    if (TENB == 1'b0)
       (TAB[3] => AYB[3]) = (1.000, 1.000);
    if (TENB == 1'b0)
       (TAB[2] => AYB[2]) = (1.000, 1.000);
    if (TENB == 1'b0)
       (TAB[1] => AYB[1]) = (1.000, 1.000);
    if (TENB == 1'b0)
       (TAB[0] => AYB[0]) = (1.000, 1.000);
    if (DB[123] == 1'b0 && TDB[123] == 1'b1)
       (TENB => DYB[123]) = (1.000, 1.000);
    if (DB[123] == 1'b1 && TDB[123] == 1'b0)
       (TENB => DYB[123]) = (1.000, 1.000);
    if (DB[122] == 1'b0 && TDB[122] == 1'b1)
       (TENB => DYB[122]) = (1.000, 1.000);
    if (DB[122] == 1'b1 && TDB[122] == 1'b0)
       (TENB => DYB[122]) = (1.000, 1.000);
    if (DB[121] == 1'b0 && TDB[121] == 1'b1)
       (TENB => DYB[121]) = (1.000, 1.000);
    if (DB[121] == 1'b1 && TDB[121] == 1'b0)
       (TENB => DYB[121]) = (1.000, 1.000);
    if (DB[120] == 1'b0 && TDB[120] == 1'b1)
       (TENB => DYB[120]) = (1.000, 1.000);
    if (DB[120] == 1'b1 && TDB[120] == 1'b0)
       (TENB => DYB[120]) = (1.000, 1.000);
    if (DB[119] == 1'b0 && TDB[119] == 1'b1)
       (TENB => DYB[119]) = (1.000, 1.000);
    if (DB[119] == 1'b1 && TDB[119] == 1'b0)
       (TENB => DYB[119]) = (1.000, 1.000);
    if (DB[118] == 1'b0 && TDB[118] == 1'b1)
       (TENB => DYB[118]) = (1.000, 1.000);
    if (DB[118] == 1'b1 && TDB[118] == 1'b0)
       (TENB => DYB[118]) = (1.000, 1.000);
    if (DB[117] == 1'b0 && TDB[117] == 1'b1)
       (TENB => DYB[117]) = (1.000, 1.000);
    if (DB[117] == 1'b1 && TDB[117] == 1'b0)
       (TENB => DYB[117]) = (1.000, 1.000);
    if (DB[116] == 1'b0 && TDB[116] == 1'b1)
       (TENB => DYB[116]) = (1.000, 1.000);
    if (DB[116] == 1'b1 && TDB[116] == 1'b0)
       (TENB => DYB[116]) = (1.000, 1.000);
    if (DB[115] == 1'b0 && TDB[115] == 1'b1)
       (TENB => DYB[115]) = (1.000, 1.000);
    if (DB[115] == 1'b1 && TDB[115] == 1'b0)
       (TENB => DYB[115]) = (1.000, 1.000);
    if (DB[114] == 1'b0 && TDB[114] == 1'b1)
       (TENB => DYB[114]) = (1.000, 1.000);
    if (DB[114] == 1'b1 && TDB[114] == 1'b0)
       (TENB => DYB[114]) = (1.000, 1.000);
    if (DB[113] == 1'b0 && TDB[113] == 1'b1)
       (TENB => DYB[113]) = (1.000, 1.000);
    if (DB[113] == 1'b1 && TDB[113] == 1'b0)
       (TENB => DYB[113]) = (1.000, 1.000);
    if (DB[112] == 1'b0 && TDB[112] == 1'b1)
       (TENB => DYB[112]) = (1.000, 1.000);
    if (DB[112] == 1'b1 && TDB[112] == 1'b0)
       (TENB => DYB[112]) = (1.000, 1.000);
    if (DB[111] == 1'b0 && TDB[111] == 1'b1)
       (TENB => DYB[111]) = (1.000, 1.000);
    if (DB[111] == 1'b1 && TDB[111] == 1'b0)
       (TENB => DYB[111]) = (1.000, 1.000);
    if (DB[110] == 1'b0 && TDB[110] == 1'b1)
       (TENB => DYB[110]) = (1.000, 1.000);
    if (DB[110] == 1'b1 && TDB[110] == 1'b0)
       (TENB => DYB[110]) = (1.000, 1.000);
    if (DB[109] == 1'b0 && TDB[109] == 1'b1)
       (TENB => DYB[109]) = (1.000, 1.000);
    if (DB[109] == 1'b1 && TDB[109] == 1'b0)
       (TENB => DYB[109]) = (1.000, 1.000);
    if (DB[108] == 1'b0 && TDB[108] == 1'b1)
       (TENB => DYB[108]) = (1.000, 1.000);
    if (DB[108] == 1'b1 && TDB[108] == 1'b0)
       (TENB => DYB[108]) = (1.000, 1.000);
    if (DB[107] == 1'b0 && TDB[107] == 1'b1)
       (TENB => DYB[107]) = (1.000, 1.000);
    if (DB[107] == 1'b1 && TDB[107] == 1'b0)
       (TENB => DYB[107]) = (1.000, 1.000);
    if (DB[106] == 1'b0 && TDB[106] == 1'b1)
       (TENB => DYB[106]) = (1.000, 1.000);
    if (DB[106] == 1'b1 && TDB[106] == 1'b0)
       (TENB => DYB[106]) = (1.000, 1.000);
    if (DB[105] == 1'b0 && TDB[105] == 1'b1)
       (TENB => DYB[105]) = (1.000, 1.000);
    if (DB[105] == 1'b1 && TDB[105] == 1'b0)
       (TENB => DYB[105]) = (1.000, 1.000);
    if (DB[104] == 1'b0 && TDB[104] == 1'b1)
       (TENB => DYB[104]) = (1.000, 1.000);
    if (DB[104] == 1'b1 && TDB[104] == 1'b0)
       (TENB => DYB[104]) = (1.000, 1.000);
    if (DB[103] == 1'b0 && TDB[103] == 1'b1)
       (TENB => DYB[103]) = (1.000, 1.000);
    if (DB[103] == 1'b1 && TDB[103] == 1'b0)
       (TENB => DYB[103]) = (1.000, 1.000);
    if (DB[102] == 1'b0 && TDB[102] == 1'b1)
       (TENB => DYB[102]) = (1.000, 1.000);
    if (DB[102] == 1'b1 && TDB[102] == 1'b0)
       (TENB => DYB[102]) = (1.000, 1.000);
    if (DB[101] == 1'b0 && TDB[101] == 1'b1)
       (TENB => DYB[101]) = (1.000, 1.000);
    if (DB[101] == 1'b1 && TDB[101] == 1'b0)
       (TENB => DYB[101]) = (1.000, 1.000);
    if (DB[100] == 1'b0 && TDB[100] == 1'b1)
       (TENB => DYB[100]) = (1.000, 1.000);
    if (DB[100] == 1'b1 && TDB[100] == 1'b0)
       (TENB => DYB[100]) = (1.000, 1.000);
    if (DB[99] == 1'b0 && TDB[99] == 1'b1)
       (TENB => DYB[99]) = (1.000, 1.000);
    if (DB[99] == 1'b1 && TDB[99] == 1'b0)
       (TENB => DYB[99]) = (1.000, 1.000);
    if (DB[98] == 1'b0 && TDB[98] == 1'b1)
       (TENB => DYB[98]) = (1.000, 1.000);
    if (DB[98] == 1'b1 && TDB[98] == 1'b0)
       (TENB => DYB[98]) = (1.000, 1.000);
    if (DB[97] == 1'b0 && TDB[97] == 1'b1)
       (TENB => DYB[97]) = (1.000, 1.000);
    if (DB[97] == 1'b1 && TDB[97] == 1'b0)
       (TENB => DYB[97]) = (1.000, 1.000);
    if (DB[96] == 1'b0 && TDB[96] == 1'b1)
       (TENB => DYB[96]) = (1.000, 1.000);
    if (DB[96] == 1'b1 && TDB[96] == 1'b0)
       (TENB => DYB[96]) = (1.000, 1.000);
    if (DB[95] == 1'b0 && TDB[95] == 1'b1)
       (TENB => DYB[95]) = (1.000, 1.000);
    if (DB[95] == 1'b1 && TDB[95] == 1'b0)
       (TENB => DYB[95]) = (1.000, 1.000);
    if (DB[94] == 1'b0 && TDB[94] == 1'b1)
       (TENB => DYB[94]) = (1.000, 1.000);
    if (DB[94] == 1'b1 && TDB[94] == 1'b0)
       (TENB => DYB[94]) = (1.000, 1.000);
    if (DB[93] == 1'b0 && TDB[93] == 1'b1)
       (TENB => DYB[93]) = (1.000, 1.000);
    if (DB[93] == 1'b1 && TDB[93] == 1'b0)
       (TENB => DYB[93]) = (1.000, 1.000);
    if (DB[92] == 1'b0 && TDB[92] == 1'b1)
       (TENB => DYB[92]) = (1.000, 1.000);
    if (DB[92] == 1'b1 && TDB[92] == 1'b0)
       (TENB => DYB[92]) = (1.000, 1.000);
    if (DB[91] == 1'b0 && TDB[91] == 1'b1)
       (TENB => DYB[91]) = (1.000, 1.000);
    if (DB[91] == 1'b1 && TDB[91] == 1'b0)
       (TENB => DYB[91]) = (1.000, 1.000);
    if (DB[90] == 1'b0 && TDB[90] == 1'b1)
       (TENB => DYB[90]) = (1.000, 1.000);
    if (DB[90] == 1'b1 && TDB[90] == 1'b0)
       (TENB => DYB[90]) = (1.000, 1.000);
    if (DB[89] == 1'b0 && TDB[89] == 1'b1)
       (TENB => DYB[89]) = (1.000, 1.000);
    if (DB[89] == 1'b1 && TDB[89] == 1'b0)
       (TENB => DYB[89]) = (1.000, 1.000);
    if (DB[88] == 1'b0 && TDB[88] == 1'b1)
       (TENB => DYB[88]) = (1.000, 1.000);
    if (DB[88] == 1'b1 && TDB[88] == 1'b0)
       (TENB => DYB[88]) = (1.000, 1.000);
    if (DB[87] == 1'b0 && TDB[87] == 1'b1)
       (TENB => DYB[87]) = (1.000, 1.000);
    if (DB[87] == 1'b1 && TDB[87] == 1'b0)
       (TENB => DYB[87]) = (1.000, 1.000);
    if (DB[86] == 1'b0 && TDB[86] == 1'b1)
       (TENB => DYB[86]) = (1.000, 1.000);
    if (DB[86] == 1'b1 && TDB[86] == 1'b0)
       (TENB => DYB[86]) = (1.000, 1.000);
    if (DB[85] == 1'b0 && TDB[85] == 1'b1)
       (TENB => DYB[85]) = (1.000, 1.000);
    if (DB[85] == 1'b1 && TDB[85] == 1'b0)
       (TENB => DYB[85]) = (1.000, 1.000);
    if (DB[84] == 1'b0 && TDB[84] == 1'b1)
       (TENB => DYB[84]) = (1.000, 1.000);
    if (DB[84] == 1'b1 && TDB[84] == 1'b0)
       (TENB => DYB[84]) = (1.000, 1.000);
    if (DB[83] == 1'b0 && TDB[83] == 1'b1)
       (TENB => DYB[83]) = (1.000, 1.000);
    if (DB[83] == 1'b1 && TDB[83] == 1'b0)
       (TENB => DYB[83]) = (1.000, 1.000);
    if (DB[82] == 1'b0 && TDB[82] == 1'b1)
       (TENB => DYB[82]) = (1.000, 1.000);
    if (DB[82] == 1'b1 && TDB[82] == 1'b0)
       (TENB => DYB[82]) = (1.000, 1.000);
    if (DB[81] == 1'b0 && TDB[81] == 1'b1)
       (TENB => DYB[81]) = (1.000, 1.000);
    if (DB[81] == 1'b1 && TDB[81] == 1'b0)
       (TENB => DYB[81]) = (1.000, 1.000);
    if (DB[80] == 1'b0 && TDB[80] == 1'b1)
       (TENB => DYB[80]) = (1.000, 1.000);
    if (DB[80] == 1'b1 && TDB[80] == 1'b0)
       (TENB => DYB[80]) = (1.000, 1.000);
    if (DB[79] == 1'b0 && TDB[79] == 1'b1)
       (TENB => DYB[79]) = (1.000, 1.000);
    if (DB[79] == 1'b1 && TDB[79] == 1'b0)
       (TENB => DYB[79]) = (1.000, 1.000);
    if (DB[78] == 1'b0 && TDB[78] == 1'b1)
       (TENB => DYB[78]) = (1.000, 1.000);
    if (DB[78] == 1'b1 && TDB[78] == 1'b0)
       (TENB => DYB[78]) = (1.000, 1.000);
    if (DB[77] == 1'b0 && TDB[77] == 1'b1)
       (TENB => DYB[77]) = (1.000, 1.000);
    if (DB[77] == 1'b1 && TDB[77] == 1'b0)
       (TENB => DYB[77]) = (1.000, 1.000);
    if (DB[76] == 1'b0 && TDB[76] == 1'b1)
       (TENB => DYB[76]) = (1.000, 1.000);
    if (DB[76] == 1'b1 && TDB[76] == 1'b0)
       (TENB => DYB[76]) = (1.000, 1.000);
    if (DB[75] == 1'b0 && TDB[75] == 1'b1)
       (TENB => DYB[75]) = (1.000, 1.000);
    if (DB[75] == 1'b1 && TDB[75] == 1'b0)
       (TENB => DYB[75]) = (1.000, 1.000);
    if (DB[74] == 1'b0 && TDB[74] == 1'b1)
       (TENB => DYB[74]) = (1.000, 1.000);
    if (DB[74] == 1'b1 && TDB[74] == 1'b0)
       (TENB => DYB[74]) = (1.000, 1.000);
    if (DB[73] == 1'b0 && TDB[73] == 1'b1)
       (TENB => DYB[73]) = (1.000, 1.000);
    if (DB[73] == 1'b1 && TDB[73] == 1'b0)
       (TENB => DYB[73]) = (1.000, 1.000);
    if (DB[72] == 1'b0 && TDB[72] == 1'b1)
       (TENB => DYB[72]) = (1.000, 1.000);
    if (DB[72] == 1'b1 && TDB[72] == 1'b0)
       (TENB => DYB[72]) = (1.000, 1.000);
    if (DB[71] == 1'b0 && TDB[71] == 1'b1)
       (TENB => DYB[71]) = (1.000, 1.000);
    if (DB[71] == 1'b1 && TDB[71] == 1'b0)
       (TENB => DYB[71]) = (1.000, 1.000);
    if (DB[70] == 1'b0 && TDB[70] == 1'b1)
       (TENB => DYB[70]) = (1.000, 1.000);
    if (DB[70] == 1'b1 && TDB[70] == 1'b0)
       (TENB => DYB[70]) = (1.000, 1.000);
    if (DB[69] == 1'b0 && TDB[69] == 1'b1)
       (TENB => DYB[69]) = (1.000, 1.000);
    if (DB[69] == 1'b1 && TDB[69] == 1'b0)
       (TENB => DYB[69]) = (1.000, 1.000);
    if (DB[68] == 1'b0 && TDB[68] == 1'b1)
       (TENB => DYB[68]) = (1.000, 1.000);
    if (DB[68] == 1'b1 && TDB[68] == 1'b0)
       (TENB => DYB[68]) = (1.000, 1.000);
    if (DB[67] == 1'b0 && TDB[67] == 1'b1)
       (TENB => DYB[67]) = (1.000, 1.000);
    if (DB[67] == 1'b1 && TDB[67] == 1'b0)
       (TENB => DYB[67]) = (1.000, 1.000);
    if (DB[66] == 1'b0 && TDB[66] == 1'b1)
       (TENB => DYB[66]) = (1.000, 1.000);
    if (DB[66] == 1'b1 && TDB[66] == 1'b0)
       (TENB => DYB[66]) = (1.000, 1.000);
    if (DB[65] == 1'b0 && TDB[65] == 1'b1)
       (TENB => DYB[65]) = (1.000, 1.000);
    if (DB[65] == 1'b1 && TDB[65] == 1'b0)
       (TENB => DYB[65]) = (1.000, 1.000);
    if (DB[64] == 1'b0 && TDB[64] == 1'b1)
       (TENB => DYB[64]) = (1.000, 1.000);
    if (DB[64] == 1'b1 && TDB[64] == 1'b0)
       (TENB => DYB[64]) = (1.000, 1.000);
    if (DB[63] == 1'b0 && TDB[63] == 1'b1)
       (TENB => DYB[63]) = (1.000, 1.000);
    if (DB[63] == 1'b1 && TDB[63] == 1'b0)
       (TENB => DYB[63]) = (1.000, 1.000);
    if (DB[62] == 1'b0 && TDB[62] == 1'b1)
       (TENB => DYB[62]) = (1.000, 1.000);
    if (DB[62] == 1'b1 && TDB[62] == 1'b0)
       (TENB => DYB[62]) = (1.000, 1.000);
    if (DB[61] == 1'b0 && TDB[61] == 1'b1)
       (TENB => DYB[61]) = (1.000, 1.000);
    if (DB[61] == 1'b1 && TDB[61] == 1'b0)
       (TENB => DYB[61]) = (1.000, 1.000);
    if (DB[60] == 1'b0 && TDB[60] == 1'b1)
       (TENB => DYB[60]) = (1.000, 1.000);
    if (DB[60] == 1'b1 && TDB[60] == 1'b0)
       (TENB => DYB[60]) = (1.000, 1.000);
    if (DB[59] == 1'b0 && TDB[59] == 1'b1)
       (TENB => DYB[59]) = (1.000, 1.000);
    if (DB[59] == 1'b1 && TDB[59] == 1'b0)
       (TENB => DYB[59]) = (1.000, 1.000);
    if (DB[58] == 1'b0 && TDB[58] == 1'b1)
       (TENB => DYB[58]) = (1.000, 1.000);
    if (DB[58] == 1'b1 && TDB[58] == 1'b0)
       (TENB => DYB[58]) = (1.000, 1.000);
    if (DB[57] == 1'b0 && TDB[57] == 1'b1)
       (TENB => DYB[57]) = (1.000, 1.000);
    if (DB[57] == 1'b1 && TDB[57] == 1'b0)
       (TENB => DYB[57]) = (1.000, 1.000);
    if (DB[56] == 1'b0 && TDB[56] == 1'b1)
       (TENB => DYB[56]) = (1.000, 1.000);
    if (DB[56] == 1'b1 && TDB[56] == 1'b0)
       (TENB => DYB[56]) = (1.000, 1.000);
    if (DB[55] == 1'b0 && TDB[55] == 1'b1)
       (TENB => DYB[55]) = (1.000, 1.000);
    if (DB[55] == 1'b1 && TDB[55] == 1'b0)
       (TENB => DYB[55]) = (1.000, 1.000);
    if (DB[54] == 1'b0 && TDB[54] == 1'b1)
       (TENB => DYB[54]) = (1.000, 1.000);
    if (DB[54] == 1'b1 && TDB[54] == 1'b0)
       (TENB => DYB[54]) = (1.000, 1.000);
    if (DB[53] == 1'b0 && TDB[53] == 1'b1)
       (TENB => DYB[53]) = (1.000, 1.000);
    if (DB[53] == 1'b1 && TDB[53] == 1'b0)
       (TENB => DYB[53]) = (1.000, 1.000);
    if (DB[52] == 1'b0 && TDB[52] == 1'b1)
       (TENB => DYB[52]) = (1.000, 1.000);
    if (DB[52] == 1'b1 && TDB[52] == 1'b0)
       (TENB => DYB[52]) = (1.000, 1.000);
    if (DB[51] == 1'b0 && TDB[51] == 1'b1)
       (TENB => DYB[51]) = (1.000, 1.000);
    if (DB[51] == 1'b1 && TDB[51] == 1'b0)
       (TENB => DYB[51]) = (1.000, 1.000);
    if (DB[50] == 1'b0 && TDB[50] == 1'b1)
       (TENB => DYB[50]) = (1.000, 1.000);
    if (DB[50] == 1'b1 && TDB[50] == 1'b0)
       (TENB => DYB[50]) = (1.000, 1.000);
    if (DB[49] == 1'b0 && TDB[49] == 1'b1)
       (TENB => DYB[49]) = (1.000, 1.000);
    if (DB[49] == 1'b1 && TDB[49] == 1'b0)
       (TENB => DYB[49]) = (1.000, 1.000);
    if (DB[48] == 1'b0 && TDB[48] == 1'b1)
       (TENB => DYB[48]) = (1.000, 1.000);
    if (DB[48] == 1'b1 && TDB[48] == 1'b0)
       (TENB => DYB[48]) = (1.000, 1.000);
    if (DB[47] == 1'b0 && TDB[47] == 1'b1)
       (TENB => DYB[47]) = (1.000, 1.000);
    if (DB[47] == 1'b1 && TDB[47] == 1'b0)
       (TENB => DYB[47]) = (1.000, 1.000);
    if (DB[46] == 1'b0 && TDB[46] == 1'b1)
       (TENB => DYB[46]) = (1.000, 1.000);
    if (DB[46] == 1'b1 && TDB[46] == 1'b0)
       (TENB => DYB[46]) = (1.000, 1.000);
    if (DB[45] == 1'b0 && TDB[45] == 1'b1)
       (TENB => DYB[45]) = (1.000, 1.000);
    if (DB[45] == 1'b1 && TDB[45] == 1'b0)
       (TENB => DYB[45]) = (1.000, 1.000);
    if (DB[44] == 1'b0 && TDB[44] == 1'b1)
       (TENB => DYB[44]) = (1.000, 1.000);
    if (DB[44] == 1'b1 && TDB[44] == 1'b0)
       (TENB => DYB[44]) = (1.000, 1.000);
    if (DB[43] == 1'b0 && TDB[43] == 1'b1)
       (TENB => DYB[43]) = (1.000, 1.000);
    if (DB[43] == 1'b1 && TDB[43] == 1'b0)
       (TENB => DYB[43]) = (1.000, 1.000);
    if (DB[42] == 1'b0 && TDB[42] == 1'b1)
       (TENB => DYB[42]) = (1.000, 1.000);
    if (DB[42] == 1'b1 && TDB[42] == 1'b0)
       (TENB => DYB[42]) = (1.000, 1.000);
    if (DB[41] == 1'b0 && TDB[41] == 1'b1)
       (TENB => DYB[41]) = (1.000, 1.000);
    if (DB[41] == 1'b1 && TDB[41] == 1'b0)
       (TENB => DYB[41]) = (1.000, 1.000);
    if (DB[40] == 1'b0 && TDB[40] == 1'b1)
       (TENB => DYB[40]) = (1.000, 1.000);
    if (DB[40] == 1'b1 && TDB[40] == 1'b0)
       (TENB => DYB[40]) = (1.000, 1.000);
    if (DB[39] == 1'b0 && TDB[39] == 1'b1)
       (TENB => DYB[39]) = (1.000, 1.000);
    if (DB[39] == 1'b1 && TDB[39] == 1'b0)
       (TENB => DYB[39]) = (1.000, 1.000);
    if (DB[38] == 1'b0 && TDB[38] == 1'b1)
       (TENB => DYB[38]) = (1.000, 1.000);
    if (DB[38] == 1'b1 && TDB[38] == 1'b0)
       (TENB => DYB[38]) = (1.000, 1.000);
    if (DB[37] == 1'b0 && TDB[37] == 1'b1)
       (TENB => DYB[37]) = (1.000, 1.000);
    if (DB[37] == 1'b1 && TDB[37] == 1'b0)
       (TENB => DYB[37]) = (1.000, 1.000);
    if (DB[36] == 1'b0 && TDB[36] == 1'b1)
       (TENB => DYB[36]) = (1.000, 1.000);
    if (DB[36] == 1'b1 && TDB[36] == 1'b0)
       (TENB => DYB[36]) = (1.000, 1.000);
    if (DB[35] == 1'b0 && TDB[35] == 1'b1)
       (TENB => DYB[35]) = (1.000, 1.000);
    if (DB[35] == 1'b1 && TDB[35] == 1'b0)
       (TENB => DYB[35]) = (1.000, 1.000);
    if (DB[34] == 1'b0 && TDB[34] == 1'b1)
       (TENB => DYB[34]) = (1.000, 1.000);
    if (DB[34] == 1'b1 && TDB[34] == 1'b0)
       (TENB => DYB[34]) = (1.000, 1.000);
    if (DB[33] == 1'b0 && TDB[33] == 1'b1)
       (TENB => DYB[33]) = (1.000, 1.000);
    if (DB[33] == 1'b1 && TDB[33] == 1'b0)
       (TENB => DYB[33]) = (1.000, 1.000);
    if (DB[32] == 1'b0 && TDB[32] == 1'b1)
       (TENB => DYB[32]) = (1.000, 1.000);
    if (DB[32] == 1'b1 && TDB[32] == 1'b0)
       (TENB => DYB[32]) = (1.000, 1.000);
    if (DB[31] == 1'b0 && TDB[31] == 1'b1)
       (TENB => DYB[31]) = (1.000, 1.000);
    if (DB[31] == 1'b1 && TDB[31] == 1'b0)
       (TENB => DYB[31]) = (1.000, 1.000);
    if (DB[30] == 1'b0 && TDB[30] == 1'b1)
       (TENB => DYB[30]) = (1.000, 1.000);
    if (DB[30] == 1'b1 && TDB[30] == 1'b0)
       (TENB => DYB[30]) = (1.000, 1.000);
    if (DB[29] == 1'b0 && TDB[29] == 1'b1)
       (TENB => DYB[29]) = (1.000, 1.000);
    if (DB[29] == 1'b1 && TDB[29] == 1'b0)
       (TENB => DYB[29]) = (1.000, 1.000);
    if (DB[28] == 1'b0 && TDB[28] == 1'b1)
       (TENB => DYB[28]) = (1.000, 1.000);
    if (DB[28] == 1'b1 && TDB[28] == 1'b0)
       (TENB => DYB[28]) = (1.000, 1.000);
    if (DB[27] == 1'b0 && TDB[27] == 1'b1)
       (TENB => DYB[27]) = (1.000, 1.000);
    if (DB[27] == 1'b1 && TDB[27] == 1'b0)
       (TENB => DYB[27]) = (1.000, 1.000);
    if (DB[26] == 1'b0 && TDB[26] == 1'b1)
       (TENB => DYB[26]) = (1.000, 1.000);
    if (DB[26] == 1'b1 && TDB[26] == 1'b0)
       (TENB => DYB[26]) = (1.000, 1.000);
    if (DB[25] == 1'b0 && TDB[25] == 1'b1)
       (TENB => DYB[25]) = (1.000, 1.000);
    if (DB[25] == 1'b1 && TDB[25] == 1'b0)
       (TENB => DYB[25]) = (1.000, 1.000);
    if (DB[24] == 1'b0 && TDB[24] == 1'b1)
       (TENB => DYB[24]) = (1.000, 1.000);
    if (DB[24] == 1'b1 && TDB[24] == 1'b0)
       (TENB => DYB[24]) = (1.000, 1.000);
    if (DB[23] == 1'b0 && TDB[23] == 1'b1)
       (TENB => DYB[23]) = (1.000, 1.000);
    if (DB[23] == 1'b1 && TDB[23] == 1'b0)
       (TENB => DYB[23]) = (1.000, 1.000);
    if (DB[22] == 1'b0 && TDB[22] == 1'b1)
       (TENB => DYB[22]) = (1.000, 1.000);
    if (DB[22] == 1'b1 && TDB[22] == 1'b0)
       (TENB => DYB[22]) = (1.000, 1.000);
    if (DB[21] == 1'b0 && TDB[21] == 1'b1)
       (TENB => DYB[21]) = (1.000, 1.000);
    if (DB[21] == 1'b1 && TDB[21] == 1'b0)
       (TENB => DYB[21]) = (1.000, 1.000);
    if (DB[20] == 1'b0 && TDB[20] == 1'b1)
       (TENB => DYB[20]) = (1.000, 1.000);
    if (DB[20] == 1'b1 && TDB[20] == 1'b0)
       (TENB => DYB[20]) = (1.000, 1.000);
    if (DB[19] == 1'b0 && TDB[19] == 1'b1)
       (TENB => DYB[19]) = (1.000, 1.000);
    if (DB[19] == 1'b1 && TDB[19] == 1'b0)
       (TENB => DYB[19]) = (1.000, 1.000);
    if (DB[18] == 1'b0 && TDB[18] == 1'b1)
       (TENB => DYB[18]) = (1.000, 1.000);
    if (DB[18] == 1'b1 && TDB[18] == 1'b0)
       (TENB => DYB[18]) = (1.000, 1.000);
    if (DB[17] == 1'b0 && TDB[17] == 1'b1)
       (TENB => DYB[17]) = (1.000, 1.000);
    if (DB[17] == 1'b1 && TDB[17] == 1'b0)
       (TENB => DYB[17]) = (1.000, 1.000);
    if (DB[16] == 1'b0 && TDB[16] == 1'b1)
       (TENB => DYB[16]) = (1.000, 1.000);
    if (DB[16] == 1'b1 && TDB[16] == 1'b0)
       (TENB => DYB[16]) = (1.000, 1.000);
    if (DB[15] == 1'b0 && TDB[15] == 1'b1)
       (TENB => DYB[15]) = (1.000, 1.000);
    if (DB[15] == 1'b1 && TDB[15] == 1'b0)
       (TENB => DYB[15]) = (1.000, 1.000);
    if (DB[14] == 1'b0 && TDB[14] == 1'b1)
       (TENB => DYB[14]) = (1.000, 1.000);
    if (DB[14] == 1'b1 && TDB[14] == 1'b0)
       (TENB => DYB[14]) = (1.000, 1.000);
    if (DB[13] == 1'b0 && TDB[13] == 1'b1)
       (TENB => DYB[13]) = (1.000, 1.000);
    if (DB[13] == 1'b1 && TDB[13] == 1'b0)
       (TENB => DYB[13]) = (1.000, 1.000);
    if (DB[12] == 1'b0 && TDB[12] == 1'b1)
       (TENB => DYB[12]) = (1.000, 1.000);
    if (DB[12] == 1'b1 && TDB[12] == 1'b0)
       (TENB => DYB[12]) = (1.000, 1.000);
    if (DB[11] == 1'b0 && TDB[11] == 1'b1)
       (TENB => DYB[11]) = (1.000, 1.000);
    if (DB[11] == 1'b1 && TDB[11] == 1'b0)
       (TENB => DYB[11]) = (1.000, 1.000);
    if (DB[10] == 1'b0 && TDB[10] == 1'b1)
       (TENB => DYB[10]) = (1.000, 1.000);
    if (DB[10] == 1'b1 && TDB[10] == 1'b0)
       (TENB => DYB[10]) = (1.000, 1.000);
    if (DB[9] == 1'b0 && TDB[9] == 1'b1)
       (TENB => DYB[9]) = (1.000, 1.000);
    if (DB[9] == 1'b1 && TDB[9] == 1'b0)
       (TENB => DYB[9]) = (1.000, 1.000);
    if (DB[8] == 1'b0 && TDB[8] == 1'b1)
       (TENB => DYB[8]) = (1.000, 1.000);
    if (DB[8] == 1'b1 && TDB[8] == 1'b0)
       (TENB => DYB[8]) = (1.000, 1.000);
    if (DB[7] == 1'b0 && TDB[7] == 1'b1)
       (TENB => DYB[7]) = (1.000, 1.000);
    if (DB[7] == 1'b1 && TDB[7] == 1'b0)
       (TENB => DYB[7]) = (1.000, 1.000);
    if (DB[6] == 1'b0 && TDB[6] == 1'b1)
       (TENB => DYB[6]) = (1.000, 1.000);
    if (DB[6] == 1'b1 && TDB[6] == 1'b0)
       (TENB => DYB[6]) = (1.000, 1.000);
    if (DB[5] == 1'b0 && TDB[5] == 1'b1)
       (TENB => DYB[5]) = (1.000, 1.000);
    if (DB[5] == 1'b1 && TDB[5] == 1'b0)
       (TENB => DYB[5]) = (1.000, 1.000);
    if (DB[4] == 1'b0 && TDB[4] == 1'b1)
       (TENB => DYB[4]) = (1.000, 1.000);
    if (DB[4] == 1'b1 && TDB[4] == 1'b0)
       (TENB => DYB[4]) = (1.000, 1.000);
    if (DB[3] == 1'b0 && TDB[3] == 1'b1)
       (TENB => DYB[3]) = (1.000, 1.000);
    if (DB[3] == 1'b1 && TDB[3] == 1'b0)
       (TENB => DYB[3]) = (1.000, 1.000);
    if (DB[2] == 1'b0 && TDB[2] == 1'b1)
       (TENB => DYB[2]) = (1.000, 1.000);
    if (DB[2] == 1'b1 && TDB[2] == 1'b0)
       (TENB => DYB[2]) = (1.000, 1.000);
    if (DB[1] == 1'b0 && TDB[1] == 1'b1)
       (TENB => DYB[1]) = (1.000, 1.000);
    if (DB[1] == 1'b1 && TDB[1] == 1'b0)
       (TENB => DYB[1]) = (1.000, 1.000);
    if (DB[0] == 1'b0 && TDB[0] == 1'b1)
       (TENB => DYB[0]) = (1.000, 1.000);
    if (DB[0] == 1'b1 && TDB[0] == 1'b0)
       (TENB => DYB[0]) = (1.000, 1.000);
    if (TENB == 1'b1)
       (DB[123] => DYB[123]) = (1.000, 1.000);
    if (TENB == 1'b1)
       (DB[122] => DYB[122]) = (1.000, 1.000);
    if (TENB == 1'b1)
       (DB[121] => DYB[121]) = (1.000, 1.000);
    if (TENB == 1'b1)
       (DB[120] => DYB[120]) = (1.000, 1.000);
    if (TENB == 1'b1)
       (DB[119] => DYB[119]) = (1.000, 1.000);
    if (TENB == 1'b1)
       (DB[118] => DYB[118]) = (1.000, 1.000);
    if (TENB == 1'b1)
       (DB[117] => DYB[117]) = (1.000, 1.000);
    if (TENB == 1'b1)
       (DB[116] => DYB[116]) = (1.000, 1.000);
    if (TENB == 1'b1)
       (DB[115] => DYB[115]) = (1.000, 1.000);
    if (TENB == 1'b1)
       (DB[114] => DYB[114]) = (1.000, 1.000);
    if (TENB == 1'b1)
       (DB[113] => DYB[113]) = (1.000, 1.000);
    if (TENB == 1'b1)
       (DB[112] => DYB[112]) = (1.000, 1.000);
    if (TENB == 1'b1)
       (DB[111] => DYB[111]) = (1.000, 1.000);
    if (TENB == 1'b1)
       (DB[110] => DYB[110]) = (1.000, 1.000);
    if (TENB == 1'b1)
       (DB[109] => DYB[109]) = (1.000, 1.000);
    if (TENB == 1'b1)
       (DB[108] => DYB[108]) = (1.000, 1.000);
    if (TENB == 1'b1)
       (DB[107] => DYB[107]) = (1.000, 1.000);
    if (TENB == 1'b1)
       (DB[106] => DYB[106]) = (1.000, 1.000);
    if (TENB == 1'b1)
       (DB[105] => DYB[105]) = (1.000, 1.000);
    if (TENB == 1'b1)
       (DB[104] => DYB[104]) = (1.000, 1.000);
    if (TENB == 1'b1)
       (DB[103] => DYB[103]) = (1.000, 1.000);
    if (TENB == 1'b1)
       (DB[102] => DYB[102]) = (1.000, 1.000);
    if (TENB == 1'b1)
       (DB[101] => DYB[101]) = (1.000, 1.000);
    if (TENB == 1'b1)
       (DB[100] => DYB[100]) = (1.000, 1.000);
    if (TENB == 1'b1)
       (DB[99] => DYB[99]) = (1.000, 1.000);
    if (TENB == 1'b1)
       (DB[98] => DYB[98]) = (1.000, 1.000);
    if (TENB == 1'b1)
       (DB[97] => DYB[97]) = (1.000, 1.000);
    if (TENB == 1'b1)
       (DB[96] => DYB[96]) = (1.000, 1.000);
    if (TENB == 1'b1)
       (DB[95] => DYB[95]) = (1.000, 1.000);
    if (TENB == 1'b1)
       (DB[94] => DYB[94]) = (1.000, 1.000);
    if (TENB == 1'b1)
       (DB[93] => DYB[93]) = (1.000, 1.000);
    if (TENB == 1'b1)
       (DB[92] => DYB[92]) = (1.000, 1.000);
    if (TENB == 1'b1)
       (DB[91] => DYB[91]) = (1.000, 1.000);
    if (TENB == 1'b1)
       (DB[90] => DYB[90]) = (1.000, 1.000);
    if (TENB == 1'b1)
       (DB[89] => DYB[89]) = (1.000, 1.000);
    if (TENB == 1'b1)
       (DB[88] => DYB[88]) = (1.000, 1.000);
    if (TENB == 1'b1)
       (DB[87] => DYB[87]) = (1.000, 1.000);
    if (TENB == 1'b1)
       (DB[86] => DYB[86]) = (1.000, 1.000);
    if (TENB == 1'b1)
       (DB[85] => DYB[85]) = (1.000, 1.000);
    if (TENB == 1'b1)
       (DB[84] => DYB[84]) = (1.000, 1.000);
    if (TENB == 1'b1)
       (DB[83] => DYB[83]) = (1.000, 1.000);
    if (TENB == 1'b1)
       (DB[82] => DYB[82]) = (1.000, 1.000);
    if (TENB == 1'b1)
       (DB[81] => DYB[81]) = (1.000, 1.000);
    if (TENB == 1'b1)
       (DB[80] => DYB[80]) = (1.000, 1.000);
    if (TENB == 1'b1)
       (DB[79] => DYB[79]) = (1.000, 1.000);
    if (TENB == 1'b1)
       (DB[78] => DYB[78]) = (1.000, 1.000);
    if (TENB == 1'b1)
       (DB[77] => DYB[77]) = (1.000, 1.000);
    if (TENB == 1'b1)
       (DB[76] => DYB[76]) = (1.000, 1.000);
    if (TENB == 1'b1)
       (DB[75] => DYB[75]) = (1.000, 1.000);
    if (TENB == 1'b1)
       (DB[74] => DYB[74]) = (1.000, 1.000);
    if (TENB == 1'b1)
       (DB[73] => DYB[73]) = (1.000, 1.000);
    if (TENB == 1'b1)
       (DB[72] => DYB[72]) = (1.000, 1.000);
    if (TENB == 1'b1)
       (DB[71] => DYB[71]) = (1.000, 1.000);
    if (TENB == 1'b1)
       (DB[70] => DYB[70]) = (1.000, 1.000);
    if (TENB == 1'b1)
       (DB[69] => DYB[69]) = (1.000, 1.000);
    if (TENB == 1'b1)
       (DB[68] => DYB[68]) = (1.000, 1.000);
    if (TENB == 1'b1)
       (DB[67] => DYB[67]) = (1.000, 1.000);
    if (TENB == 1'b1)
       (DB[66] => DYB[66]) = (1.000, 1.000);
    if (TENB == 1'b1)
       (DB[65] => DYB[65]) = (1.000, 1.000);
    if (TENB == 1'b1)
       (DB[64] => DYB[64]) = (1.000, 1.000);
    if (TENB == 1'b1)
       (DB[63] => DYB[63]) = (1.000, 1.000);
    if (TENB == 1'b1)
       (DB[62] => DYB[62]) = (1.000, 1.000);
    if (TENB == 1'b1)
       (DB[61] => DYB[61]) = (1.000, 1.000);
    if (TENB == 1'b1)
       (DB[60] => DYB[60]) = (1.000, 1.000);
    if (TENB == 1'b1)
       (DB[59] => DYB[59]) = (1.000, 1.000);
    if (TENB == 1'b1)
       (DB[58] => DYB[58]) = (1.000, 1.000);
    if (TENB == 1'b1)
       (DB[57] => DYB[57]) = (1.000, 1.000);
    if (TENB == 1'b1)
       (DB[56] => DYB[56]) = (1.000, 1.000);
    if (TENB == 1'b1)
       (DB[55] => DYB[55]) = (1.000, 1.000);
    if (TENB == 1'b1)
       (DB[54] => DYB[54]) = (1.000, 1.000);
    if (TENB == 1'b1)
       (DB[53] => DYB[53]) = (1.000, 1.000);
    if (TENB == 1'b1)
       (DB[52] => DYB[52]) = (1.000, 1.000);
    if (TENB == 1'b1)
       (DB[51] => DYB[51]) = (1.000, 1.000);
    if (TENB == 1'b1)
       (DB[50] => DYB[50]) = (1.000, 1.000);
    if (TENB == 1'b1)
       (DB[49] => DYB[49]) = (1.000, 1.000);
    if (TENB == 1'b1)
       (DB[48] => DYB[48]) = (1.000, 1.000);
    if (TENB == 1'b1)
       (DB[47] => DYB[47]) = (1.000, 1.000);
    if (TENB == 1'b1)
       (DB[46] => DYB[46]) = (1.000, 1.000);
    if (TENB == 1'b1)
       (DB[45] => DYB[45]) = (1.000, 1.000);
    if (TENB == 1'b1)
       (DB[44] => DYB[44]) = (1.000, 1.000);
    if (TENB == 1'b1)
       (DB[43] => DYB[43]) = (1.000, 1.000);
    if (TENB == 1'b1)
       (DB[42] => DYB[42]) = (1.000, 1.000);
    if (TENB == 1'b1)
       (DB[41] => DYB[41]) = (1.000, 1.000);
    if (TENB == 1'b1)
       (DB[40] => DYB[40]) = (1.000, 1.000);
    if (TENB == 1'b1)
       (DB[39] => DYB[39]) = (1.000, 1.000);
    if (TENB == 1'b1)
       (DB[38] => DYB[38]) = (1.000, 1.000);
    if (TENB == 1'b1)
       (DB[37] => DYB[37]) = (1.000, 1.000);
    if (TENB == 1'b1)
       (DB[36] => DYB[36]) = (1.000, 1.000);
    if (TENB == 1'b1)
       (DB[35] => DYB[35]) = (1.000, 1.000);
    if (TENB == 1'b1)
       (DB[34] => DYB[34]) = (1.000, 1.000);
    if (TENB == 1'b1)
       (DB[33] => DYB[33]) = (1.000, 1.000);
    if (TENB == 1'b1)
       (DB[32] => DYB[32]) = (1.000, 1.000);
    if (TENB == 1'b1)
       (DB[31] => DYB[31]) = (1.000, 1.000);
    if (TENB == 1'b1)
       (DB[30] => DYB[30]) = (1.000, 1.000);
    if (TENB == 1'b1)
       (DB[29] => DYB[29]) = (1.000, 1.000);
    if (TENB == 1'b1)
       (DB[28] => DYB[28]) = (1.000, 1.000);
    if (TENB == 1'b1)
       (DB[27] => DYB[27]) = (1.000, 1.000);
    if (TENB == 1'b1)
       (DB[26] => DYB[26]) = (1.000, 1.000);
    if (TENB == 1'b1)
       (DB[25] => DYB[25]) = (1.000, 1.000);
    if (TENB == 1'b1)
       (DB[24] => DYB[24]) = (1.000, 1.000);
    if (TENB == 1'b1)
       (DB[23] => DYB[23]) = (1.000, 1.000);
    if (TENB == 1'b1)
       (DB[22] => DYB[22]) = (1.000, 1.000);
    if (TENB == 1'b1)
       (DB[21] => DYB[21]) = (1.000, 1.000);
    if (TENB == 1'b1)
       (DB[20] => DYB[20]) = (1.000, 1.000);
    if (TENB == 1'b1)
       (DB[19] => DYB[19]) = (1.000, 1.000);
    if (TENB == 1'b1)
       (DB[18] => DYB[18]) = (1.000, 1.000);
    if (TENB == 1'b1)
       (DB[17] => DYB[17]) = (1.000, 1.000);
    if (TENB == 1'b1)
       (DB[16] => DYB[16]) = (1.000, 1.000);
    if (TENB == 1'b1)
       (DB[15] => DYB[15]) = (1.000, 1.000);
    if (TENB == 1'b1)
       (DB[14] => DYB[14]) = (1.000, 1.000);
    if (TENB == 1'b1)
       (DB[13] => DYB[13]) = (1.000, 1.000);
    if (TENB == 1'b1)
       (DB[12] => DYB[12]) = (1.000, 1.000);
    if (TENB == 1'b1)
       (DB[11] => DYB[11]) = (1.000, 1.000);
    if (TENB == 1'b1)
       (DB[10] => DYB[10]) = (1.000, 1.000);
    if (TENB == 1'b1)
       (DB[9] => DYB[9]) = (1.000, 1.000);
    if (TENB == 1'b1)
       (DB[8] => DYB[8]) = (1.000, 1.000);
    if (TENB == 1'b1)
       (DB[7] => DYB[7]) = (1.000, 1.000);
    if (TENB == 1'b1)
       (DB[6] => DYB[6]) = (1.000, 1.000);
    if (TENB == 1'b1)
       (DB[5] => DYB[5]) = (1.000, 1.000);
    if (TENB == 1'b1)
       (DB[4] => DYB[4]) = (1.000, 1.000);
    if (TENB == 1'b1)
       (DB[3] => DYB[3]) = (1.000, 1.000);
    if (TENB == 1'b1)
       (DB[2] => DYB[2]) = (1.000, 1.000);
    if (TENB == 1'b1)
       (DB[1] => DYB[1]) = (1.000, 1.000);
    if (TENB == 1'b1)
       (DB[0] => DYB[0]) = (1.000, 1.000);
    if (TENB == 1'b0)
       (TDB[123] => DYB[123]) = (1.000, 1.000);
    if (TENB == 1'b0)
       (TDB[122] => DYB[122]) = (1.000, 1.000);
    if (TENB == 1'b0)
       (TDB[121] => DYB[121]) = (1.000, 1.000);
    if (TENB == 1'b0)
       (TDB[120] => DYB[120]) = (1.000, 1.000);
    if (TENB == 1'b0)
       (TDB[119] => DYB[119]) = (1.000, 1.000);
    if (TENB == 1'b0)
       (TDB[118] => DYB[118]) = (1.000, 1.000);
    if (TENB == 1'b0)
       (TDB[117] => DYB[117]) = (1.000, 1.000);
    if (TENB == 1'b0)
       (TDB[116] => DYB[116]) = (1.000, 1.000);
    if (TENB == 1'b0)
       (TDB[115] => DYB[115]) = (1.000, 1.000);
    if (TENB == 1'b0)
       (TDB[114] => DYB[114]) = (1.000, 1.000);
    if (TENB == 1'b0)
       (TDB[113] => DYB[113]) = (1.000, 1.000);
    if (TENB == 1'b0)
       (TDB[112] => DYB[112]) = (1.000, 1.000);
    if (TENB == 1'b0)
       (TDB[111] => DYB[111]) = (1.000, 1.000);
    if (TENB == 1'b0)
       (TDB[110] => DYB[110]) = (1.000, 1.000);
    if (TENB == 1'b0)
       (TDB[109] => DYB[109]) = (1.000, 1.000);
    if (TENB == 1'b0)
       (TDB[108] => DYB[108]) = (1.000, 1.000);
    if (TENB == 1'b0)
       (TDB[107] => DYB[107]) = (1.000, 1.000);
    if (TENB == 1'b0)
       (TDB[106] => DYB[106]) = (1.000, 1.000);
    if (TENB == 1'b0)
       (TDB[105] => DYB[105]) = (1.000, 1.000);
    if (TENB == 1'b0)
       (TDB[104] => DYB[104]) = (1.000, 1.000);
    if (TENB == 1'b0)
       (TDB[103] => DYB[103]) = (1.000, 1.000);
    if (TENB == 1'b0)
       (TDB[102] => DYB[102]) = (1.000, 1.000);
    if (TENB == 1'b0)
       (TDB[101] => DYB[101]) = (1.000, 1.000);
    if (TENB == 1'b0)
       (TDB[100] => DYB[100]) = (1.000, 1.000);
    if (TENB == 1'b0)
       (TDB[99] => DYB[99]) = (1.000, 1.000);
    if (TENB == 1'b0)
       (TDB[98] => DYB[98]) = (1.000, 1.000);
    if (TENB == 1'b0)
       (TDB[97] => DYB[97]) = (1.000, 1.000);
    if (TENB == 1'b0)
       (TDB[96] => DYB[96]) = (1.000, 1.000);
    if (TENB == 1'b0)
       (TDB[95] => DYB[95]) = (1.000, 1.000);
    if (TENB == 1'b0)
       (TDB[94] => DYB[94]) = (1.000, 1.000);
    if (TENB == 1'b0)
       (TDB[93] => DYB[93]) = (1.000, 1.000);
    if (TENB == 1'b0)
       (TDB[92] => DYB[92]) = (1.000, 1.000);
    if (TENB == 1'b0)
       (TDB[91] => DYB[91]) = (1.000, 1.000);
    if (TENB == 1'b0)
       (TDB[90] => DYB[90]) = (1.000, 1.000);
    if (TENB == 1'b0)
       (TDB[89] => DYB[89]) = (1.000, 1.000);
    if (TENB == 1'b0)
       (TDB[88] => DYB[88]) = (1.000, 1.000);
    if (TENB == 1'b0)
       (TDB[87] => DYB[87]) = (1.000, 1.000);
    if (TENB == 1'b0)
       (TDB[86] => DYB[86]) = (1.000, 1.000);
    if (TENB == 1'b0)
       (TDB[85] => DYB[85]) = (1.000, 1.000);
    if (TENB == 1'b0)
       (TDB[84] => DYB[84]) = (1.000, 1.000);
    if (TENB == 1'b0)
       (TDB[83] => DYB[83]) = (1.000, 1.000);
    if (TENB == 1'b0)
       (TDB[82] => DYB[82]) = (1.000, 1.000);
    if (TENB == 1'b0)
       (TDB[81] => DYB[81]) = (1.000, 1.000);
    if (TENB == 1'b0)
       (TDB[80] => DYB[80]) = (1.000, 1.000);
    if (TENB == 1'b0)
       (TDB[79] => DYB[79]) = (1.000, 1.000);
    if (TENB == 1'b0)
       (TDB[78] => DYB[78]) = (1.000, 1.000);
    if (TENB == 1'b0)
       (TDB[77] => DYB[77]) = (1.000, 1.000);
    if (TENB == 1'b0)
       (TDB[76] => DYB[76]) = (1.000, 1.000);
    if (TENB == 1'b0)
       (TDB[75] => DYB[75]) = (1.000, 1.000);
    if (TENB == 1'b0)
       (TDB[74] => DYB[74]) = (1.000, 1.000);
    if (TENB == 1'b0)
       (TDB[73] => DYB[73]) = (1.000, 1.000);
    if (TENB == 1'b0)
       (TDB[72] => DYB[72]) = (1.000, 1.000);
    if (TENB == 1'b0)
       (TDB[71] => DYB[71]) = (1.000, 1.000);
    if (TENB == 1'b0)
       (TDB[70] => DYB[70]) = (1.000, 1.000);
    if (TENB == 1'b0)
       (TDB[69] => DYB[69]) = (1.000, 1.000);
    if (TENB == 1'b0)
       (TDB[68] => DYB[68]) = (1.000, 1.000);
    if (TENB == 1'b0)
       (TDB[67] => DYB[67]) = (1.000, 1.000);
    if (TENB == 1'b0)
       (TDB[66] => DYB[66]) = (1.000, 1.000);
    if (TENB == 1'b0)
       (TDB[65] => DYB[65]) = (1.000, 1.000);
    if (TENB == 1'b0)
       (TDB[64] => DYB[64]) = (1.000, 1.000);
    if (TENB == 1'b0)
       (TDB[63] => DYB[63]) = (1.000, 1.000);
    if (TENB == 1'b0)
       (TDB[62] => DYB[62]) = (1.000, 1.000);
    if (TENB == 1'b0)
       (TDB[61] => DYB[61]) = (1.000, 1.000);
    if (TENB == 1'b0)
       (TDB[60] => DYB[60]) = (1.000, 1.000);
    if (TENB == 1'b0)
       (TDB[59] => DYB[59]) = (1.000, 1.000);
    if (TENB == 1'b0)
       (TDB[58] => DYB[58]) = (1.000, 1.000);
    if (TENB == 1'b0)
       (TDB[57] => DYB[57]) = (1.000, 1.000);
    if (TENB == 1'b0)
       (TDB[56] => DYB[56]) = (1.000, 1.000);
    if (TENB == 1'b0)
       (TDB[55] => DYB[55]) = (1.000, 1.000);
    if (TENB == 1'b0)
       (TDB[54] => DYB[54]) = (1.000, 1.000);
    if (TENB == 1'b0)
       (TDB[53] => DYB[53]) = (1.000, 1.000);
    if (TENB == 1'b0)
       (TDB[52] => DYB[52]) = (1.000, 1.000);
    if (TENB == 1'b0)
       (TDB[51] => DYB[51]) = (1.000, 1.000);
    if (TENB == 1'b0)
       (TDB[50] => DYB[50]) = (1.000, 1.000);
    if (TENB == 1'b0)
       (TDB[49] => DYB[49]) = (1.000, 1.000);
    if (TENB == 1'b0)
       (TDB[48] => DYB[48]) = (1.000, 1.000);
    if (TENB == 1'b0)
       (TDB[47] => DYB[47]) = (1.000, 1.000);
    if (TENB == 1'b0)
       (TDB[46] => DYB[46]) = (1.000, 1.000);
    if (TENB == 1'b0)
       (TDB[45] => DYB[45]) = (1.000, 1.000);
    if (TENB == 1'b0)
       (TDB[44] => DYB[44]) = (1.000, 1.000);
    if (TENB == 1'b0)
       (TDB[43] => DYB[43]) = (1.000, 1.000);
    if (TENB == 1'b0)
       (TDB[42] => DYB[42]) = (1.000, 1.000);
    if (TENB == 1'b0)
       (TDB[41] => DYB[41]) = (1.000, 1.000);
    if (TENB == 1'b0)
       (TDB[40] => DYB[40]) = (1.000, 1.000);
    if (TENB == 1'b0)
       (TDB[39] => DYB[39]) = (1.000, 1.000);
    if (TENB == 1'b0)
       (TDB[38] => DYB[38]) = (1.000, 1.000);
    if (TENB == 1'b0)
       (TDB[37] => DYB[37]) = (1.000, 1.000);
    if (TENB == 1'b0)
       (TDB[36] => DYB[36]) = (1.000, 1.000);
    if (TENB == 1'b0)
       (TDB[35] => DYB[35]) = (1.000, 1.000);
    if (TENB == 1'b0)
       (TDB[34] => DYB[34]) = (1.000, 1.000);
    if (TENB == 1'b0)
       (TDB[33] => DYB[33]) = (1.000, 1.000);
    if (TENB == 1'b0)
       (TDB[32] => DYB[32]) = (1.000, 1.000);
    if (TENB == 1'b0)
       (TDB[31] => DYB[31]) = (1.000, 1.000);
    if (TENB == 1'b0)
       (TDB[30] => DYB[30]) = (1.000, 1.000);
    if (TENB == 1'b0)
       (TDB[29] => DYB[29]) = (1.000, 1.000);
    if (TENB == 1'b0)
       (TDB[28] => DYB[28]) = (1.000, 1.000);
    if (TENB == 1'b0)
       (TDB[27] => DYB[27]) = (1.000, 1.000);
    if (TENB == 1'b0)
       (TDB[26] => DYB[26]) = (1.000, 1.000);
    if (TENB == 1'b0)
       (TDB[25] => DYB[25]) = (1.000, 1.000);
    if (TENB == 1'b0)
       (TDB[24] => DYB[24]) = (1.000, 1.000);
    if (TENB == 1'b0)
       (TDB[23] => DYB[23]) = (1.000, 1.000);
    if (TENB == 1'b0)
       (TDB[22] => DYB[22]) = (1.000, 1.000);
    if (TENB == 1'b0)
       (TDB[21] => DYB[21]) = (1.000, 1.000);
    if (TENB == 1'b0)
       (TDB[20] => DYB[20]) = (1.000, 1.000);
    if (TENB == 1'b0)
       (TDB[19] => DYB[19]) = (1.000, 1.000);
    if (TENB == 1'b0)
       (TDB[18] => DYB[18]) = (1.000, 1.000);
    if (TENB == 1'b0)
       (TDB[17] => DYB[17]) = (1.000, 1.000);
    if (TENB == 1'b0)
       (TDB[16] => DYB[16]) = (1.000, 1.000);
    if (TENB == 1'b0)
       (TDB[15] => DYB[15]) = (1.000, 1.000);
    if (TENB == 1'b0)
       (TDB[14] => DYB[14]) = (1.000, 1.000);
    if (TENB == 1'b0)
       (TDB[13] => DYB[13]) = (1.000, 1.000);
    if (TENB == 1'b0)
       (TDB[12] => DYB[12]) = (1.000, 1.000);
    if (TENB == 1'b0)
       (TDB[11] => DYB[11]) = (1.000, 1.000);
    if (TENB == 1'b0)
       (TDB[10] => DYB[10]) = (1.000, 1.000);
    if (TENB == 1'b0)
       (TDB[9] => DYB[9]) = (1.000, 1.000);
    if (TENB == 1'b0)
       (TDB[8] => DYB[8]) = (1.000, 1.000);
    if (TENB == 1'b0)
       (TDB[7] => DYB[7]) = (1.000, 1.000);
    if (TENB == 1'b0)
       (TDB[6] => DYB[6]) = (1.000, 1.000);
    if (TENB == 1'b0)
       (TDB[5] => DYB[5]) = (1.000, 1.000);
    if (TENB == 1'b0)
       (TDB[4] => DYB[4]) = (1.000, 1.000);
    if (TENB == 1'b0)
       (TDB[3] => DYB[3]) = (1.000, 1.000);
    if (TENB == 1'b0)
       (TDB[2] => DYB[2]) = (1.000, 1.000);
    if (TENB == 1'b0)
       (TDB[1] => DYB[1]) = (1.000, 1.000);
    if (TENB == 1'b0)
       (TDB[0] => DYB[0]) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[123] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[122] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[121] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[120] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[119] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[118] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[117] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[116] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[115] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[114] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[113] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[112] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[111] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[110] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[109] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[108] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[107] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[106] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[105] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[104] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[103] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[102] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[101] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[100] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[99] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[98] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[97] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[96] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[95] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[94] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[93] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[92] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[91] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[90] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[89] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[88] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[87] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[86] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[85] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[84] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[83] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[82] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[81] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[80] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[79] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[78] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[77] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[76] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[75] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[74] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[73] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[72] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[71] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[70] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[69] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[68] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[67] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[66] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[65] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[64] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[63] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[62] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[61] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[60] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[59] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[58] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[57] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[56] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[55] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[54] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[53] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[52] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[51] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[50] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[49] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[48] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[47] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[46] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[45] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[44] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[43] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[42] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[41] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[40] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[39] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[38] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[37] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[36] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[35] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[34] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[33] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[32] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[31] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[30] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[29] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[28] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[27] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[26] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[25] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[24] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[23] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[22] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[21] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[20] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[19] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[18] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[17] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[16] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[15] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[14] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[13] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[12] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[11] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[10] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[9] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[8] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[7] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[6] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[5] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[4] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[3] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[2] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[1] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[0] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[123] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[122] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[121] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[120] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[119] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[118] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[117] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[116] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[115] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[114] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[113] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[112] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[111] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[110] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[109] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[108] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[107] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[106] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[105] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[104] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[103] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[102] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[101] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[100] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[99] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[98] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[97] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[96] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[95] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[94] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[93] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[92] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[91] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[90] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[89] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[88] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[87] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[86] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[85] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[84] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[83] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[82] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[81] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[80] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[79] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[78] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[77] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[76] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[75] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[74] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[73] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[72] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[71] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[70] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[69] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[68] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[67] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[66] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[65] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[64] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[63] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[62] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[61] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[60] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[59] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[58] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[57] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[56] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[55] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[54] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[53] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[52] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[51] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[50] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[49] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[48] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[47] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[46] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[45] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[44] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[43] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[42] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[41] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[40] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[39] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[38] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[37] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[36] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[35] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[34] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[33] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[32] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[31] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[30] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[29] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[28] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[27] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[26] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[25] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[24] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[23] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[22] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[21] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[20] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[19] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[18] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[17] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[16] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[15] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[14] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[13] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[12] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[11] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[10] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[9] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[8] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[7] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[6] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[5] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[4] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[3] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[2] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[1] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[0] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[123] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[122] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[121] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[120] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[119] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[118] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[117] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[116] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[115] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[114] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[113] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[112] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[111] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[110] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[109] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[108] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[107] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[106] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[105] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[104] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[103] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[102] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[101] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[100] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[99] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[98] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[97] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[96] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[95] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[94] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[93] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[92] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[91] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[90] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[89] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[88] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[87] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[86] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[85] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[84] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[83] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[82] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[81] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[80] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[79] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[78] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[77] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[76] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[75] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[74] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[73] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[72] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[71] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[70] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[69] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[68] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[67] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[66] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[65] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[64] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[63] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[62] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[61] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[60] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[59] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[58] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[57] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[56] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[55] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[54] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[53] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[52] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[51] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[50] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[49] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[48] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[47] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[46] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[45] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[44] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[43] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[42] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[41] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[40] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[39] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[38] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[37] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[36] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[35] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[34] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[33] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[32] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[31] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[30] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[29] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[28] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[27] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[26] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[25] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[24] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[23] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[22] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[21] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[20] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[19] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[18] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[17] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[16] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[15] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[14] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[13] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[12] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[11] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[10] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[9] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[8] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[7] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[6] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[5] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[4] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[3] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[2] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[1] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[0] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[123] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[122] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[121] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[120] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[119] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[118] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[117] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[116] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[115] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[114] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[113] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[112] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[111] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[110] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[109] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[108] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[107] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[106] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[105] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[104] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[103] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[102] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[101] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[100] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[99] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[98] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[97] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[96] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[95] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[94] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[93] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[92] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[91] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[90] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[89] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[88] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[87] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[86] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[85] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[84] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[83] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[82] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[81] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[80] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[79] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[78] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[77] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[76] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[75] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[74] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[73] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[72] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[71] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[70] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[69] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[68] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[67] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[66] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[65] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[64] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[63] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[62] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[61] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[60] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[59] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[58] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[57] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[56] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[55] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[54] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[53] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[52] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[51] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[50] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[49] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[48] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[47] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[46] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[45] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[44] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[43] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[42] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[41] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[40] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[39] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[38] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[37] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[36] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[35] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[34] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[33] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[32] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[31] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[30] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[29] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[28] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[27] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[26] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[25] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[24] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[23] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[22] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[21] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[20] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[19] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[18] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[17] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[16] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[15] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[14] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[13] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[12] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[11] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[10] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[9] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[8] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[7] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[6] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[5] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[4] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[3] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[2] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[1] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b0 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[0] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[123] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[122] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[121] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[120] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[119] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[118] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[117] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[116] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[115] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[114] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[113] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[112] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[111] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[110] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[109] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[108] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[107] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[106] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[105] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[104] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[103] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[102] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[101] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[100] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[99] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[98] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[97] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[96] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[95] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[94] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[93] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[92] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[91] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[90] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[89] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[88] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[87] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[86] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[85] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[84] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[83] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[82] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[81] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[80] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[79] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[78] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[77] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[76] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[75] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[74] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[73] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[72] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[71] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[70] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[69] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[68] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[67] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[66] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[65] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[64] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[63] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[62] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[61] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[60] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[59] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[58] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[57] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[56] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[55] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[54] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[53] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[52] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[51] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[50] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[49] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[48] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[47] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[46] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[45] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[44] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[43] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[42] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[41] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[40] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[39] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[38] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[37] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[36] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[35] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[34] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[33] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[32] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[31] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[30] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[29] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[28] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[27] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[26] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[25] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[24] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[23] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[22] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[21] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[20] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[19] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[18] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[17] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[16] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[15] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[14] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[13] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[12] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[11] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[10] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[9] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[8] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[7] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[6] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[5] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[4] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[3] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[2] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[1] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[0] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[123] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[122] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[121] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[120] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[119] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[118] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[117] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[116] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[115] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[114] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[113] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[112] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[111] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[110] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[109] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[108] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[107] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[106] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[105] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[104] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[103] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[102] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[101] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[100] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[99] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[98] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[97] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[96] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[95] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[94] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[93] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[92] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[91] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[90] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[89] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[88] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[87] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[86] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[85] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[84] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[83] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[82] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[81] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[80] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[79] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[78] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[77] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[76] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[75] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[74] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[73] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[72] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[71] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[70] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[69] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[68] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[67] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[66] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[65] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[64] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[63] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[62] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[61] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[60] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[59] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[58] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[57] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[56] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[55] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[54] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[53] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[52] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[51] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[50] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[49] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[48] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[47] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[46] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[45] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[44] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[43] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[42] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[41] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[40] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[39] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[38] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[37] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[36] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[35] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[34] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[33] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[32] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[31] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[30] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[29] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[28] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[27] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[26] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[25] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[24] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[23] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[22] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[21] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[20] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[19] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[18] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[17] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[16] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[15] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[14] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[13] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[12] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[11] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[10] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[9] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[8] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[7] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[6] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[5] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[4] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[3] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[2] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[1] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b0 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[0] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[123] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[122] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[121] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[120] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[119] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[118] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[117] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[116] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[115] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[114] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[113] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[112] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[111] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[110] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[109] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[108] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[107] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[106] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[105] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[104] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[103] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[102] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[101] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[100] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[99] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[98] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[97] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[96] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[95] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[94] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[93] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[92] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[91] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[90] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[89] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[88] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[87] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[86] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[85] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[84] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[83] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[82] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[81] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[80] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[79] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[78] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[77] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[76] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[75] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[74] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[73] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[72] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[71] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[70] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[69] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[68] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[67] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[66] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[65] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[64] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[63] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[62] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[61] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[60] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[59] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[58] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[57] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[56] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[55] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[54] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[53] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[52] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[51] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[50] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[49] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[48] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[47] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[46] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[45] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[44] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[43] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[42] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[41] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[40] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[39] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[38] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[37] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[36] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[35] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[34] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[33] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[32] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[31] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[30] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[29] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[28] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[27] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[26] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[25] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[24] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[23] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[22] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[21] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[20] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[19] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[18] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[17] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[16] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[15] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[14] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[13] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[12] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[11] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[10] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[9] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[8] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[7] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[6] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[5] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[4] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[3] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[2] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[1] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b0)
       (posedge CLKA => (QA[0] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[123] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[122] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[121] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[120] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[119] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[118] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[117] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[116] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[115] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[114] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[113] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[112] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[111] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[110] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[109] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[108] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[107] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[106] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[105] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[104] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[103] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[102] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[101] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[100] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[99] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[98] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[97] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[96] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[95] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[94] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[93] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[92] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[91] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[90] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[89] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[88] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[87] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[86] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[85] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[84] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[83] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[82] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[81] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[80] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[79] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[78] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[77] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[76] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[75] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[74] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[73] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[72] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[71] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[70] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[69] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[68] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[67] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[66] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[65] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[64] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[63] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[62] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[61] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[60] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[59] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[58] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[57] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[56] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[55] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[54] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[53] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[52] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[51] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[50] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[49] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[48] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[47] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[46] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[45] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[44] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[43] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[42] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[41] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[40] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[39] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[38] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[37] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[36] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[35] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[34] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[33] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[32] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[31] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[30] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[29] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[28] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[27] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[26] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[25] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[24] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[23] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[22] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[21] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[20] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[19] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[18] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[17] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[16] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[15] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[14] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[13] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[12] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[11] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[10] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[9] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[8] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[7] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[6] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[5] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[4] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[3] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[2] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[1] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b0 && EMAA[2] == 1'b1 && EMAA[1] == 1'b1 && EMAA[0] == 1'b1)
       (posedge CLKA => (QA[0] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b1)
       (negedge CLKA => (QA[123] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b1)
       (negedge CLKA => (QA[122] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b1)
       (negedge CLKA => (QA[121] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b1)
       (negedge CLKA => (QA[120] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b1)
       (negedge CLKA => (QA[119] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b1)
       (negedge CLKA => (QA[118] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b1)
       (negedge CLKA => (QA[117] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b1)
       (negedge CLKA => (QA[116] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b1)
       (negedge CLKA => (QA[115] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b1)
       (negedge CLKA => (QA[114] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b1)
       (negedge CLKA => (QA[113] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b1)
       (negedge CLKA => (QA[112] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b1)
       (negedge CLKA => (QA[111] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b1)
       (negedge CLKA => (QA[110] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b1)
       (negedge CLKA => (QA[109] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b1)
       (negedge CLKA => (QA[108] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b1)
       (negedge CLKA => (QA[107] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b1)
       (negedge CLKA => (QA[106] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b1)
       (negedge CLKA => (QA[105] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b1)
       (negedge CLKA => (QA[104] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b1)
       (negedge CLKA => (QA[103] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b1)
       (negedge CLKA => (QA[102] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b1)
       (negedge CLKA => (QA[101] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b1)
       (negedge CLKA => (QA[100] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b1)
       (negedge CLKA => (QA[99] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b1)
       (negedge CLKA => (QA[98] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b1)
       (negedge CLKA => (QA[97] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b1)
       (negedge CLKA => (QA[96] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b1)
       (negedge CLKA => (QA[95] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b1)
       (negedge CLKA => (QA[94] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b1)
       (negedge CLKA => (QA[93] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b1)
       (negedge CLKA => (QA[92] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b1)
       (negedge CLKA => (QA[91] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b1)
       (negedge CLKA => (QA[90] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b1)
       (negedge CLKA => (QA[89] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b1)
       (negedge CLKA => (QA[88] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b1)
       (negedge CLKA => (QA[87] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b1)
       (negedge CLKA => (QA[86] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b1)
       (negedge CLKA => (QA[85] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b1)
       (negedge CLKA => (QA[84] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b1)
       (negedge CLKA => (QA[83] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b1)
       (negedge CLKA => (QA[82] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b1)
       (negedge CLKA => (QA[81] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b1)
       (negedge CLKA => (QA[80] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b1)
       (negedge CLKA => (QA[79] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b1)
       (negedge CLKA => (QA[78] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b1)
       (negedge CLKA => (QA[77] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b1)
       (negedge CLKA => (QA[76] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b1)
       (negedge CLKA => (QA[75] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b1)
       (negedge CLKA => (QA[74] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b1)
       (negedge CLKA => (QA[73] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b1)
       (negedge CLKA => (QA[72] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b1)
       (negedge CLKA => (QA[71] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b1)
       (negedge CLKA => (QA[70] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b1)
       (negedge CLKA => (QA[69] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b1)
       (negedge CLKA => (QA[68] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b1)
       (negedge CLKA => (QA[67] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b1)
       (negedge CLKA => (QA[66] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b1)
       (negedge CLKA => (QA[65] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b1)
       (negedge CLKA => (QA[64] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b1)
       (negedge CLKA => (QA[63] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b1)
       (negedge CLKA => (QA[62] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b1)
       (negedge CLKA => (QA[61] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b1)
       (negedge CLKA => (QA[60] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b1)
       (negedge CLKA => (QA[59] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b1)
       (negedge CLKA => (QA[58] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b1)
       (negedge CLKA => (QA[57] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b1)
       (negedge CLKA => (QA[56] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b1)
       (negedge CLKA => (QA[55] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b1)
       (negedge CLKA => (QA[54] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b1)
       (negedge CLKA => (QA[53] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b1)
       (negedge CLKA => (QA[52] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b1)
       (negedge CLKA => (QA[51] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b1)
       (negedge CLKA => (QA[50] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b1)
       (negedge CLKA => (QA[49] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b1)
       (negedge CLKA => (QA[48] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b1)
       (negedge CLKA => (QA[47] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b1)
       (negedge CLKA => (QA[46] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b1)
       (negedge CLKA => (QA[45] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b1)
       (negedge CLKA => (QA[44] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b1)
       (negedge CLKA => (QA[43] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b1)
       (negedge CLKA => (QA[42] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b1)
       (negedge CLKA => (QA[41] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b1)
       (negedge CLKA => (QA[40] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b1)
       (negedge CLKA => (QA[39] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b1)
       (negedge CLKA => (QA[38] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b1)
       (negedge CLKA => (QA[37] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b1)
       (negedge CLKA => (QA[36] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b1)
       (negedge CLKA => (QA[35] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b1)
       (negedge CLKA => (QA[34] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b1)
       (negedge CLKA => (QA[33] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b1)
       (negedge CLKA => (QA[32] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b1)
       (negedge CLKA => (QA[31] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b1)
       (negedge CLKA => (QA[30] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b1)
       (negedge CLKA => (QA[29] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b1)
       (negedge CLKA => (QA[28] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b1)
       (negedge CLKA => (QA[27] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b1)
       (negedge CLKA => (QA[26] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b1)
       (negedge CLKA => (QA[25] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b1)
       (negedge CLKA => (QA[24] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b1)
       (negedge CLKA => (QA[23] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b1)
       (negedge CLKA => (QA[22] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b1)
       (negedge CLKA => (QA[21] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b1)
       (negedge CLKA => (QA[20] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b1)
       (negedge CLKA => (QA[19] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b1)
       (negedge CLKA => (QA[18] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b1)
       (negedge CLKA => (QA[17] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b1)
       (negedge CLKA => (QA[16] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b1)
       (negedge CLKA => (QA[15] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b1)
       (negedge CLKA => (QA[14] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b1)
       (negedge CLKA => (QA[13] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b1)
       (negedge CLKA => (QA[12] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b1)
       (negedge CLKA => (QA[11] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b1)
       (negedge CLKA => (QA[10] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b1)
       (negedge CLKA => (QA[9] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b1)
       (negedge CLKA => (QA[8] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b1)
       (negedge CLKA => (QA[7] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b1)
       (negedge CLKA => (QA[6] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b1)
       (negedge CLKA => (QA[5] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b1)
       (negedge CLKA => (QA[4] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b1)
       (negedge CLKA => (QA[3] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b1)
       (negedge CLKA => (QA[2] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b1)
       (negedge CLKA => (QA[1] : 1'b0)) = (1.000, 1.000);
    if (RET1N == 1'b1 && BENA == 1'b1 && STOVA == 1'b1)
       (negedge CLKA => (QA[0] : 1'b0)) = (1.000, 1.000);
    if (TQA[123] == 1'b1)
       (BENA => QA[123]) = (1.000, 1.000);
    if (TQA[123] == 1'b0)
       (BENA => QA[123]) = (1.000, 1.000);
    if (TQA[122] == 1'b1)
       (BENA => QA[122]) = (1.000, 1.000);
    if (TQA[122] == 1'b0)
       (BENA => QA[122]) = (1.000, 1.000);
    if (TQA[121] == 1'b1)
       (BENA => QA[121]) = (1.000, 1.000);
    if (TQA[121] == 1'b0)
       (BENA => QA[121]) = (1.000, 1.000);
    if (TQA[120] == 1'b1)
       (BENA => QA[120]) = (1.000, 1.000);
    if (TQA[120] == 1'b0)
       (BENA => QA[120]) = (1.000, 1.000);
    if (TQA[119] == 1'b1)
       (BENA => QA[119]) = (1.000, 1.000);
    if (TQA[119] == 1'b0)
       (BENA => QA[119]) = (1.000, 1.000);
    if (TQA[118] == 1'b1)
       (BENA => QA[118]) = (1.000, 1.000);
    if (TQA[118] == 1'b0)
       (BENA => QA[118]) = (1.000, 1.000);
    if (TQA[117] == 1'b1)
       (BENA => QA[117]) = (1.000, 1.000);
    if (TQA[117] == 1'b0)
       (BENA => QA[117]) = (1.000, 1.000);
    if (TQA[116] == 1'b1)
       (BENA => QA[116]) = (1.000, 1.000);
    if (TQA[116] == 1'b0)
       (BENA => QA[116]) = (1.000, 1.000);
    if (TQA[115] == 1'b1)
       (BENA => QA[115]) = (1.000, 1.000);
    if (TQA[115] == 1'b0)
       (BENA => QA[115]) = (1.000, 1.000);
    if (TQA[114] == 1'b1)
       (BENA => QA[114]) = (1.000, 1.000);
    if (TQA[114] == 1'b0)
       (BENA => QA[114]) = (1.000, 1.000);
    if (TQA[113] == 1'b1)
       (BENA => QA[113]) = (1.000, 1.000);
    if (TQA[113] == 1'b0)
       (BENA => QA[113]) = (1.000, 1.000);
    if (TQA[112] == 1'b1)
       (BENA => QA[112]) = (1.000, 1.000);
    if (TQA[112] == 1'b0)
       (BENA => QA[112]) = (1.000, 1.000);
    if (TQA[111] == 1'b1)
       (BENA => QA[111]) = (1.000, 1.000);
    if (TQA[111] == 1'b0)
       (BENA => QA[111]) = (1.000, 1.000);
    if (TQA[110] == 1'b1)
       (BENA => QA[110]) = (1.000, 1.000);
    if (TQA[110] == 1'b0)
       (BENA => QA[110]) = (1.000, 1.000);
    if (TQA[109] == 1'b1)
       (BENA => QA[109]) = (1.000, 1.000);
    if (TQA[109] == 1'b0)
       (BENA => QA[109]) = (1.000, 1.000);
    if (TQA[108] == 1'b1)
       (BENA => QA[108]) = (1.000, 1.000);
    if (TQA[108] == 1'b0)
       (BENA => QA[108]) = (1.000, 1.000);
    if (TQA[107] == 1'b1)
       (BENA => QA[107]) = (1.000, 1.000);
    if (TQA[107] == 1'b0)
       (BENA => QA[107]) = (1.000, 1.000);
    if (TQA[106] == 1'b1)
       (BENA => QA[106]) = (1.000, 1.000);
    if (TQA[106] == 1'b0)
       (BENA => QA[106]) = (1.000, 1.000);
    if (TQA[105] == 1'b1)
       (BENA => QA[105]) = (1.000, 1.000);
    if (TQA[105] == 1'b0)
       (BENA => QA[105]) = (1.000, 1.000);
    if (TQA[104] == 1'b1)
       (BENA => QA[104]) = (1.000, 1.000);
    if (TQA[104] == 1'b0)
       (BENA => QA[104]) = (1.000, 1.000);
    if (TQA[103] == 1'b1)
       (BENA => QA[103]) = (1.000, 1.000);
    if (TQA[103] == 1'b0)
       (BENA => QA[103]) = (1.000, 1.000);
    if (TQA[102] == 1'b1)
       (BENA => QA[102]) = (1.000, 1.000);
    if (TQA[102] == 1'b0)
       (BENA => QA[102]) = (1.000, 1.000);
    if (TQA[101] == 1'b1)
       (BENA => QA[101]) = (1.000, 1.000);
    if (TQA[101] == 1'b0)
       (BENA => QA[101]) = (1.000, 1.000);
    if (TQA[100] == 1'b1)
       (BENA => QA[100]) = (1.000, 1.000);
    if (TQA[100] == 1'b0)
       (BENA => QA[100]) = (1.000, 1.000);
    if (TQA[99] == 1'b1)
       (BENA => QA[99]) = (1.000, 1.000);
    if (TQA[99] == 1'b0)
       (BENA => QA[99]) = (1.000, 1.000);
    if (TQA[98] == 1'b1)
       (BENA => QA[98]) = (1.000, 1.000);
    if (TQA[98] == 1'b0)
       (BENA => QA[98]) = (1.000, 1.000);
    if (TQA[97] == 1'b1)
       (BENA => QA[97]) = (1.000, 1.000);
    if (TQA[97] == 1'b0)
       (BENA => QA[97]) = (1.000, 1.000);
    if (TQA[96] == 1'b1)
       (BENA => QA[96]) = (1.000, 1.000);
    if (TQA[96] == 1'b0)
       (BENA => QA[96]) = (1.000, 1.000);
    if (TQA[95] == 1'b1)
       (BENA => QA[95]) = (1.000, 1.000);
    if (TQA[95] == 1'b0)
       (BENA => QA[95]) = (1.000, 1.000);
    if (TQA[94] == 1'b1)
       (BENA => QA[94]) = (1.000, 1.000);
    if (TQA[94] == 1'b0)
       (BENA => QA[94]) = (1.000, 1.000);
    if (TQA[93] == 1'b1)
       (BENA => QA[93]) = (1.000, 1.000);
    if (TQA[93] == 1'b0)
       (BENA => QA[93]) = (1.000, 1.000);
    if (TQA[92] == 1'b1)
       (BENA => QA[92]) = (1.000, 1.000);
    if (TQA[92] == 1'b0)
       (BENA => QA[92]) = (1.000, 1.000);
    if (TQA[91] == 1'b1)
       (BENA => QA[91]) = (1.000, 1.000);
    if (TQA[91] == 1'b0)
       (BENA => QA[91]) = (1.000, 1.000);
    if (TQA[90] == 1'b1)
       (BENA => QA[90]) = (1.000, 1.000);
    if (TQA[90] == 1'b0)
       (BENA => QA[90]) = (1.000, 1.000);
    if (TQA[89] == 1'b1)
       (BENA => QA[89]) = (1.000, 1.000);
    if (TQA[89] == 1'b0)
       (BENA => QA[89]) = (1.000, 1.000);
    if (TQA[88] == 1'b1)
       (BENA => QA[88]) = (1.000, 1.000);
    if (TQA[88] == 1'b0)
       (BENA => QA[88]) = (1.000, 1.000);
    if (TQA[87] == 1'b1)
       (BENA => QA[87]) = (1.000, 1.000);
    if (TQA[87] == 1'b0)
       (BENA => QA[87]) = (1.000, 1.000);
    if (TQA[86] == 1'b1)
       (BENA => QA[86]) = (1.000, 1.000);
    if (TQA[86] == 1'b0)
       (BENA => QA[86]) = (1.000, 1.000);
    if (TQA[85] == 1'b1)
       (BENA => QA[85]) = (1.000, 1.000);
    if (TQA[85] == 1'b0)
       (BENA => QA[85]) = (1.000, 1.000);
    if (TQA[84] == 1'b1)
       (BENA => QA[84]) = (1.000, 1.000);
    if (TQA[84] == 1'b0)
       (BENA => QA[84]) = (1.000, 1.000);
    if (TQA[83] == 1'b1)
       (BENA => QA[83]) = (1.000, 1.000);
    if (TQA[83] == 1'b0)
       (BENA => QA[83]) = (1.000, 1.000);
    if (TQA[82] == 1'b1)
       (BENA => QA[82]) = (1.000, 1.000);
    if (TQA[82] == 1'b0)
       (BENA => QA[82]) = (1.000, 1.000);
    if (TQA[81] == 1'b1)
       (BENA => QA[81]) = (1.000, 1.000);
    if (TQA[81] == 1'b0)
       (BENA => QA[81]) = (1.000, 1.000);
    if (TQA[80] == 1'b1)
       (BENA => QA[80]) = (1.000, 1.000);
    if (TQA[80] == 1'b0)
       (BENA => QA[80]) = (1.000, 1.000);
    if (TQA[79] == 1'b1)
       (BENA => QA[79]) = (1.000, 1.000);
    if (TQA[79] == 1'b0)
       (BENA => QA[79]) = (1.000, 1.000);
    if (TQA[78] == 1'b1)
       (BENA => QA[78]) = (1.000, 1.000);
    if (TQA[78] == 1'b0)
       (BENA => QA[78]) = (1.000, 1.000);
    if (TQA[77] == 1'b1)
       (BENA => QA[77]) = (1.000, 1.000);
    if (TQA[77] == 1'b0)
       (BENA => QA[77]) = (1.000, 1.000);
    if (TQA[76] == 1'b1)
       (BENA => QA[76]) = (1.000, 1.000);
    if (TQA[76] == 1'b0)
       (BENA => QA[76]) = (1.000, 1.000);
    if (TQA[75] == 1'b1)
       (BENA => QA[75]) = (1.000, 1.000);
    if (TQA[75] == 1'b0)
       (BENA => QA[75]) = (1.000, 1.000);
    if (TQA[74] == 1'b1)
       (BENA => QA[74]) = (1.000, 1.000);
    if (TQA[74] == 1'b0)
       (BENA => QA[74]) = (1.000, 1.000);
    if (TQA[73] == 1'b1)
       (BENA => QA[73]) = (1.000, 1.000);
    if (TQA[73] == 1'b0)
       (BENA => QA[73]) = (1.000, 1.000);
    if (TQA[72] == 1'b1)
       (BENA => QA[72]) = (1.000, 1.000);
    if (TQA[72] == 1'b0)
       (BENA => QA[72]) = (1.000, 1.000);
    if (TQA[71] == 1'b1)
       (BENA => QA[71]) = (1.000, 1.000);
    if (TQA[71] == 1'b0)
       (BENA => QA[71]) = (1.000, 1.000);
    if (TQA[70] == 1'b1)
       (BENA => QA[70]) = (1.000, 1.000);
    if (TQA[70] == 1'b0)
       (BENA => QA[70]) = (1.000, 1.000);
    if (TQA[69] == 1'b1)
       (BENA => QA[69]) = (1.000, 1.000);
    if (TQA[69] == 1'b0)
       (BENA => QA[69]) = (1.000, 1.000);
    if (TQA[68] == 1'b1)
       (BENA => QA[68]) = (1.000, 1.000);
    if (TQA[68] == 1'b0)
       (BENA => QA[68]) = (1.000, 1.000);
    if (TQA[67] == 1'b1)
       (BENA => QA[67]) = (1.000, 1.000);
    if (TQA[67] == 1'b0)
       (BENA => QA[67]) = (1.000, 1.000);
    if (TQA[66] == 1'b1)
       (BENA => QA[66]) = (1.000, 1.000);
    if (TQA[66] == 1'b0)
       (BENA => QA[66]) = (1.000, 1.000);
    if (TQA[65] == 1'b1)
       (BENA => QA[65]) = (1.000, 1.000);
    if (TQA[65] == 1'b0)
       (BENA => QA[65]) = (1.000, 1.000);
    if (TQA[64] == 1'b1)
       (BENA => QA[64]) = (1.000, 1.000);
    if (TQA[64] == 1'b0)
       (BENA => QA[64]) = (1.000, 1.000);
    if (TQA[63] == 1'b1)
       (BENA => QA[63]) = (1.000, 1.000);
    if (TQA[63] == 1'b0)
       (BENA => QA[63]) = (1.000, 1.000);
    if (TQA[62] == 1'b1)
       (BENA => QA[62]) = (1.000, 1.000);
    if (TQA[62] == 1'b0)
       (BENA => QA[62]) = (1.000, 1.000);
    if (TQA[61] == 1'b1)
       (BENA => QA[61]) = (1.000, 1.000);
    if (TQA[61] == 1'b0)
       (BENA => QA[61]) = (1.000, 1.000);
    if (TQA[60] == 1'b1)
       (BENA => QA[60]) = (1.000, 1.000);
    if (TQA[60] == 1'b0)
       (BENA => QA[60]) = (1.000, 1.000);
    if (TQA[59] == 1'b1)
       (BENA => QA[59]) = (1.000, 1.000);
    if (TQA[59] == 1'b0)
       (BENA => QA[59]) = (1.000, 1.000);
    if (TQA[58] == 1'b1)
       (BENA => QA[58]) = (1.000, 1.000);
    if (TQA[58] == 1'b0)
       (BENA => QA[58]) = (1.000, 1.000);
    if (TQA[57] == 1'b1)
       (BENA => QA[57]) = (1.000, 1.000);
    if (TQA[57] == 1'b0)
       (BENA => QA[57]) = (1.000, 1.000);
    if (TQA[56] == 1'b1)
       (BENA => QA[56]) = (1.000, 1.000);
    if (TQA[56] == 1'b0)
       (BENA => QA[56]) = (1.000, 1.000);
    if (TQA[55] == 1'b1)
       (BENA => QA[55]) = (1.000, 1.000);
    if (TQA[55] == 1'b0)
       (BENA => QA[55]) = (1.000, 1.000);
    if (TQA[54] == 1'b1)
       (BENA => QA[54]) = (1.000, 1.000);
    if (TQA[54] == 1'b0)
       (BENA => QA[54]) = (1.000, 1.000);
    if (TQA[53] == 1'b1)
       (BENA => QA[53]) = (1.000, 1.000);
    if (TQA[53] == 1'b0)
       (BENA => QA[53]) = (1.000, 1.000);
    if (TQA[52] == 1'b1)
       (BENA => QA[52]) = (1.000, 1.000);
    if (TQA[52] == 1'b0)
       (BENA => QA[52]) = (1.000, 1.000);
    if (TQA[51] == 1'b1)
       (BENA => QA[51]) = (1.000, 1.000);
    if (TQA[51] == 1'b0)
       (BENA => QA[51]) = (1.000, 1.000);
    if (TQA[50] == 1'b1)
       (BENA => QA[50]) = (1.000, 1.000);
    if (TQA[50] == 1'b0)
       (BENA => QA[50]) = (1.000, 1.000);
    if (TQA[49] == 1'b1)
       (BENA => QA[49]) = (1.000, 1.000);
    if (TQA[49] == 1'b0)
       (BENA => QA[49]) = (1.000, 1.000);
    if (TQA[48] == 1'b1)
       (BENA => QA[48]) = (1.000, 1.000);
    if (TQA[48] == 1'b0)
       (BENA => QA[48]) = (1.000, 1.000);
    if (TQA[47] == 1'b1)
       (BENA => QA[47]) = (1.000, 1.000);
    if (TQA[47] == 1'b0)
       (BENA => QA[47]) = (1.000, 1.000);
    if (TQA[46] == 1'b1)
       (BENA => QA[46]) = (1.000, 1.000);
    if (TQA[46] == 1'b0)
       (BENA => QA[46]) = (1.000, 1.000);
    if (TQA[45] == 1'b1)
       (BENA => QA[45]) = (1.000, 1.000);
    if (TQA[45] == 1'b0)
       (BENA => QA[45]) = (1.000, 1.000);
    if (TQA[44] == 1'b1)
       (BENA => QA[44]) = (1.000, 1.000);
    if (TQA[44] == 1'b0)
       (BENA => QA[44]) = (1.000, 1.000);
    if (TQA[43] == 1'b1)
       (BENA => QA[43]) = (1.000, 1.000);
    if (TQA[43] == 1'b0)
       (BENA => QA[43]) = (1.000, 1.000);
    if (TQA[42] == 1'b1)
       (BENA => QA[42]) = (1.000, 1.000);
    if (TQA[42] == 1'b0)
       (BENA => QA[42]) = (1.000, 1.000);
    if (TQA[41] == 1'b1)
       (BENA => QA[41]) = (1.000, 1.000);
    if (TQA[41] == 1'b0)
       (BENA => QA[41]) = (1.000, 1.000);
    if (TQA[40] == 1'b1)
       (BENA => QA[40]) = (1.000, 1.000);
    if (TQA[40] == 1'b0)
       (BENA => QA[40]) = (1.000, 1.000);
    if (TQA[39] == 1'b1)
       (BENA => QA[39]) = (1.000, 1.000);
    if (TQA[39] == 1'b0)
       (BENA => QA[39]) = (1.000, 1.000);
    if (TQA[38] == 1'b1)
       (BENA => QA[38]) = (1.000, 1.000);
    if (TQA[38] == 1'b0)
       (BENA => QA[38]) = (1.000, 1.000);
    if (TQA[37] == 1'b1)
       (BENA => QA[37]) = (1.000, 1.000);
    if (TQA[37] == 1'b0)
       (BENA => QA[37]) = (1.000, 1.000);
    if (TQA[36] == 1'b1)
       (BENA => QA[36]) = (1.000, 1.000);
    if (TQA[36] == 1'b0)
       (BENA => QA[36]) = (1.000, 1.000);
    if (TQA[35] == 1'b1)
       (BENA => QA[35]) = (1.000, 1.000);
    if (TQA[35] == 1'b0)
       (BENA => QA[35]) = (1.000, 1.000);
    if (TQA[34] == 1'b1)
       (BENA => QA[34]) = (1.000, 1.000);
    if (TQA[34] == 1'b0)
       (BENA => QA[34]) = (1.000, 1.000);
    if (TQA[33] == 1'b1)
       (BENA => QA[33]) = (1.000, 1.000);
    if (TQA[33] == 1'b0)
       (BENA => QA[33]) = (1.000, 1.000);
    if (TQA[32] == 1'b1)
       (BENA => QA[32]) = (1.000, 1.000);
    if (TQA[32] == 1'b0)
       (BENA => QA[32]) = (1.000, 1.000);
    if (TQA[31] == 1'b1)
       (BENA => QA[31]) = (1.000, 1.000);
    if (TQA[31] == 1'b0)
       (BENA => QA[31]) = (1.000, 1.000);
    if (TQA[30] == 1'b1)
       (BENA => QA[30]) = (1.000, 1.000);
    if (TQA[30] == 1'b0)
       (BENA => QA[30]) = (1.000, 1.000);
    if (TQA[29] == 1'b1)
       (BENA => QA[29]) = (1.000, 1.000);
    if (TQA[29] == 1'b0)
       (BENA => QA[29]) = (1.000, 1.000);
    if (TQA[28] == 1'b1)
       (BENA => QA[28]) = (1.000, 1.000);
    if (TQA[28] == 1'b0)
       (BENA => QA[28]) = (1.000, 1.000);
    if (TQA[27] == 1'b1)
       (BENA => QA[27]) = (1.000, 1.000);
    if (TQA[27] == 1'b0)
       (BENA => QA[27]) = (1.000, 1.000);
    if (TQA[26] == 1'b1)
       (BENA => QA[26]) = (1.000, 1.000);
    if (TQA[26] == 1'b0)
       (BENA => QA[26]) = (1.000, 1.000);
    if (TQA[25] == 1'b1)
       (BENA => QA[25]) = (1.000, 1.000);
    if (TQA[25] == 1'b0)
       (BENA => QA[25]) = (1.000, 1.000);
    if (TQA[24] == 1'b1)
       (BENA => QA[24]) = (1.000, 1.000);
    if (TQA[24] == 1'b0)
       (BENA => QA[24]) = (1.000, 1.000);
    if (TQA[23] == 1'b1)
       (BENA => QA[23]) = (1.000, 1.000);
    if (TQA[23] == 1'b0)
       (BENA => QA[23]) = (1.000, 1.000);
    if (TQA[22] == 1'b1)
       (BENA => QA[22]) = (1.000, 1.000);
    if (TQA[22] == 1'b0)
       (BENA => QA[22]) = (1.000, 1.000);
    if (TQA[21] == 1'b1)
       (BENA => QA[21]) = (1.000, 1.000);
    if (TQA[21] == 1'b0)
       (BENA => QA[21]) = (1.000, 1.000);
    if (TQA[20] == 1'b1)
       (BENA => QA[20]) = (1.000, 1.000);
    if (TQA[20] == 1'b0)
       (BENA => QA[20]) = (1.000, 1.000);
    if (TQA[19] == 1'b1)
       (BENA => QA[19]) = (1.000, 1.000);
    if (TQA[19] == 1'b0)
       (BENA => QA[19]) = (1.000, 1.000);
    if (TQA[18] == 1'b1)
       (BENA => QA[18]) = (1.000, 1.000);
    if (TQA[18] == 1'b0)
       (BENA => QA[18]) = (1.000, 1.000);
    if (TQA[17] == 1'b1)
       (BENA => QA[17]) = (1.000, 1.000);
    if (TQA[17] == 1'b0)
       (BENA => QA[17]) = (1.000, 1.000);
    if (TQA[16] == 1'b1)
       (BENA => QA[16]) = (1.000, 1.000);
    if (TQA[16] == 1'b0)
       (BENA => QA[16]) = (1.000, 1.000);
    if (TQA[15] == 1'b1)
       (BENA => QA[15]) = (1.000, 1.000);
    if (TQA[15] == 1'b0)
       (BENA => QA[15]) = (1.000, 1.000);
    if (TQA[14] == 1'b1)
       (BENA => QA[14]) = (1.000, 1.000);
    if (TQA[14] == 1'b0)
       (BENA => QA[14]) = (1.000, 1.000);
    if (TQA[13] == 1'b1)
       (BENA => QA[13]) = (1.000, 1.000);
    if (TQA[13] == 1'b0)
       (BENA => QA[13]) = (1.000, 1.000);
    if (TQA[12] == 1'b1)
       (BENA => QA[12]) = (1.000, 1.000);
    if (TQA[12] == 1'b0)
       (BENA => QA[12]) = (1.000, 1.000);
    if (TQA[11] == 1'b1)
       (BENA => QA[11]) = (1.000, 1.000);
    if (TQA[11] == 1'b0)
       (BENA => QA[11]) = (1.000, 1.000);
    if (TQA[10] == 1'b1)
       (BENA => QA[10]) = (1.000, 1.000);
    if (TQA[10] == 1'b0)
       (BENA => QA[10]) = (1.000, 1.000);
    if (TQA[9] == 1'b1)
       (BENA => QA[9]) = (1.000, 1.000);
    if (TQA[9] == 1'b0)
       (BENA => QA[9]) = (1.000, 1.000);
    if (TQA[8] == 1'b1)
       (BENA => QA[8]) = (1.000, 1.000);
    if (TQA[8] == 1'b0)
       (BENA => QA[8]) = (1.000, 1.000);
    if (TQA[7] == 1'b1)
       (BENA => QA[7]) = (1.000, 1.000);
    if (TQA[7] == 1'b0)
       (BENA => QA[7]) = (1.000, 1.000);
    if (TQA[6] == 1'b1)
       (BENA => QA[6]) = (1.000, 1.000);
    if (TQA[6] == 1'b0)
       (BENA => QA[6]) = (1.000, 1.000);
    if (TQA[5] == 1'b1)
       (BENA => QA[5]) = (1.000, 1.000);
    if (TQA[5] == 1'b0)
       (BENA => QA[5]) = (1.000, 1.000);
    if (TQA[4] == 1'b1)
       (BENA => QA[4]) = (1.000, 1.000);
    if (TQA[4] == 1'b0)
       (BENA => QA[4]) = (1.000, 1.000);
    if (TQA[3] == 1'b1)
       (BENA => QA[3]) = (1.000, 1.000);
    if (TQA[3] == 1'b0)
       (BENA => QA[3]) = (1.000, 1.000);
    if (TQA[2] == 1'b1)
       (BENA => QA[2]) = (1.000, 1.000);
    if (TQA[2] == 1'b0)
       (BENA => QA[2]) = (1.000, 1.000);
    if (TQA[1] == 1'b1)
       (BENA => QA[1]) = (1.000, 1.000);
    if (TQA[1] == 1'b0)
       (BENA => QA[1]) = (1.000, 1.000);
    if (TQA[0] == 1'b1)
       (BENA => QA[0]) = (1.000, 1.000);
    if (TQA[0] == 1'b0)
       (BENA => QA[0]) = (1.000, 1.000);
    if (BENA == 1'b0)
       (TQA[123] => QA[123]) = (1.000, 1.000);
    if (BENA == 1'b0)
       (TQA[122] => QA[122]) = (1.000, 1.000);
    if (BENA == 1'b0)
       (TQA[121] => QA[121]) = (1.000, 1.000);
    if (BENA == 1'b0)
       (TQA[120] => QA[120]) = (1.000, 1.000);
    if (BENA == 1'b0)
       (TQA[119] => QA[119]) = (1.000, 1.000);
    if (BENA == 1'b0)
       (TQA[118] => QA[118]) = (1.000, 1.000);
    if (BENA == 1'b0)
       (TQA[117] => QA[117]) = (1.000, 1.000);
    if (BENA == 1'b0)
       (TQA[116] => QA[116]) = (1.000, 1.000);
    if (BENA == 1'b0)
       (TQA[115] => QA[115]) = (1.000, 1.000);
    if (BENA == 1'b0)
       (TQA[114] => QA[114]) = (1.000, 1.000);
    if (BENA == 1'b0)
       (TQA[113] => QA[113]) = (1.000, 1.000);
    if (BENA == 1'b0)
       (TQA[112] => QA[112]) = (1.000, 1.000);
    if (BENA == 1'b0)
       (TQA[111] => QA[111]) = (1.000, 1.000);
    if (BENA == 1'b0)
       (TQA[110] => QA[110]) = (1.000, 1.000);
    if (BENA == 1'b0)
       (TQA[109] => QA[109]) = (1.000, 1.000);
    if (BENA == 1'b0)
       (TQA[108] => QA[108]) = (1.000, 1.000);
    if (BENA == 1'b0)
       (TQA[107] => QA[107]) = (1.000, 1.000);
    if (BENA == 1'b0)
       (TQA[106] => QA[106]) = (1.000, 1.000);
    if (BENA == 1'b0)
       (TQA[105] => QA[105]) = (1.000, 1.000);
    if (BENA == 1'b0)
       (TQA[104] => QA[104]) = (1.000, 1.000);
    if (BENA == 1'b0)
       (TQA[103] => QA[103]) = (1.000, 1.000);
    if (BENA == 1'b0)
       (TQA[102] => QA[102]) = (1.000, 1.000);
    if (BENA == 1'b0)
       (TQA[101] => QA[101]) = (1.000, 1.000);
    if (BENA == 1'b0)
       (TQA[100] => QA[100]) = (1.000, 1.000);
    if (BENA == 1'b0)
       (TQA[99] => QA[99]) = (1.000, 1.000);
    if (BENA == 1'b0)
       (TQA[98] => QA[98]) = (1.000, 1.000);
    if (BENA == 1'b0)
       (TQA[97] => QA[97]) = (1.000, 1.000);
    if (BENA == 1'b0)
       (TQA[96] => QA[96]) = (1.000, 1.000);
    if (BENA == 1'b0)
       (TQA[95] => QA[95]) = (1.000, 1.000);
    if (BENA == 1'b0)
       (TQA[94] => QA[94]) = (1.000, 1.000);
    if (BENA == 1'b0)
       (TQA[93] => QA[93]) = (1.000, 1.000);
    if (BENA == 1'b0)
       (TQA[92] => QA[92]) = (1.000, 1.000);
    if (BENA == 1'b0)
       (TQA[91] => QA[91]) = (1.000, 1.000);
    if (BENA == 1'b0)
       (TQA[90] => QA[90]) = (1.000, 1.000);
    if (BENA == 1'b0)
       (TQA[89] => QA[89]) = (1.000, 1.000);
    if (BENA == 1'b0)
       (TQA[88] => QA[88]) = (1.000, 1.000);
    if (BENA == 1'b0)
       (TQA[87] => QA[87]) = (1.000, 1.000);
    if (BENA == 1'b0)
       (TQA[86] => QA[86]) = (1.000, 1.000);
    if (BENA == 1'b0)
       (TQA[85] => QA[85]) = (1.000, 1.000);
    if (BENA == 1'b0)
       (TQA[84] => QA[84]) = (1.000, 1.000);
    if (BENA == 1'b0)
       (TQA[83] => QA[83]) = (1.000, 1.000);
    if (BENA == 1'b0)
       (TQA[82] => QA[82]) = (1.000, 1.000);
    if (BENA == 1'b0)
       (TQA[81] => QA[81]) = (1.000, 1.000);
    if (BENA == 1'b0)
       (TQA[80] => QA[80]) = (1.000, 1.000);
    if (BENA == 1'b0)
       (TQA[79] => QA[79]) = (1.000, 1.000);
    if (BENA == 1'b0)
       (TQA[78] => QA[78]) = (1.000, 1.000);
    if (BENA == 1'b0)
       (TQA[77] => QA[77]) = (1.000, 1.000);
    if (BENA == 1'b0)
       (TQA[76] => QA[76]) = (1.000, 1.000);
    if (BENA == 1'b0)
       (TQA[75] => QA[75]) = (1.000, 1.000);
    if (BENA == 1'b0)
       (TQA[74] => QA[74]) = (1.000, 1.000);
    if (BENA == 1'b0)
       (TQA[73] => QA[73]) = (1.000, 1.000);
    if (BENA == 1'b0)
       (TQA[72] => QA[72]) = (1.000, 1.000);
    if (BENA == 1'b0)
       (TQA[71] => QA[71]) = (1.000, 1.000);
    if (BENA == 1'b0)
       (TQA[70] => QA[70]) = (1.000, 1.000);
    if (BENA == 1'b0)
       (TQA[69] => QA[69]) = (1.000, 1.000);
    if (BENA == 1'b0)
       (TQA[68] => QA[68]) = (1.000, 1.000);
    if (BENA == 1'b0)
       (TQA[67] => QA[67]) = (1.000, 1.000);
    if (BENA == 1'b0)
       (TQA[66] => QA[66]) = (1.000, 1.000);
    if (BENA == 1'b0)
       (TQA[65] => QA[65]) = (1.000, 1.000);
    if (BENA == 1'b0)
       (TQA[64] => QA[64]) = (1.000, 1.000);
    if (BENA == 1'b0)
       (TQA[63] => QA[63]) = (1.000, 1.000);
    if (BENA == 1'b0)
       (TQA[62] => QA[62]) = (1.000, 1.000);
    if (BENA == 1'b0)
       (TQA[61] => QA[61]) = (1.000, 1.000);
    if (BENA == 1'b0)
       (TQA[60] => QA[60]) = (1.000, 1.000);
    if (BENA == 1'b0)
       (TQA[59] => QA[59]) = (1.000, 1.000);
    if (BENA == 1'b0)
       (TQA[58] => QA[58]) = (1.000, 1.000);
    if (BENA == 1'b0)
       (TQA[57] => QA[57]) = (1.000, 1.000);
    if (BENA == 1'b0)
       (TQA[56] => QA[56]) = (1.000, 1.000);
    if (BENA == 1'b0)
       (TQA[55] => QA[55]) = (1.000, 1.000);
    if (BENA == 1'b0)
       (TQA[54] => QA[54]) = (1.000, 1.000);
    if (BENA == 1'b0)
       (TQA[53] => QA[53]) = (1.000, 1.000);
    if (BENA == 1'b0)
       (TQA[52] => QA[52]) = (1.000, 1.000);
    if (BENA == 1'b0)
       (TQA[51] => QA[51]) = (1.000, 1.000);
    if (BENA == 1'b0)
       (TQA[50] => QA[50]) = (1.000, 1.000);
    if (BENA == 1'b0)
       (TQA[49] => QA[49]) = (1.000, 1.000);
    if (BENA == 1'b0)
       (TQA[48] => QA[48]) = (1.000, 1.000);
    if (BENA == 1'b0)
       (TQA[47] => QA[47]) = (1.000, 1.000);
    if (BENA == 1'b0)
       (TQA[46] => QA[46]) = (1.000, 1.000);
    if (BENA == 1'b0)
       (TQA[45] => QA[45]) = (1.000, 1.000);
    if (BENA == 1'b0)
       (TQA[44] => QA[44]) = (1.000, 1.000);
    if (BENA == 1'b0)
       (TQA[43] => QA[43]) = (1.000, 1.000);
    if (BENA == 1'b0)
       (TQA[42] => QA[42]) = (1.000, 1.000);
    if (BENA == 1'b0)
       (TQA[41] => QA[41]) = (1.000, 1.000);
    if (BENA == 1'b0)
       (TQA[40] => QA[40]) = (1.000, 1.000);
    if (BENA == 1'b0)
       (TQA[39] => QA[39]) = (1.000, 1.000);
    if (BENA == 1'b0)
       (TQA[38] => QA[38]) = (1.000, 1.000);
    if (BENA == 1'b0)
       (TQA[37] => QA[37]) = (1.000, 1.000);
    if (BENA == 1'b0)
       (TQA[36] => QA[36]) = (1.000, 1.000);
    if (BENA == 1'b0)
       (TQA[35] => QA[35]) = (1.000, 1.000);
    if (BENA == 1'b0)
       (TQA[34] => QA[34]) = (1.000, 1.000);
    if (BENA == 1'b0)
       (TQA[33] => QA[33]) = (1.000, 1.000);
    if (BENA == 1'b0)
       (TQA[32] => QA[32]) = (1.000, 1.000);
    if (BENA == 1'b0)
       (TQA[31] => QA[31]) = (1.000, 1.000);
    if (BENA == 1'b0)
       (TQA[30] => QA[30]) = (1.000, 1.000);
    if (BENA == 1'b0)
       (TQA[29] => QA[29]) = (1.000, 1.000);
    if (BENA == 1'b0)
       (TQA[28] => QA[28]) = (1.000, 1.000);
    if (BENA == 1'b0)
       (TQA[27] => QA[27]) = (1.000, 1.000);
    if (BENA == 1'b0)
       (TQA[26] => QA[26]) = (1.000, 1.000);
    if (BENA == 1'b0)
       (TQA[25] => QA[25]) = (1.000, 1.000);
    if (BENA == 1'b0)
       (TQA[24] => QA[24]) = (1.000, 1.000);
    if (BENA == 1'b0)
       (TQA[23] => QA[23]) = (1.000, 1.000);
    if (BENA == 1'b0)
       (TQA[22] => QA[22]) = (1.000, 1.000);
    if (BENA == 1'b0)
       (TQA[21] => QA[21]) = (1.000, 1.000);
    if (BENA == 1'b0)
       (TQA[20] => QA[20]) = (1.000, 1.000);
    if (BENA == 1'b0)
       (TQA[19] => QA[19]) = (1.000, 1.000);
    if (BENA == 1'b0)
       (TQA[18] => QA[18]) = (1.000, 1.000);
    if (BENA == 1'b0)
       (TQA[17] => QA[17]) = (1.000, 1.000);
    if (BENA == 1'b0)
       (TQA[16] => QA[16]) = (1.000, 1.000);
    if (BENA == 1'b0)
       (TQA[15] => QA[15]) = (1.000, 1.000);
    if (BENA == 1'b0)
       (TQA[14] => QA[14]) = (1.000, 1.000);
    if (BENA == 1'b0)
       (TQA[13] => QA[13]) = (1.000, 1.000);
    if (BENA == 1'b0)
       (TQA[12] => QA[12]) = (1.000, 1.000);
    if (BENA == 1'b0)
       (TQA[11] => QA[11]) = (1.000, 1.000);
    if (BENA == 1'b0)
       (TQA[10] => QA[10]) = (1.000, 1.000);
    if (BENA == 1'b0)
       (TQA[9] => QA[9]) = (1.000, 1.000);
    if (BENA == 1'b0)
       (TQA[8] => QA[8]) = (1.000, 1.000);
    if (BENA == 1'b0)
       (TQA[7] => QA[7]) = (1.000, 1.000);
    if (BENA == 1'b0)
       (TQA[6] => QA[6]) = (1.000, 1.000);
    if (BENA == 1'b0)
       (TQA[5] => QA[5]) = (1.000, 1.000);
    if (BENA == 1'b0)
       (TQA[4] => QA[4]) = (1.000, 1.000);
    if (BENA == 1'b0)
       (TQA[3] => QA[3]) = (1.000, 1.000);
    if (BENA == 1'b0)
       (TQA[2] => QA[2]) = (1.000, 1.000);
    if (BENA == 1'b0)
       (TQA[1] => QA[1]) = (1.000, 1.000);
    if (BENA == 1'b0)
       (TQA[0] => QA[0]) = (1.000, 1.000);

    $setuphold(posedge CLKB &&& contA_STOVAeq0andEMAA2eq0andEMAA1eq0andEMAA0eq0, posedge CLKA, 3.000, 0.000, NOT_CONTA);
    $setuphold(posedge CLKB &&& contA_STOVAeq0andEMAA2eq0andEMAA1eq0andEMAA0eq1, posedge CLKA, 3.000, 0.000, NOT_CONTA);
    $setuphold(posedge CLKB &&& contA_STOVAeq0andEMAA2eq0andEMAA1eq1andEMAA0eq0, posedge CLKA, 3.000, 0.000, NOT_CONTA);
    $setuphold(posedge CLKB &&& contA_STOVAeq0andEMAA2eq0andEMAA1eq1andEMAA0eq1, posedge CLKA, 3.000, 0.000, NOT_CONTA);
    $setuphold(posedge CLKB &&& contA_STOVAeq0andEMAA2eq1andEMAA1eq0andEMAA0eq0, posedge CLKA, 3.000, 0.000, NOT_CONTA);
    $setuphold(posedge CLKB &&& contA_STOVAeq0andEMAA2eq1andEMAA1eq0andEMAA0eq1, posedge CLKA, 3.000, 0.000, NOT_CONTA);
    $setuphold(posedge CLKB &&& contA_STOVAeq0andEMAA2eq1andEMAA1eq1andEMAA0eq0, posedge CLKA, 3.000, 0.000, NOT_CONTA);
    $setuphold(posedge CLKB &&& contA_STOVAeq0andEMAA2eq1andEMAA1eq1andEMAA0eq1, posedge CLKA, 3.000, 0.000, NOT_CONTA);
    $setuphold(posedge CLKB &&& contA_STOVAeq1, posedge CLKA, 3.000, 0.000, NOT_CONTA);

// Define SDTC only if back-annotating SDF file generated by Design Compiler
   // `ifdef NO_SDTC
   //     $period(posedge CLKA, 3.000, NOT_CLKA_PER);
   // `else
   //     $period(posedge CLKA &&& STOVAeq0andEMAA2eq0andEMAA1eq0andEMAA0eq0andEMASAeq0, 3.000, NOT_CLKA_PER);
   //     $period(posedge CLKA &&& STOVAeq0andEMAA2eq0andEMAA1eq0andEMAA0eq0andEMASAeq1, 3.000, NOT_CLKA_PER);
   //     $period(posedge CLKA &&& STOVAeq0andEMAA2eq0andEMAA1eq0andEMAA0eq1andEMASAeq0, 3.000, NOT_CLKA_PER);
   //     $period(posedge CLKA &&& STOVAeq0andEMAA2eq0andEMAA1eq0andEMAA0eq1andEMASAeq1, 3.000, NOT_CLKA_PER);
   //     $period(posedge CLKA &&& STOVAeq0andEMAA2eq0andEMAA1eq1andEMAA0eq0andEMASAeq0, 3.000, NOT_CLKA_PER);
   //     $period(posedge CLKA &&& STOVAeq0andEMAA2eq0andEMAA1eq1andEMAA0eq0andEMASAeq1, 3.000, NOT_CLKA_PER);
   //     $period(posedge CLKA &&& STOVAeq0andEMAA2eq0andEMAA1eq1andEMAA0eq1andEMASAeq0, 3.000, NOT_CLKA_PER);
   //     $period(posedge CLKA &&& STOVAeq0andEMAA2eq0andEMAA1eq1andEMAA0eq1andEMASAeq1, 3.000, NOT_CLKA_PER);
   //     $period(posedge CLKA &&& STOVAeq0andEMAA2eq1andEMAA1eq0andEMAA0eq0andEMASAeq0, 3.000, NOT_CLKA_PER);
   //     $period(posedge CLKA &&& STOVAeq0andEMAA2eq1andEMAA1eq0andEMAA0eq0andEMASAeq1, 3.000, NOT_CLKA_PER);
   //     $period(posedge CLKA &&& STOVAeq0andEMAA2eq1andEMAA1eq0andEMAA0eq1andEMASAeq0, 3.000, NOT_CLKA_PER);
   //     $period(posedge CLKA &&& STOVAeq0andEMAA2eq1andEMAA1eq0andEMAA0eq1andEMASAeq1, 3.000, NOT_CLKA_PER);
   //     $period(posedge CLKA &&& STOVAeq0andEMAA2eq1andEMAA1eq1andEMAA0eq0andEMASAeq0, 3.000, NOT_CLKA_PER);
   //     $period(posedge CLKA &&& STOVAeq0andEMAA2eq1andEMAA1eq1andEMAA0eq0andEMASAeq1, 3.000, NOT_CLKA_PER);
   //     $period(posedge CLKA &&& STOVAeq0andEMAA2eq1andEMAA1eq1andEMAA0eq1andEMASAeq0, 3.000, NOT_CLKA_PER);
   //     $period(posedge CLKA &&& STOVAeq0andEMAA2eq1andEMAA1eq1andEMAA0eq1andEMASAeq1, 3.000, NOT_CLKA_PER);
   //     $period(negedge CLKA &&& STOVAeq1andEMASAeq0, 3.000, NOT_CLKA_PER);
   //     $period(negedge CLKA &&& STOVAeq1andEMASAeq1, 3.000, NOT_CLKA_PER);
   // `endif

// Define SDTC only if back-annotating SDF file generated by Design Compiler
   `ifdef NO_SDTC
       $width(posedge CLKA, 1.000, 0, NOT_CLKA_MINH);
       $width(negedge CLKA, 1.000, 0, NOT_CLKA_MINL);
   `else
       $width(posedge CLKA &&& STOVAeq0, 1.000, 0, NOT_CLKA_MINH);
       $width(negedge CLKA &&& STOVAeq0, 1.000, 0, NOT_CLKA_MINL);
       $width(posedge CLKA &&& STOVAeq1andEMASAeq0, 1.000, 0, NOT_CLKA_MINH);
       $width(negedge CLKA &&& STOVAeq1andEMASAeq0, 1.000, 0, NOT_CLKA_MINL);
       $width(posedge CLKA &&& STOVAeq1andEMASAeq1, 1.000, 0, NOT_CLKA_MINH);
       $width(negedge CLKA &&& STOVAeq1andEMASAeq1, 1.000, 0, NOT_CLKA_MINL);
   `endif

    $setuphold(posedge CLKA &&& TENAeq1, posedge CENA, 1.000, 0.500, NOT_CENA);
    $setuphold(posedge CLKA &&& TENAeq1, negedge CENA, 1.000, 0.500, NOT_CENA);
    $setuphold(posedge RET1N &&& TENAeq1, negedge CENA, 0.000, 0.500, NOT_RET1N);
    $setuphold(posedge CLKA &&& TENAeq1andCENAeq0, posedge AA[8], 1.000, 0.500, NOT_AA8);
    $setuphold(posedge CLKA &&& TENAeq1andCENAeq0, posedge AA[7], 1.000, 0.500, NOT_AA7);
    $setuphold(posedge CLKA &&& TENAeq1andCENAeq0, posedge AA[6], 1.000, 0.500, NOT_AA6);
    $setuphold(posedge CLKA &&& TENAeq1andCENAeq0, posedge AA[5], 1.000, 0.500, NOT_AA5);
    $setuphold(posedge CLKA &&& TENAeq1andCENAeq0, posedge AA[4], 1.000, 0.500, NOT_AA4);
    $setuphold(posedge CLKA &&& TENAeq1andCENAeq0, posedge AA[3], 1.000, 0.500, NOT_AA3);
    $setuphold(posedge CLKA &&& TENAeq1andCENAeq0, posedge AA[2], 1.000, 0.500, NOT_AA2);
    $setuphold(posedge CLKA &&& TENAeq1andCENAeq0, posedge AA[1], 1.000, 0.500, NOT_AA1);
    $setuphold(posedge CLKA &&& TENAeq1andCENAeq0, posedge AA[0], 1.000, 0.500, NOT_AA0);
    $setuphold(posedge CLKA &&& TENAeq1andCENAeq0, negedge AA[8], 1.000, 0.500, NOT_AA8);
    $setuphold(posedge CLKA &&& TENAeq1andCENAeq0, negedge AA[7], 1.000, 0.500, NOT_AA7);
    $setuphold(posedge CLKA &&& TENAeq1andCENAeq0, negedge AA[6], 1.000, 0.500, NOT_AA6);
    $setuphold(posedge CLKA &&& TENAeq1andCENAeq0, negedge AA[5], 1.000, 0.500, NOT_AA5);
    $setuphold(posedge CLKA &&& TENAeq1andCENAeq0, negedge AA[4], 1.000, 0.500, NOT_AA4);
    $setuphold(posedge CLKA &&& TENAeq1andCENAeq0, negedge AA[3], 1.000, 0.500, NOT_AA3);
    $setuphold(posedge CLKA &&& TENAeq1andCENAeq0, negedge AA[2], 1.000, 0.500, NOT_AA2);
    $setuphold(posedge CLKA &&& TENAeq1andCENAeq0, negedge AA[1], 1.000, 0.500, NOT_AA1);
    $setuphold(posedge CLKA &&& TENAeq1andCENAeq0, negedge AA[0], 1.000, 0.500, NOT_AA0);
    $setuphold(posedge CLKA &&& contB_STOVBeq0andEMAB2eq0andEMAB1eq0andEMAB0eq0andEMAWB1eq0andEMAWB0eq0, posedge CLKB, 3.000, 0.000, NOT_CONTB);
    $setuphold(posedge CLKA &&& contB_STOVBeq0andEMAB2eq0andEMAB1eq0andEMAB0eq0andEMAWB1eq0andEMAWB0eq1, posedge CLKB, 3.000, 0.000, NOT_CONTB);
    $setuphold(posedge CLKA &&& contB_STOVBeq0andEMAB2eq0andEMAB1eq0andEMAB0eq0andEMAWB1eq1andEMAWB0eq0, posedge CLKB, 3.000, 0.000, NOT_CONTB);
    $setuphold(posedge CLKA &&& contB_STOVBeq0andEMAB2eq0andEMAB1eq0andEMAB0eq0andEMAWB1eq1andEMAWB0eq1, posedge CLKB, 3.000, 0.000, NOT_CONTB);
    $setuphold(posedge CLKA &&& contB_STOVBeq0andEMAB2eq0andEMAB1eq0andEMAB0eq1andEMAWB1eq0andEMAWB0eq0, posedge CLKB, 3.000, 0.000, NOT_CONTB);
    $setuphold(posedge CLKA &&& contB_STOVBeq0andEMAB2eq0andEMAB1eq0andEMAB0eq1andEMAWB1eq0andEMAWB0eq1, posedge CLKB, 3.000, 0.000, NOT_CONTB);
    $setuphold(posedge CLKA &&& contB_STOVBeq0andEMAB2eq0andEMAB1eq0andEMAB0eq1andEMAWB1eq1andEMAWB0eq0, posedge CLKB, 3.000, 0.000, NOT_CONTB);
    $setuphold(posedge CLKA &&& contB_STOVBeq0andEMAB2eq0andEMAB1eq0andEMAB0eq1andEMAWB1eq1andEMAWB0eq1, posedge CLKB, 3.000, 0.000, NOT_CONTB);
    $setuphold(posedge CLKA &&& contB_STOVBeq0andEMAB2eq0andEMAB1eq1andEMAB0eq0andEMAWB1eq0andEMAWB0eq0, posedge CLKB, 3.000, 0.000, NOT_CONTB);
    $setuphold(posedge CLKA &&& contB_STOVBeq0andEMAB2eq0andEMAB1eq1andEMAB0eq0andEMAWB1eq0andEMAWB0eq1, posedge CLKB, 3.000, 0.000, NOT_CONTB);
    $setuphold(posedge CLKA &&& contB_STOVBeq0andEMAB2eq0andEMAB1eq1andEMAB0eq0andEMAWB1eq1andEMAWB0eq0, posedge CLKB, 3.000, 0.000, NOT_CONTB);
    $setuphold(posedge CLKA &&& contB_STOVBeq0andEMAB2eq0andEMAB1eq1andEMAB0eq0andEMAWB1eq1andEMAWB0eq1, posedge CLKB, 3.000, 0.000, NOT_CONTB);
    $setuphold(posedge CLKA &&& contB_STOVBeq0andEMAB2eq0andEMAB1eq1andEMAB0eq1andEMAWB1eq0andEMAWB0eq0, posedge CLKB, 3.000, 0.000, NOT_CONTB);
    $setuphold(posedge CLKA &&& contB_STOVBeq0andEMAB2eq0andEMAB1eq1andEMAB0eq1andEMAWB1eq0andEMAWB0eq1, posedge CLKB, 3.000, 0.000, NOT_CONTB);
    $setuphold(posedge CLKA &&& contB_STOVBeq0andEMAB2eq0andEMAB1eq1andEMAB0eq1andEMAWB1eq1andEMAWB0eq0, posedge CLKB, 3.000, 0.000, NOT_CONTB);
    $setuphold(posedge CLKA &&& contB_STOVBeq0andEMAB2eq0andEMAB1eq1andEMAB0eq1andEMAWB1eq1andEMAWB0eq1, posedge CLKB, 3.000, 0.000, NOT_CONTB);
    $setuphold(posedge CLKA &&& contB_STOVBeq0andEMAB2eq1andEMAB1eq0andEMAB0eq0andEMAWB1eq0andEMAWB0eq0, posedge CLKB, 3.000, 0.000, NOT_CONTB);
    $setuphold(posedge CLKA &&& contB_STOVBeq0andEMAB2eq1andEMAB1eq0andEMAB0eq0andEMAWB1eq0andEMAWB0eq1, posedge CLKB, 3.000, 0.000, NOT_CONTB);
    $setuphold(posedge CLKA &&& contB_STOVBeq0andEMAB2eq1andEMAB1eq0andEMAB0eq0andEMAWB1eq1andEMAWB0eq0, posedge CLKB, 3.000, 0.000, NOT_CONTB);
    $setuphold(posedge CLKA &&& contB_STOVBeq0andEMAB2eq1andEMAB1eq0andEMAB0eq0andEMAWB1eq1andEMAWB0eq1, posedge CLKB, 3.000, 0.000, NOT_CONTB);
    $setuphold(posedge CLKA &&& contB_STOVBeq0andEMAB2eq1andEMAB1eq0andEMAB0eq1andEMAWB1eq0andEMAWB0eq0, posedge CLKB, 3.000, 0.000, NOT_CONTB);
    $setuphold(posedge CLKA &&& contB_STOVBeq0andEMAB2eq1andEMAB1eq0andEMAB0eq1andEMAWB1eq0andEMAWB0eq1, posedge CLKB, 3.000, 0.000, NOT_CONTB);
    $setuphold(posedge CLKA &&& contB_STOVBeq0andEMAB2eq1andEMAB1eq0andEMAB0eq1andEMAWB1eq1andEMAWB0eq0, posedge CLKB, 3.000, 0.000, NOT_CONTB);
    $setuphold(posedge CLKA &&& contB_STOVBeq0andEMAB2eq1andEMAB1eq0andEMAB0eq1andEMAWB1eq1andEMAWB0eq1, posedge CLKB, 3.000, 0.000, NOT_CONTB);
    $setuphold(posedge CLKA &&& contB_STOVBeq0andEMAB2eq1andEMAB1eq1andEMAB0eq0andEMAWB1eq0andEMAWB0eq0, posedge CLKB, 3.000, 0.000, NOT_CONTB);
    $setuphold(posedge CLKA &&& contB_STOVBeq0andEMAB2eq1andEMAB1eq1andEMAB0eq0andEMAWB1eq0andEMAWB0eq1, posedge CLKB, 3.000, 0.000, NOT_CONTB);
    $setuphold(posedge CLKA &&& contB_STOVBeq0andEMAB2eq1andEMAB1eq1andEMAB0eq0andEMAWB1eq1andEMAWB0eq0, posedge CLKB, 3.000, 0.000, NOT_CONTB);
    $setuphold(posedge CLKA &&& contB_STOVBeq0andEMAB2eq1andEMAB1eq1andEMAB0eq0andEMAWB1eq1andEMAWB0eq1, posedge CLKB, 3.000, 0.000, NOT_CONTB);
    $setuphold(posedge CLKA &&& contB_STOVBeq0andEMAB2eq1andEMAB1eq1andEMAB0eq1andEMAWB1eq0andEMAWB0eq0, posedge CLKB, 3.000, 0.000, NOT_CONTB);
    $setuphold(posedge CLKA &&& contB_STOVBeq0andEMAB2eq1andEMAB1eq1andEMAB0eq1andEMAWB1eq0andEMAWB0eq1, posedge CLKB, 3.000, 0.000, NOT_CONTB);
    $setuphold(posedge CLKA &&& contB_STOVBeq0andEMAB2eq1andEMAB1eq1andEMAB0eq1andEMAWB1eq1andEMAWB0eq0, posedge CLKB, 3.000, 0.000, NOT_CONTB);
    $setuphold(posedge CLKA &&& contB_STOVBeq0andEMAB2eq1andEMAB1eq1andEMAB0eq1andEMAWB1eq1andEMAWB0eq1, posedge CLKB, 3.000, 0.000, NOT_CONTB);
    $setuphold(posedge CLKA &&& contB_STOVBeq1, posedge CLKB, 3.000, 0.000, NOT_CONTB);

// Define SDTC only if back-annotating SDF file generated by Design Compiler
   // `ifdef NO_SDTC
   //     $period(posedge CLKB, 3.000, NOT_CLKB_PER);
   // `else
   //     $period(posedge CLKB &&& STOVBeq0andEMAB2eq0andEMAB1eq0andEMAB0eq0andEMAWB1eq0andEMAWB0eq0, 3.000, NOT_CLKB_PER);
   //     $period(posedge CLKB &&& STOVBeq0andEMAB2eq0andEMAB1eq0andEMAB0eq0andEMAWB1eq0andEMAWB0eq1, 3.000, NOT_CLKB_PER);
   //     $period(posedge CLKB &&& STOVBeq0andEMAB2eq0andEMAB1eq0andEMAB0eq0andEMAWB1eq1andEMAWB0eq0, 3.000, NOT_CLKB_PER);
   //     $period(posedge CLKB &&& STOVBeq0andEMAB2eq0andEMAB1eq0andEMAB0eq0andEMAWB1eq1andEMAWB0eq1, 3.000, NOT_CLKB_PER);
   //     $period(posedge CLKB &&& STOVBeq0andEMAB2eq0andEMAB1eq0andEMAB0eq1andEMAWB1eq0andEMAWB0eq0, 3.000, NOT_CLKB_PER);
   //     $period(posedge CLKB &&& STOVBeq0andEMAB2eq0andEMAB1eq0andEMAB0eq1andEMAWB1eq0andEMAWB0eq1, 3.000, NOT_CLKB_PER);
   //     $period(posedge CLKB &&& STOVBeq0andEMAB2eq0andEMAB1eq0andEMAB0eq1andEMAWB1eq1andEMAWB0eq0, 3.000, NOT_CLKB_PER);
   //     $period(posedge CLKB &&& STOVBeq0andEMAB2eq0andEMAB1eq0andEMAB0eq1andEMAWB1eq1andEMAWB0eq1, 3.000, NOT_CLKB_PER);
   //     $period(posedge CLKB &&& STOVBeq0andEMAB2eq0andEMAB1eq1andEMAB0eq0andEMAWB1eq0andEMAWB0eq0, 3.000, NOT_CLKB_PER);
   //     $period(posedge CLKB &&& STOVBeq0andEMAB2eq0andEMAB1eq1andEMAB0eq0andEMAWB1eq0andEMAWB0eq1, 3.000, NOT_CLKB_PER);
   //     $period(posedge CLKB &&& STOVBeq0andEMAB2eq0andEMAB1eq1andEMAB0eq0andEMAWB1eq1andEMAWB0eq0, 3.000, NOT_CLKB_PER);
   //     $period(posedge CLKB &&& STOVBeq0andEMAB2eq0andEMAB1eq1andEMAB0eq0andEMAWB1eq1andEMAWB0eq1, 3.000, NOT_CLKB_PER);
   //     $period(posedge CLKB &&& STOVBeq0andEMAB2eq0andEMAB1eq1andEMAB0eq1andEMAWB1eq0andEMAWB0eq0, 3.000, NOT_CLKB_PER);
   //     $period(posedge CLKB &&& STOVBeq0andEMAB2eq0andEMAB1eq1andEMAB0eq1andEMAWB1eq0andEMAWB0eq1, 3.000, NOT_CLKB_PER);
   //     $period(posedge CLKB &&& STOVBeq0andEMAB2eq0andEMAB1eq1andEMAB0eq1andEMAWB1eq1andEMAWB0eq0, 3.000, NOT_CLKB_PER);
   //     $period(posedge CLKB &&& STOVBeq0andEMAB2eq0andEMAB1eq1andEMAB0eq1andEMAWB1eq1andEMAWB0eq1, 3.000, NOT_CLKB_PER);
   //     $period(posedge CLKB &&& STOVBeq0andEMAB2eq1andEMAB1eq0andEMAB0eq0andEMAWB1eq0andEMAWB0eq0, 3.000, NOT_CLKB_PER);
   //     $period(posedge CLKB &&& STOVBeq0andEMAB2eq1andEMAB1eq0andEMAB0eq0andEMAWB1eq0andEMAWB0eq1, 3.000, NOT_CLKB_PER);
   //     $period(posedge CLKB &&& STOVBeq0andEMAB2eq1andEMAB1eq0andEMAB0eq0andEMAWB1eq1andEMAWB0eq0, 3.000, NOT_CLKB_PER);
   //     $period(posedge CLKB &&& STOVBeq0andEMAB2eq1andEMAB1eq0andEMAB0eq0andEMAWB1eq1andEMAWB0eq1, 3.000, NOT_CLKB_PER);
   //     $period(posedge CLKB &&& STOVBeq0andEMAB2eq1andEMAB1eq0andEMAB0eq1andEMAWB1eq0andEMAWB0eq0, 3.000, NOT_CLKB_PER);
   //     $period(posedge CLKB &&& STOVBeq0andEMAB2eq1andEMAB1eq0andEMAB0eq1andEMAWB1eq0andEMAWB0eq1, 3.000, NOT_CLKB_PER);
   //     $period(posedge CLKB &&& STOVBeq0andEMAB2eq1andEMAB1eq0andEMAB0eq1andEMAWB1eq1andEMAWB0eq0, 3.000, NOT_CLKB_PER);
   //     $period(posedge CLKB &&& STOVBeq0andEMAB2eq1andEMAB1eq0andEMAB0eq1andEMAWB1eq1andEMAWB0eq1, 3.000, NOT_CLKB_PER);
   //     $period(posedge CLKB &&& STOVBeq0andEMAB2eq1andEMAB1eq1andEMAB0eq0andEMAWB1eq0andEMAWB0eq0, 3.000, NOT_CLKB_PER);
   //     $period(posedge CLKB &&& STOVBeq0andEMAB2eq1andEMAB1eq1andEMAB0eq0andEMAWB1eq0andEMAWB0eq1, 3.000, NOT_CLKB_PER);
   //     $period(posedge CLKB &&& STOVBeq0andEMAB2eq1andEMAB1eq1andEMAB0eq0andEMAWB1eq1andEMAWB0eq0, 3.000, NOT_CLKB_PER);
   //     $period(posedge CLKB &&& STOVBeq0andEMAB2eq1andEMAB1eq1andEMAB0eq0andEMAWB1eq1andEMAWB0eq1, 3.000, NOT_CLKB_PER);
   //     $period(posedge CLKB &&& STOVBeq0andEMAB2eq1andEMAB1eq1andEMAB0eq1andEMAWB1eq0andEMAWB0eq0, 3.000, NOT_CLKB_PER);
   //     $period(posedge CLKB &&& STOVBeq0andEMAB2eq1andEMAB1eq1andEMAB0eq1andEMAWB1eq0andEMAWB0eq1, 3.000, NOT_CLKB_PER);
   //     $period(posedge CLKB &&& STOVBeq0andEMAB2eq1andEMAB1eq1andEMAB0eq1andEMAWB1eq1andEMAWB0eq0, 3.000, NOT_CLKB_PER);
   //     $period(posedge CLKB &&& STOVBeq0andEMAB2eq1andEMAB1eq1andEMAB0eq1andEMAWB1eq1andEMAWB0eq1, 3.000, NOT_CLKB_PER);
   //     $period(posedge CLKB &&& STOVBeq1, 3.000, NOT_CLKB_PER);
   // `endif

// Define SDTC only if back-annotating SDF file generated by Design Compiler
   `ifdef NO_SDTC
       $width(posedge CLKB, 1.000, 0, NOT_CLKB_MINH);
       $width(negedge CLKB, 1.000, 0, NOT_CLKB_MINL);
   `else
       $width(posedge CLKB &&& STOVBeq0, 1.000, 0, NOT_CLKB_MINH);
       $width(negedge CLKB &&& STOVBeq0, 1.000, 0, NOT_CLKB_MINL);
       $width(posedge CLKB &&& STOVBeq1, 1.000, 0, NOT_CLKB_MINH);
       $width(negedge CLKB &&& STOVBeq1, 1.000, 0, NOT_CLKB_MINL);
   `endif

    $setuphold(posedge CLKB &&& TENBeq1, posedge CENB, 1.000, 0.500, NOT_CENB);
    $setuphold(posedge CLKB &&& TENBeq1, negedge CENB, 1.000, 0.500, NOT_CENB);
    $setuphold(posedge RET1N &&& TENBeq1, negedge CENB, 0.000, 0.500, NOT_RET1N);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, posedge AB[8], 1.000, 0.500, NOT_AB8);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, posedge AB[7], 1.000, 0.500, NOT_AB7);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, posedge AB[6], 1.000, 0.500, NOT_AB6);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, posedge AB[5], 1.000, 0.500, NOT_AB5);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, posedge AB[4], 1.000, 0.500, NOT_AB4);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, posedge AB[3], 1.000, 0.500, NOT_AB3);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, posedge AB[2], 1.000, 0.500, NOT_AB2);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, posedge AB[1], 1.000, 0.500, NOT_AB1);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, posedge AB[0], 1.000, 0.500, NOT_AB0);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, negedge AB[8], 1.000, 0.500, NOT_AB8);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, negedge AB[7], 1.000, 0.500, NOT_AB7);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, negedge AB[6], 1.000, 0.500, NOT_AB6);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, negedge AB[5], 1.000, 0.500, NOT_AB5);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, negedge AB[4], 1.000, 0.500, NOT_AB4);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, negedge AB[3], 1.000, 0.500, NOT_AB3);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, negedge AB[2], 1.000, 0.500, NOT_AB2);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, negedge AB[1], 1.000, 0.500, NOT_AB1);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, negedge AB[0], 1.000, 0.500, NOT_AB0);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, posedge DB[123], 1.000, 0.500, NOT_DB123);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, posedge DB[122], 1.000, 0.500, NOT_DB122);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, posedge DB[121], 1.000, 0.500, NOT_DB121);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, posedge DB[120], 1.000, 0.500, NOT_DB120);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, posedge DB[119], 1.000, 0.500, NOT_DB119);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, posedge DB[118], 1.000, 0.500, NOT_DB118);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, posedge DB[117], 1.000, 0.500, NOT_DB117);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, posedge DB[116], 1.000, 0.500, NOT_DB116);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, posedge DB[115], 1.000, 0.500, NOT_DB115);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, posedge DB[114], 1.000, 0.500, NOT_DB114);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, posedge DB[113], 1.000, 0.500, NOT_DB113);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, posedge DB[112], 1.000, 0.500, NOT_DB112);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, posedge DB[111], 1.000, 0.500, NOT_DB111);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, posedge DB[110], 1.000, 0.500, NOT_DB110);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, posedge DB[109], 1.000, 0.500, NOT_DB109);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, posedge DB[108], 1.000, 0.500, NOT_DB108);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, posedge DB[107], 1.000, 0.500, NOT_DB107);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, posedge DB[106], 1.000, 0.500, NOT_DB106);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, posedge DB[105], 1.000, 0.500, NOT_DB105);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, posedge DB[104], 1.000, 0.500, NOT_DB104);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, posedge DB[103], 1.000, 0.500, NOT_DB103);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, posedge DB[102], 1.000, 0.500, NOT_DB102);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, posedge DB[101], 1.000, 0.500, NOT_DB101);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, posedge DB[100], 1.000, 0.500, NOT_DB100);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, posedge DB[99], 1.000, 0.500, NOT_DB99);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, posedge DB[98], 1.000, 0.500, NOT_DB98);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, posedge DB[97], 1.000, 0.500, NOT_DB97);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, posedge DB[96], 1.000, 0.500, NOT_DB96);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, posedge DB[95], 1.000, 0.500, NOT_DB95);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, posedge DB[94], 1.000, 0.500, NOT_DB94);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, posedge DB[93], 1.000, 0.500, NOT_DB93);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, posedge DB[92], 1.000, 0.500, NOT_DB92);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, posedge DB[91], 1.000, 0.500, NOT_DB91);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, posedge DB[90], 1.000, 0.500, NOT_DB90);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, posedge DB[89], 1.000, 0.500, NOT_DB89);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, posedge DB[88], 1.000, 0.500, NOT_DB88);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, posedge DB[87], 1.000, 0.500, NOT_DB87);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, posedge DB[86], 1.000, 0.500, NOT_DB86);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, posedge DB[85], 1.000, 0.500, NOT_DB85);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, posedge DB[84], 1.000, 0.500, NOT_DB84);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, posedge DB[83], 1.000, 0.500, NOT_DB83);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, posedge DB[82], 1.000, 0.500, NOT_DB82);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, posedge DB[81], 1.000, 0.500, NOT_DB81);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, posedge DB[80], 1.000, 0.500, NOT_DB80);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, posedge DB[79], 1.000, 0.500, NOT_DB79);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, posedge DB[78], 1.000, 0.500, NOT_DB78);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, posedge DB[77], 1.000, 0.500, NOT_DB77);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, posedge DB[76], 1.000, 0.500, NOT_DB76);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, posedge DB[75], 1.000, 0.500, NOT_DB75);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, posedge DB[74], 1.000, 0.500, NOT_DB74);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, posedge DB[73], 1.000, 0.500, NOT_DB73);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, posedge DB[72], 1.000, 0.500, NOT_DB72);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, posedge DB[71], 1.000, 0.500, NOT_DB71);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, posedge DB[70], 1.000, 0.500, NOT_DB70);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, posedge DB[69], 1.000, 0.500, NOT_DB69);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, posedge DB[68], 1.000, 0.500, NOT_DB68);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, posedge DB[67], 1.000, 0.500, NOT_DB67);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, posedge DB[66], 1.000, 0.500, NOT_DB66);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, posedge DB[65], 1.000, 0.500, NOT_DB65);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, posedge DB[64], 1.000, 0.500, NOT_DB64);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, posedge DB[63], 1.000, 0.500, NOT_DB63);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, posedge DB[62], 1.000, 0.500, NOT_DB62);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, posedge DB[61], 1.000, 0.500, NOT_DB61);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, posedge DB[60], 1.000, 0.500, NOT_DB60);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, posedge DB[59], 1.000, 0.500, NOT_DB59);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, posedge DB[58], 1.000, 0.500, NOT_DB58);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, posedge DB[57], 1.000, 0.500, NOT_DB57);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, posedge DB[56], 1.000, 0.500, NOT_DB56);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, posedge DB[55], 1.000, 0.500, NOT_DB55);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, posedge DB[54], 1.000, 0.500, NOT_DB54);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, posedge DB[53], 1.000, 0.500, NOT_DB53);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, posedge DB[52], 1.000, 0.500, NOT_DB52);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, posedge DB[51], 1.000, 0.500, NOT_DB51);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, posedge DB[50], 1.000, 0.500, NOT_DB50);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, posedge DB[49], 1.000, 0.500, NOT_DB49);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, posedge DB[48], 1.000, 0.500, NOT_DB48);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, posedge DB[47], 1.000, 0.500, NOT_DB47);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, posedge DB[46], 1.000, 0.500, NOT_DB46);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, posedge DB[45], 1.000, 0.500, NOT_DB45);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, posedge DB[44], 1.000, 0.500, NOT_DB44);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, posedge DB[43], 1.000, 0.500, NOT_DB43);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, posedge DB[42], 1.000, 0.500, NOT_DB42);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, posedge DB[41], 1.000, 0.500, NOT_DB41);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, posedge DB[40], 1.000, 0.500, NOT_DB40);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, posedge DB[39], 1.000, 0.500, NOT_DB39);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, posedge DB[38], 1.000, 0.500, NOT_DB38);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, posedge DB[37], 1.000, 0.500, NOT_DB37);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, posedge DB[36], 1.000, 0.500, NOT_DB36);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, posedge DB[35], 1.000, 0.500, NOT_DB35);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, posedge DB[34], 1.000, 0.500, NOT_DB34);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, posedge DB[33], 1.000, 0.500, NOT_DB33);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, posedge DB[32], 1.000, 0.500, NOT_DB32);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, posedge DB[31], 1.000, 0.500, NOT_DB31);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, posedge DB[30], 1.000, 0.500, NOT_DB30);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, posedge DB[29], 1.000, 0.500, NOT_DB29);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, posedge DB[28], 1.000, 0.500, NOT_DB28);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, posedge DB[27], 1.000, 0.500, NOT_DB27);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, posedge DB[26], 1.000, 0.500, NOT_DB26);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, posedge DB[25], 1.000, 0.500, NOT_DB25);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, posedge DB[24], 1.000, 0.500, NOT_DB24);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, posedge DB[23], 1.000, 0.500, NOT_DB23);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, posedge DB[22], 1.000, 0.500, NOT_DB22);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, posedge DB[21], 1.000, 0.500, NOT_DB21);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, posedge DB[20], 1.000, 0.500, NOT_DB20);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, posedge DB[19], 1.000, 0.500, NOT_DB19);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, posedge DB[18], 1.000, 0.500, NOT_DB18);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, posedge DB[17], 1.000, 0.500, NOT_DB17);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, posedge DB[16], 1.000, 0.500, NOT_DB16);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, posedge DB[15], 1.000, 0.500, NOT_DB15);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, posedge DB[14], 1.000, 0.500, NOT_DB14);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, posedge DB[13], 1.000, 0.500, NOT_DB13);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, posedge DB[12], 1.000, 0.500, NOT_DB12);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, posedge DB[11], 1.000, 0.500, NOT_DB11);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, posedge DB[10], 1.000, 0.500, NOT_DB10);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, posedge DB[9], 1.000, 0.500, NOT_DB9);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, posedge DB[8], 1.000, 0.500, NOT_DB8);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, posedge DB[7], 1.000, 0.500, NOT_DB7);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, posedge DB[6], 1.000, 0.500, NOT_DB6);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, posedge DB[5], 1.000, 0.500, NOT_DB5);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, posedge DB[4], 1.000, 0.500, NOT_DB4);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, posedge DB[3], 1.000, 0.500, NOT_DB3);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, posedge DB[2], 1.000, 0.500, NOT_DB2);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, posedge DB[1], 1.000, 0.500, NOT_DB1);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, posedge DB[0], 1.000, 0.500, NOT_DB0);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, negedge DB[123], 1.000, 0.500, NOT_DB123);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, negedge DB[122], 1.000, 0.500, NOT_DB122);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, negedge DB[121], 1.000, 0.500, NOT_DB121);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, negedge DB[120], 1.000, 0.500, NOT_DB120);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, negedge DB[119], 1.000, 0.500, NOT_DB119);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, negedge DB[118], 1.000, 0.500, NOT_DB118);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, negedge DB[117], 1.000, 0.500, NOT_DB117);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, negedge DB[116], 1.000, 0.500, NOT_DB116);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, negedge DB[115], 1.000, 0.500, NOT_DB115);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, negedge DB[114], 1.000, 0.500, NOT_DB114);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, negedge DB[113], 1.000, 0.500, NOT_DB113);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, negedge DB[112], 1.000, 0.500, NOT_DB112);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, negedge DB[111], 1.000, 0.500, NOT_DB111);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, negedge DB[110], 1.000, 0.500, NOT_DB110);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, negedge DB[109], 1.000, 0.500, NOT_DB109);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, negedge DB[108], 1.000, 0.500, NOT_DB108);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, negedge DB[107], 1.000, 0.500, NOT_DB107);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, negedge DB[106], 1.000, 0.500, NOT_DB106);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, negedge DB[105], 1.000, 0.500, NOT_DB105);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, negedge DB[104], 1.000, 0.500, NOT_DB104);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, negedge DB[103], 1.000, 0.500, NOT_DB103);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, negedge DB[102], 1.000, 0.500, NOT_DB102);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, negedge DB[101], 1.000, 0.500, NOT_DB101);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, negedge DB[100], 1.000, 0.500, NOT_DB100);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, negedge DB[99], 1.000, 0.500, NOT_DB99);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, negedge DB[98], 1.000, 0.500, NOT_DB98);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, negedge DB[97], 1.000, 0.500, NOT_DB97);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, negedge DB[96], 1.000, 0.500, NOT_DB96);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, negedge DB[95], 1.000, 0.500, NOT_DB95);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, negedge DB[94], 1.000, 0.500, NOT_DB94);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, negedge DB[93], 1.000, 0.500, NOT_DB93);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, negedge DB[92], 1.000, 0.500, NOT_DB92);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, negedge DB[91], 1.000, 0.500, NOT_DB91);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, negedge DB[90], 1.000, 0.500, NOT_DB90);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, negedge DB[89], 1.000, 0.500, NOT_DB89);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, negedge DB[88], 1.000, 0.500, NOT_DB88);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, negedge DB[87], 1.000, 0.500, NOT_DB87);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, negedge DB[86], 1.000, 0.500, NOT_DB86);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, negedge DB[85], 1.000, 0.500, NOT_DB85);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, negedge DB[84], 1.000, 0.500, NOT_DB84);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, negedge DB[83], 1.000, 0.500, NOT_DB83);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, negedge DB[82], 1.000, 0.500, NOT_DB82);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, negedge DB[81], 1.000, 0.500, NOT_DB81);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, negedge DB[80], 1.000, 0.500, NOT_DB80);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, negedge DB[79], 1.000, 0.500, NOT_DB79);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, negedge DB[78], 1.000, 0.500, NOT_DB78);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, negedge DB[77], 1.000, 0.500, NOT_DB77);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, negedge DB[76], 1.000, 0.500, NOT_DB76);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, negedge DB[75], 1.000, 0.500, NOT_DB75);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, negedge DB[74], 1.000, 0.500, NOT_DB74);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, negedge DB[73], 1.000, 0.500, NOT_DB73);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, negedge DB[72], 1.000, 0.500, NOT_DB72);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, negedge DB[71], 1.000, 0.500, NOT_DB71);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, negedge DB[70], 1.000, 0.500, NOT_DB70);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, negedge DB[69], 1.000, 0.500, NOT_DB69);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, negedge DB[68], 1.000, 0.500, NOT_DB68);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, negedge DB[67], 1.000, 0.500, NOT_DB67);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, negedge DB[66], 1.000, 0.500, NOT_DB66);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, negedge DB[65], 1.000, 0.500, NOT_DB65);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, negedge DB[64], 1.000, 0.500, NOT_DB64);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, negedge DB[63], 1.000, 0.500, NOT_DB63);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, negedge DB[62], 1.000, 0.500, NOT_DB62);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, negedge DB[61], 1.000, 0.500, NOT_DB61);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, negedge DB[60], 1.000, 0.500, NOT_DB60);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, negedge DB[59], 1.000, 0.500, NOT_DB59);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, negedge DB[58], 1.000, 0.500, NOT_DB58);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, negedge DB[57], 1.000, 0.500, NOT_DB57);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, negedge DB[56], 1.000, 0.500, NOT_DB56);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, negedge DB[55], 1.000, 0.500, NOT_DB55);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, negedge DB[54], 1.000, 0.500, NOT_DB54);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, negedge DB[53], 1.000, 0.500, NOT_DB53);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, negedge DB[52], 1.000, 0.500, NOT_DB52);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, negedge DB[51], 1.000, 0.500, NOT_DB51);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, negedge DB[50], 1.000, 0.500, NOT_DB50);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, negedge DB[49], 1.000, 0.500, NOT_DB49);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, negedge DB[48], 1.000, 0.500, NOT_DB48);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, negedge DB[47], 1.000, 0.500, NOT_DB47);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, negedge DB[46], 1.000, 0.500, NOT_DB46);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, negedge DB[45], 1.000, 0.500, NOT_DB45);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, negedge DB[44], 1.000, 0.500, NOT_DB44);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, negedge DB[43], 1.000, 0.500, NOT_DB43);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, negedge DB[42], 1.000, 0.500, NOT_DB42);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, negedge DB[41], 1.000, 0.500, NOT_DB41);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, negedge DB[40], 1.000, 0.500, NOT_DB40);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, negedge DB[39], 1.000, 0.500, NOT_DB39);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, negedge DB[38], 1.000, 0.500, NOT_DB38);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, negedge DB[37], 1.000, 0.500, NOT_DB37);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, negedge DB[36], 1.000, 0.500, NOT_DB36);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, negedge DB[35], 1.000, 0.500, NOT_DB35);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, negedge DB[34], 1.000, 0.500, NOT_DB34);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, negedge DB[33], 1.000, 0.500, NOT_DB33);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, negedge DB[32], 1.000, 0.500, NOT_DB32);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, negedge DB[31], 1.000, 0.500, NOT_DB31);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, negedge DB[30], 1.000, 0.500, NOT_DB30);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, negedge DB[29], 1.000, 0.500, NOT_DB29);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, negedge DB[28], 1.000, 0.500, NOT_DB28);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, negedge DB[27], 1.000, 0.500, NOT_DB27);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, negedge DB[26], 1.000, 0.500, NOT_DB26);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, negedge DB[25], 1.000, 0.500, NOT_DB25);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, negedge DB[24], 1.000, 0.500, NOT_DB24);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, negedge DB[23], 1.000, 0.500, NOT_DB23);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, negedge DB[22], 1.000, 0.500, NOT_DB22);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, negedge DB[21], 1.000, 0.500, NOT_DB21);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, negedge DB[20], 1.000, 0.500, NOT_DB20);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, negedge DB[19], 1.000, 0.500, NOT_DB19);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, negedge DB[18], 1.000, 0.500, NOT_DB18);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, negedge DB[17], 1.000, 0.500, NOT_DB17);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, negedge DB[16], 1.000, 0.500, NOT_DB16);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, negedge DB[15], 1.000, 0.500, NOT_DB15);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, negedge DB[14], 1.000, 0.500, NOT_DB14);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, negedge DB[13], 1.000, 0.500, NOT_DB13);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, negedge DB[12], 1.000, 0.500, NOT_DB12);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, negedge DB[11], 1.000, 0.500, NOT_DB11);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, negedge DB[10], 1.000, 0.500, NOT_DB10);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, negedge DB[9], 1.000, 0.500, NOT_DB9);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, negedge DB[8], 1.000, 0.500, NOT_DB8);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, negedge DB[7], 1.000, 0.500, NOT_DB7);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, negedge DB[6], 1.000, 0.500, NOT_DB6);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, negedge DB[5], 1.000, 0.500, NOT_DB5);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, negedge DB[4], 1.000, 0.500, NOT_DB4);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, negedge DB[3], 1.000, 0.500, NOT_DB3);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, negedge DB[2], 1.000, 0.500, NOT_DB2);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, negedge DB[1], 1.000, 0.500, NOT_DB1);
    $setuphold(posedge CLKB &&& TENBeq1andCENBeq0, negedge DB[0], 1.000, 0.500, NOT_DB0);
    $setuphold(posedge CLKA &&& opTENAeq1andCENAeq0cporopTENAeq0andTCENAeq0cp, posedge EMAA[2], 1.000, 0.500, NOT_EMAA2);
    $setuphold(posedge CLKA &&& opTENAeq1andCENAeq0cporopTENAeq0andTCENAeq0cp, posedge EMAA[1], 1.000, 0.500, NOT_EMAA1);
    $setuphold(posedge CLKA &&& opTENAeq1andCENAeq0cporopTENAeq0andTCENAeq0cp, posedge EMAA[0], 1.000, 0.500, NOT_EMAA0);
    $setuphold(posedge CLKA &&& opTENAeq1andCENAeq0cporopTENAeq0andTCENAeq0cp, negedge EMAA[2], 1.000, 0.500, NOT_EMAA2);
    $setuphold(posedge CLKA &&& opTENAeq1andCENAeq0cporopTENAeq0andTCENAeq0cp, negedge EMAA[1], 1.000, 0.500, NOT_EMAA1);
    $setuphold(posedge CLKA &&& opTENAeq1andCENAeq0cporopTENAeq0andTCENAeq0cp, negedge EMAA[0], 1.000, 0.500, NOT_EMAA0);
    $setuphold(posedge CLKA &&& opTENAeq1andCENAeq0cporopTENAeq0andTCENAeq0cp, posedge EMASA, 1.000, 0.500, NOT_EMASA);
    $setuphold(posedge CLKA &&& opTENAeq1andCENAeq0cporopTENAeq0andTCENAeq0cp, negedge EMASA, 1.000, 0.500, NOT_EMASA);
    $setuphold(posedge CLKB &&& opTENBeq1andCENBeq0cporopTENBeq0andTCENBeq0cp, posedge EMAB[2], 1.000, 0.500, NOT_EMAB2);
    $setuphold(posedge CLKB &&& opTENBeq1andCENBeq0cporopTENBeq0andTCENBeq0cp, posedge EMAB[1], 1.000, 0.500, NOT_EMAB1);
    $setuphold(posedge CLKB &&& opTENBeq1andCENBeq0cporopTENBeq0andTCENBeq0cp, posedge EMAB[0], 1.000, 0.500, NOT_EMAB0);
    $setuphold(posedge CLKB &&& opTENBeq1andCENBeq0cporopTENBeq0andTCENBeq0cp, negedge EMAB[2], 1.000, 0.500, NOT_EMAB2);
    $setuphold(posedge CLKB &&& opTENBeq1andCENBeq0cporopTENBeq0andTCENBeq0cp, negedge EMAB[1], 1.000, 0.500, NOT_EMAB1);
    $setuphold(posedge CLKB &&& opTENBeq1andCENBeq0cporopTENBeq0andTCENBeq0cp, negedge EMAB[0], 1.000, 0.500, NOT_EMAB0);
    $setuphold(posedge CLKB &&& opTENBeq1andCENBeq0cporopTENBeq0andTCENBeq0cp, posedge EMAWB[1], 1.000, 0.500, NOT_EMAWB1);
    $setuphold(posedge CLKB &&& opTENBeq1andCENBeq0cporopTENBeq0andTCENBeq0cp, posedge EMAWB[0], 1.000, 0.500, NOT_EMAWB0);
    $setuphold(posedge CLKB &&& opTENBeq1andCENBeq0cporopTENBeq0andTCENBeq0cp, negedge EMAWB[1], 1.000, 0.500, NOT_EMAWB1);
    $setuphold(posedge CLKB &&& opTENBeq1andCENBeq0cporopTENBeq0andTCENBeq0cp, negedge EMAWB[0], 1.000, 0.500, NOT_EMAWB0);
    $setuphold(posedge CLKA, posedge TENA, 1.000, 0.500, NOT_TENA);
    $setuphold(posedge CLKA, negedge TENA, 1.000, 0.500, NOT_TENA);
    $setuphold(posedge CLKA &&& TENAeq0, posedge TCENA, 1.000, 0.500, NOT_TCENA);
    $setuphold(posedge CLKA &&& TENAeq0, negedge TCENA, 1.000, 0.500, NOT_TCENA);
    $setuphold(posedge RET1N &&& TENAeq0, negedge TCENA, 0.000, 0.500, NOT_RET1N);
    $setuphold(posedge CLKA &&& TENAeq0andTCENAeq0, posedge TAA[8], 1.000, 0.500, NOT_TAA8);
    $setuphold(posedge CLKA &&& TENAeq0andTCENAeq0, posedge TAA[7], 1.000, 0.500, NOT_TAA7);
    $setuphold(posedge CLKA &&& TENAeq0andTCENAeq0, posedge TAA[6], 1.000, 0.500, NOT_TAA6);
    $setuphold(posedge CLKA &&& TENAeq0andTCENAeq0, posedge TAA[5], 1.000, 0.500, NOT_TAA5);
    $setuphold(posedge CLKA &&& TENAeq0andTCENAeq0, posedge TAA[4], 1.000, 0.500, NOT_TAA4);
    $setuphold(posedge CLKA &&& TENAeq0andTCENAeq0, posedge TAA[3], 1.000, 0.500, NOT_TAA3);
    $setuphold(posedge CLKA &&& TENAeq0andTCENAeq0, posedge TAA[2], 1.000, 0.500, NOT_TAA2);
    $setuphold(posedge CLKA &&& TENAeq0andTCENAeq0, posedge TAA[1], 1.000, 0.500, NOT_TAA1);
    $setuphold(posedge CLKA &&& TENAeq0andTCENAeq0, posedge TAA[0], 1.000, 0.500, NOT_TAA0);
    $setuphold(posedge CLKA &&& TENAeq0andTCENAeq0, negedge TAA[8], 1.000, 0.500, NOT_TAA8);
    $setuphold(posedge CLKA &&& TENAeq0andTCENAeq0, negedge TAA[7], 1.000, 0.500, NOT_TAA7);
    $setuphold(posedge CLKA &&& TENAeq0andTCENAeq0, negedge TAA[6], 1.000, 0.500, NOT_TAA6);
    $setuphold(posedge CLKA &&& TENAeq0andTCENAeq0, negedge TAA[5], 1.000, 0.500, NOT_TAA5);
    $setuphold(posedge CLKA &&& TENAeq0andTCENAeq0, negedge TAA[4], 1.000, 0.500, NOT_TAA4);
    $setuphold(posedge CLKA &&& TENAeq0andTCENAeq0, negedge TAA[3], 1.000, 0.500, NOT_TAA3);
    $setuphold(posedge CLKA &&& TENAeq0andTCENAeq0, negedge TAA[2], 1.000, 0.500, NOT_TAA2);
    $setuphold(posedge CLKA &&& TENAeq0andTCENAeq0, negedge TAA[1], 1.000, 0.500, NOT_TAA1);
    $setuphold(posedge CLKA &&& TENAeq0andTCENAeq0, negedge TAA[0], 1.000, 0.500, NOT_TAA0);
    $setuphold(posedge CLKB, posedge TENB, 1.000, 0.500, NOT_TENB);
    $setuphold(posedge CLKB, negedge TENB, 1.000, 0.500, NOT_TENB);
    $setuphold(posedge CLKB &&& TENBeq0, posedge TCENB, 1.000, 0.500, NOT_TCENB);
    $setuphold(posedge CLKB &&& TENBeq0, negedge TCENB, 1.000, 0.500, NOT_TCENB);
    $setuphold(posedge RET1N &&& TENBeq0, negedge TCENB, 0.000, 0.500, NOT_RET1N);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, posedge TAB[8], 1.000, 0.500, NOT_TAB8);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, posedge TAB[7], 1.000, 0.500, NOT_TAB7);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, posedge TAB[6], 1.000, 0.500, NOT_TAB6);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, posedge TAB[5], 1.000, 0.500, NOT_TAB5);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, posedge TAB[4], 1.000, 0.500, NOT_TAB4);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, posedge TAB[3], 1.000, 0.500, NOT_TAB3);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, posedge TAB[2], 1.000, 0.500, NOT_TAB2);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, posedge TAB[1], 1.000, 0.500, NOT_TAB1);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, posedge TAB[0], 1.000, 0.500, NOT_TAB0);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, negedge TAB[8], 1.000, 0.500, NOT_TAB8);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, negedge TAB[7], 1.000, 0.500, NOT_TAB7);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, negedge TAB[6], 1.000, 0.500, NOT_TAB6);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, negedge TAB[5], 1.000, 0.500, NOT_TAB5);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, negedge TAB[4], 1.000, 0.500, NOT_TAB4);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, negedge TAB[3], 1.000, 0.500, NOT_TAB3);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, negedge TAB[2], 1.000, 0.500, NOT_TAB2);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, negedge TAB[1], 1.000, 0.500, NOT_TAB1);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, negedge TAB[0], 1.000, 0.500, NOT_TAB0);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, posedge TDB[123], 1.000, 0.500, NOT_TDB123);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, posedge TDB[122], 1.000, 0.500, NOT_TDB122);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, posedge TDB[121], 1.000, 0.500, NOT_TDB121);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, posedge TDB[120], 1.000, 0.500, NOT_TDB120);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, posedge TDB[119], 1.000, 0.500, NOT_TDB119);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, posedge TDB[118], 1.000, 0.500, NOT_TDB118);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, posedge TDB[117], 1.000, 0.500, NOT_TDB117);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, posedge TDB[116], 1.000, 0.500, NOT_TDB116);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, posedge TDB[115], 1.000, 0.500, NOT_TDB115);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, posedge TDB[114], 1.000, 0.500, NOT_TDB114);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, posedge TDB[113], 1.000, 0.500, NOT_TDB113);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, posedge TDB[112], 1.000, 0.500, NOT_TDB112);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, posedge TDB[111], 1.000, 0.500, NOT_TDB111);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, posedge TDB[110], 1.000, 0.500, NOT_TDB110);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, posedge TDB[109], 1.000, 0.500, NOT_TDB109);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, posedge TDB[108], 1.000, 0.500, NOT_TDB108);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, posedge TDB[107], 1.000, 0.500, NOT_TDB107);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, posedge TDB[106], 1.000, 0.500, NOT_TDB106);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, posedge TDB[105], 1.000, 0.500, NOT_TDB105);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, posedge TDB[104], 1.000, 0.500, NOT_TDB104);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, posedge TDB[103], 1.000, 0.500, NOT_TDB103);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, posedge TDB[102], 1.000, 0.500, NOT_TDB102);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, posedge TDB[101], 1.000, 0.500, NOT_TDB101);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, posedge TDB[100], 1.000, 0.500, NOT_TDB100);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, posedge TDB[99], 1.000, 0.500, NOT_TDB99);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, posedge TDB[98], 1.000, 0.500, NOT_TDB98);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, posedge TDB[97], 1.000, 0.500, NOT_TDB97);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, posedge TDB[96], 1.000, 0.500, NOT_TDB96);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, posedge TDB[95], 1.000, 0.500, NOT_TDB95);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, posedge TDB[94], 1.000, 0.500, NOT_TDB94);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, posedge TDB[93], 1.000, 0.500, NOT_TDB93);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, posedge TDB[92], 1.000, 0.500, NOT_TDB92);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, posedge TDB[91], 1.000, 0.500, NOT_TDB91);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, posedge TDB[90], 1.000, 0.500, NOT_TDB90);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, posedge TDB[89], 1.000, 0.500, NOT_TDB89);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, posedge TDB[88], 1.000, 0.500, NOT_TDB88);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, posedge TDB[87], 1.000, 0.500, NOT_TDB87);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, posedge TDB[86], 1.000, 0.500, NOT_TDB86);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, posedge TDB[85], 1.000, 0.500, NOT_TDB85);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, posedge TDB[84], 1.000, 0.500, NOT_TDB84);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, posedge TDB[83], 1.000, 0.500, NOT_TDB83);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, posedge TDB[82], 1.000, 0.500, NOT_TDB82);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, posedge TDB[81], 1.000, 0.500, NOT_TDB81);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, posedge TDB[80], 1.000, 0.500, NOT_TDB80);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, posedge TDB[79], 1.000, 0.500, NOT_TDB79);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, posedge TDB[78], 1.000, 0.500, NOT_TDB78);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, posedge TDB[77], 1.000, 0.500, NOT_TDB77);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, posedge TDB[76], 1.000, 0.500, NOT_TDB76);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, posedge TDB[75], 1.000, 0.500, NOT_TDB75);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, posedge TDB[74], 1.000, 0.500, NOT_TDB74);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, posedge TDB[73], 1.000, 0.500, NOT_TDB73);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, posedge TDB[72], 1.000, 0.500, NOT_TDB72);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, posedge TDB[71], 1.000, 0.500, NOT_TDB71);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, posedge TDB[70], 1.000, 0.500, NOT_TDB70);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, posedge TDB[69], 1.000, 0.500, NOT_TDB69);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, posedge TDB[68], 1.000, 0.500, NOT_TDB68);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, posedge TDB[67], 1.000, 0.500, NOT_TDB67);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, posedge TDB[66], 1.000, 0.500, NOT_TDB66);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, posedge TDB[65], 1.000, 0.500, NOT_TDB65);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, posedge TDB[64], 1.000, 0.500, NOT_TDB64);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, posedge TDB[63], 1.000, 0.500, NOT_TDB63);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, posedge TDB[62], 1.000, 0.500, NOT_TDB62);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, posedge TDB[61], 1.000, 0.500, NOT_TDB61);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, posedge TDB[60], 1.000, 0.500, NOT_TDB60);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, posedge TDB[59], 1.000, 0.500, NOT_TDB59);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, posedge TDB[58], 1.000, 0.500, NOT_TDB58);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, posedge TDB[57], 1.000, 0.500, NOT_TDB57);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, posedge TDB[56], 1.000, 0.500, NOT_TDB56);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, posedge TDB[55], 1.000, 0.500, NOT_TDB55);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, posedge TDB[54], 1.000, 0.500, NOT_TDB54);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, posedge TDB[53], 1.000, 0.500, NOT_TDB53);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, posedge TDB[52], 1.000, 0.500, NOT_TDB52);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, posedge TDB[51], 1.000, 0.500, NOT_TDB51);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, posedge TDB[50], 1.000, 0.500, NOT_TDB50);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, posedge TDB[49], 1.000, 0.500, NOT_TDB49);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, posedge TDB[48], 1.000, 0.500, NOT_TDB48);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, posedge TDB[47], 1.000, 0.500, NOT_TDB47);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, posedge TDB[46], 1.000, 0.500, NOT_TDB46);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, posedge TDB[45], 1.000, 0.500, NOT_TDB45);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, posedge TDB[44], 1.000, 0.500, NOT_TDB44);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, posedge TDB[43], 1.000, 0.500, NOT_TDB43);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, posedge TDB[42], 1.000, 0.500, NOT_TDB42);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, posedge TDB[41], 1.000, 0.500, NOT_TDB41);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, posedge TDB[40], 1.000, 0.500, NOT_TDB40);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, posedge TDB[39], 1.000, 0.500, NOT_TDB39);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, posedge TDB[38], 1.000, 0.500, NOT_TDB38);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, posedge TDB[37], 1.000, 0.500, NOT_TDB37);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, posedge TDB[36], 1.000, 0.500, NOT_TDB36);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, posedge TDB[35], 1.000, 0.500, NOT_TDB35);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, posedge TDB[34], 1.000, 0.500, NOT_TDB34);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, posedge TDB[33], 1.000, 0.500, NOT_TDB33);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, posedge TDB[32], 1.000, 0.500, NOT_TDB32);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, posedge TDB[31], 1.000, 0.500, NOT_TDB31);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, posedge TDB[30], 1.000, 0.500, NOT_TDB30);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, posedge TDB[29], 1.000, 0.500, NOT_TDB29);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, posedge TDB[28], 1.000, 0.500, NOT_TDB28);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, posedge TDB[27], 1.000, 0.500, NOT_TDB27);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, posedge TDB[26], 1.000, 0.500, NOT_TDB26);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, posedge TDB[25], 1.000, 0.500, NOT_TDB25);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, posedge TDB[24], 1.000, 0.500, NOT_TDB24);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, posedge TDB[23], 1.000, 0.500, NOT_TDB23);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, posedge TDB[22], 1.000, 0.500, NOT_TDB22);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, posedge TDB[21], 1.000, 0.500, NOT_TDB21);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, posedge TDB[20], 1.000, 0.500, NOT_TDB20);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, posedge TDB[19], 1.000, 0.500, NOT_TDB19);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, posedge TDB[18], 1.000, 0.500, NOT_TDB18);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, posedge TDB[17], 1.000, 0.500, NOT_TDB17);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, posedge TDB[16], 1.000, 0.500, NOT_TDB16);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, posedge TDB[15], 1.000, 0.500, NOT_TDB15);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, posedge TDB[14], 1.000, 0.500, NOT_TDB14);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, posedge TDB[13], 1.000, 0.500, NOT_TDB13);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, posedge TDB[12], 1.000, 0.500, NOT_TDB12);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, posedge TDB[11], 1.000, 0.500, NOT_TDB11);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, posedge TDB[10], 1.000, 0.500, NOT_TDB10);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, posedge TDB[9], 1.000, 0.500, NOT_TDB9);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, posedge TDB[8], 1.000, 0.500, NOT_TDB8);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, posedge TDB[7], 1.000, 0.500, NOT_TDB7);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, posedge TDB[6], 1.000, 0.500, NOT_TDB6);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, posedge TDB[5], 1.000, 0.500, NOT_TDB5);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, posedge TDB[4], 1.000, 0.500, NOT_TDB4);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, posedge TDB[3], 1.000, 0.500, NOT_TDB3);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, posedge TDB[2], 1.000, 0.500, NOT_TDB2);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, posedge TDB[1], 1.000, 0.500, NOT_TDB1);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, posedge TDB[0], 1.000, 0.500, NOT_TDB0);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, negedge TDB[123], 1.000, 0.500, NOT_TDB123);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, negedge TDB[122], 1.000, 0.500, NOT_TDB122);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, negedge TDB[121], 1.000, 0.500, NOT_TDB121);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, negedge TDB[120], 1.000, 0.500, NOT_TDB120);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, negedge TDB[119], 1.000, 0.500, NOT_TDB119);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, negedge TDB[118], 1.000, 0.500, NOT_TDB118);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, negedge TDB[117], 1.000, 0.500, NOT_TDB117);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, negedge TDB[116], 1.000, 0.500, NOT_TDB116);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, negedge TDB[115], 1.000, 0.500, NOT_TDB115);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, negedge TDB[114], 1.000, 0.500, NOT_TDB114);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, negedge TDB[113], 1.000, 0.500, NOT_TDB113);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, negedge TDB[112], 1.000, 0.500, NOT_TDB112);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, negedge TDB[111], 1.000, 0.500, NOT_TDB111);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, negedge TDB[110], 1.000, 0.500, NOT_TDB110);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, negedge TDB[109], 1.000, 0.500, NOT_TDB109);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, negedge TDB[108], 1.000, 0.500, NOT_TDB108);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, negedge TDB[107], 1.000, 0.500, NOT_TDB107);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, negedge TDB[106], 1.000, 0.500, NOT_TDB106);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, negedge TDB[105], 1.000, 0.500, NOT_TDB105);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, negedge TDB[104], 1.000, 0.500, NOT_TDB104);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, negedge TDB[103], 1.000, 0.500, NOT_TDB103);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, negedge TDB[102], 1.000, 0.500, NOT_TDB102);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, negedge TDB[101], 1.000, 0.500, NOT_TDB101);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, negedge TDB[100], 1.000, 0.500, NOT_TDB100);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, negedge TDB[99], 1.000, 0.500, NOT_TDB99);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, negedge TDB[98], 1.000, 0.500, NOT_TDB98);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, negedge TDB[97], 1.000, 0.500, NOT_TDB97);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, negedge TDB[96], 1.000, 0.500, NOT_TDB96);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, negedge TDB[95], 1.000, 0.500, NOT_TDB95);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, negedge TDB[94], 1.000, 0.500, NOT_TDB94);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, negedge TDB[93], 1.000, 0.500, NOT_TDB93);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, negedge TDB[92], 1.000, 0.500, NOT_TDB92);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, negedge TDB[91], 1.000, 0.500, NOT_TDB91);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, negedge TDB[90], 1.000, 0.500, NOT_TDB90);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, negedge TDB[89], 1.000, 0.500, NOT_TDB89);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, negedge TDB[88], 1.000, 0.500, NOT_TDB88);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, negedge TDB[87], 1.000, 0.500, NOT_TDB87);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, negedge TDB[86], 1.000, 0.500, NOT_TDB86);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, negedge TDB[85], 1.000, 0.500, NOT_TDB85);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, negedge TDB[84], 1.000, 0.500, NOT_TDB84);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, negedge TDB[83], 1.000, 0.500, NOT_TDB83);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, negedge TDB[82], 1.000, 0.500, NOT_TDB82);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, negedge TDB[81], 1.000, 0.500, NOT_TDB81);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, negedge TDB[80], 1.000, 0.500, NOT_TDB80);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, negedge TDB[79], 1.000, 0.500, NOT_TDB79);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, negedge TDB[78], 1.000, 0.500, NOT_TDB78);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, negedge TDB[77], 1.000, 0.500, NOT_TDB77);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, negedge TDB[76], 1.000, 0.500, NOT_TDB76);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, negedge TDB[75], 1.000, 0.500, NOT_TDB75);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, negedge TDB[74], 1.000, 0.500, NOT_TDB74);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, negedge TDB[73], 1.000, 0.500, NOT_TDB73);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, negedge TDB[72], 1.000, 0.500, NOT_TDB72);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, negedge TDB[71], 1.000, 0.500, NOT_TDB71);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, negedge TDB[70], 1.000, 0.500, NOT_TDB70);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, negedge TDB[69], 1.000, 0.500, NOT_TDB69);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, negedge TDB[68], 1.000, 0.500, NOT_TDB68);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, negedge TDB[67], 1.000, 0.500, NOT_TDB67);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, negedge TDB[66], 1.000, 0.500, NOT_TDB66);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, negedge TDB[65], 1.000, 0.500, NOT_TDB65);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, negedge TDB[64], 1.000, 0.500, NOT_TDB64);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, negedge TDB[63], 1.000, 0.500, NOT_TDB63);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, negedge TDB[62], 1.000, 0.500, NOT_TDB62);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, negedge TDB[61], 1.000, 0.500, NOT_TDB61);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, negedge TDB[60], 1.000, 0.500, NOT_TDB60);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, negedge TDB[59], 1.000, 0.500, NOT_TDB59);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, negedge TDB[58], 1.000, 0.500, NOT_TDB58);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, negedge TDB[57], 1.000, 0.500, NOT_TDB57);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, negedge TDB[56], 1.000, 0.500, NOT_TDB56);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, negedge TDB[55], 1.000, 0.500, NOT_TDB55);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, negedge TDB[54], 1.000, 0.500, NOT_TDB54);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, negedge TDB[53], 1.000, 0.500, NOT_TDB53);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, negedge TDB[52], 1.000, 0.500, NOT_TDB52);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, negedge TDB[51], 1.000, 0.500, NOT_TDB51);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, negedge TDB[50], 1.000, 0.500, NOT_TDB50);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, negedge TDB[49], 1.000, 0.500, NOT_TDB49);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, negedge TDB[48], 1.000, 0.500, NOT_TDB48);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, negedge TDB[47], 1.000, 0.500, NOT_TDB47);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, negedge TDB[46], 1.000, 0.500, NOT_TDB46);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, negedge TDB[45], 1.000, 0.500, NOT_TDB45);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, negedge TDB[44], 1.000, 0.500, NOT_TDB44);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, negedge TDB[43], 1.000, 0.500, NOT_TDB43);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, negedge TDB[42], 1.000, 0.500, NOT_TDB42);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, negedge TDB[41], 1.000, 0.500, NOT_TDB41);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, negedge TDB[40], 1.000, 0.500, NOT_TDB40);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, negedge TDB[39], 1.000, 0.500, NOT_TDB39);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, negedge TDB[38], 1.000, 0.500, NOT_TDB38);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, negedge TDB[37], 1.000, 0.500, NOT_TDB37);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, negedge TDB[36], 1.000, 0.500, NOT_TDB36);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, negedge TDB[35], 1.000, 0.500, NOT_TDB35);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, negedge TDB[34], 1.000, 0.500, NOT_TDB34);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, negedge TDB[33], 1.000, 0.500, NOT_TDB33);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, negedge TDB[32], 1.000, 0.500, NOT_TDB32);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, negedge TDB[31], 1.000, 0.500, NOT_TDB31);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, negedge TDB[30], 1.000, 0.500, NOT_TDB30);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, negedge TDB[29], 1.000, 0.500, NOT_TDB29);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, negedge TDB[28], 1.000, 0.500, NOT_TDB28);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, negedge TDB[27], 1.000, 0.500, NOT_TDB27);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, negedge TDB[26], 1.000, 0.500, NOT_TDB26);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, negedge TDB[25], 1.000, 0.500, NOT_TDB25);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, negedge TDB[24], 1.000, 0.500, NOT_TDB24);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, negedge TDB[23], 1.000, 0.500, NOT_TDB23);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, negedge TDB[22], 1.000, 0.500, NOT_TDB22);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, negedge TDB[21], 1.000, 0.500, NOT_TDB21);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, negedge TDB[20], 1.000, 0.500, NOT_TDB20);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, negedge TDB[19], 1.000, 0.500, NOT_TDB19);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, negedge TDB[18], 1.000, 0.500, NOT_TDB18);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, negedge TDB[17], 1.000, 0.500, NOT_TDB17);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, negedge TDB[16], 1.000, 0.500, NOT_TDB16);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, negedge TDB[15], 1.000, 0.500, NOT_TDB15);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, negedge TDB[14], 1.000, 0.500, NOT_TDB14);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, negedge TDB[13], 1.000, 0.500, NOT_TDB13);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, negedge TDB[12], 1.000, 0.500, NOT_TDB12);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, negedge TDB[11], 1.000, 0.500, NOT_TDB11);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, negedge TDB[10], 1.000, 0.500, NOT_TDB10);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, negedge TDB[9], 1.000, 0.500, NOT_TDB9);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, negedge TDB[8], 1.000, 0.500, NOT_TDB8);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, negedge TDB[7], 1.000, 0.500, NOT_TDB7);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, negedge TDB[6], 1.000, 0.500, NOT_TDB6);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, negedge TDB[5], 1.000, 0.500, NOT_TDB5);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, negedge TDB[4], 1.000, 0.500, NOT_TDB4);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, negedge TDB[3], 1.000, 0.500, NOT_TDB3);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, negedge TDB[2], 1.000, 0.500, NOT_TDB2);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, negedge TDB[1], 1.000, 0.500, NOT_TDB1);
    $setuphold(posedge CLKB &&& TENBeq0andTCENBeq0, negedge TDB[0], 1.000, 0.500, NOT_TDB0);
    $setuphold(posedge CLKA &&& opopTENAeq1andCENAeq0cporopTENAeq0andTCENAeq0cpcpandopopTENBeq1andCENBeq0cporopTENBeq0andTCENBeq0cpcp, posedge RET1N, 1.000, 0.500, NOT_RET1N);
    $setuphold(posedge CLKA &&& opopTENAeq1andCENAeq0cporopTENAeq0andTCENAeq0cpcpandopopTENBeq1andCENBeq0cporopTENBeq0andTCENBeq0cpcp, negedge RET1N, 1.000, 0.500, NOT_RET1N);
    $setuphold(posedge CLKB &&& opopTENAeq1andCENAeq0cporopTENAeq0andTCENAeq0cpcpandopopTENBeq1andCENBeq0cporopTENBeq0andTCENBeq0cpcp, posedge RET1N, 1.000, 0.500, NOT_RET1N);
    $setuphold(posedge CLKB &&& opopTENAeq1andCENAeq0cporopTENAeq0andTCENAeq0cpcpandopopTENBeq1andCENBeq0cporopTENBeq0andTCENBeq0cpcp, negedge RET1N, 1.000, 0.500, NOT_RET1N);
    $setuphold(posedge CENA, negedge RET1N, 0.000, 0.500, NOT_RET1N);
    $setuphold(posedge CENB, negedge RET1N, 0.000, 0.500, NOT_RET1N);
    $setuphold(posedge TCENA, negedge RET1N, 0.000, 0.500, NOT_RET1N);
    $setuphold(posedge TCENB, negedge RET1N, 0.000, 0.500, NOT_RET1N);
    $setuphold(posedge CLKA &&& opTENAeq1andCENAeq0cporopTENAeq0andTCENAeq0cp, posedge STOVA, 1.000, 0.500, NOT_STOVA);
    $setuphold(posedge CLKA &&& opTENAeq1andCENAeq0cporopTENAeq0andTCENAeq0cp, negedge STOVA, 1.000, 0.500, NOT_STOVA);
    $setuphold(posedge CLKB &&& opTENBeq1andCENBeq0cporopTENBeq0andTCENBeq0cp, posedge STOVB, 1.000, 0.500, NOT_STOVB);
    $setuphold(posedge CLKB &&& opTENBeq1andCENBeq0cporopTENBeq0andTCENBeq0cp, negedge STOVB, 1.000, 0.500, NOT_STOVB);
    $setuphold(posedge CLKA &&& opTENAeq1andCENAeq0cporopTENAeq0andTCENAeq0cp, posedge COLLDISN, 1.000, 0.500, NOT_COLLDISN);
    $setuphold(posedge CLKA &&& opTENAeq1andCENAeq0cporopTENAeq0andTCENAeq0cp, negedge COLLDISN, 1.000, 0.500, NOT_COLLDISN);
    $setuphold(posedge CLKB &&& opTENBeq1andCENBeq0cporopTENBeq0andTCENBeq0cp, posedge COLLDISN, 1.000, 0.500, NOT_COLLDISN);
    $setuphold(posedge CLKB &&& opTENBeq1andCENBeq0cporopTENBeq0andTCENBeq0cp, negedge COLLDISN, 1.000, 0.500, NOT_COLLDISN);
  endspecify


endmodule
`endcelldefine
`endif
`timescale 1ns/1ps
module RF_2p_CRT_4x512_error_injection (Q_out, Q_in, CLK, A, CEN, BEN, TQ);
   output [123:0] Q_out;
   input [123:0] Q_in;
   input CLK;
   input [8:0] A;
   input CEN;
   input BEN;
   input [123:0] TQ;
   parameter LEFT_RED_COLUMN_FAULT = 2'd1;
   parameter RIGHT_RED_COLUMN_FAULT = 2'd2;
   parameter NO_RED_FAULT = 2'd0;
   reg [123:0] Q_out;
   reg entry_found;
   reg list_complete;
   reg [20:0] fault_table [255:0];
   reg [20:0] fault_entry;
initial
begin
   `ifdef DUT
      `define pre_pend_path TB.DUT_inst.CHIP
   `else
       `define pre_pend_path TB.CHIP
   `endif
   `ifdef ARM_NONREPAIRABLE_FAULT
      `pre_pend_path.SMARCHCHKBVCD_LVISION_MBISTPG_ASSEMBLY_UNDER_TEST_INST.MEM0_MEM_INST.u1.add_fault(9'd505,7'd98,2'd1,2'd0);
   `endif
end
   task add_fault;
   //This task injects fault in memory
      input [8:0] address;
      input [6:0] bitPlace;
      input [1:0] fault_type;
      input [1:0] red_fault;
 
      integer i;
      reg done;
   begin
      done = 1'b0;
      i = 0;
      while ((!done) && i < 255)
      begin
         fault_entry = fault_table[i];
         if (fault_entry[0] === 1'b0 || fault_entry[0] === 1'bx)
         begin
            fault_entry[0] = 1'b1;
            fault_entry[2:1] = red_fault;
            fault_entry[4:3] = fault_type;
            fault_entry[11:5] = bitPlace;
            fault_entry[20:12] = address;
            fault_table[i] = fault_entry;
            done = 1'b1;
         end
         i = i+1;
      end
   end
   endtask
//This task removes all fault entries injected by user
task remove_all_faults;
   integer i;
begin
   for (i = 0; i < 256; i=i+1)
   begin
      fault_entry = fault_table[i];
      fault_entry[0] = 1'b0;
      fault_table[i] = fault_entry;
   end
end
endtask
task bit_error;
// This task is used to inject error in memory and should be called
// only from current module.
//
// This task injects error depending upon fault type to particular bit
// of the output
   inout [123:0] q_int;
   input [1:0] fault_type;
   input [6:0] bitLoc;
begin
   if (fault_type === 2'd0)
      q_int[bitLoc] = 1'b0;
   else if (fault_type === 2'd1)
      q_int[bitLoc] = 1'b1;
   else
      q_int[bitLoc] = ~q_int[bitLoc];
end
endtask
task error_injection_on_output;
// This function goes through error injection table for every
// read cycle and corrupts Q output if fault for the particular
// address is present in fault table
//
// If fault is redundant column is detected, this task corrupts
// Q output in read cycle
//
// If fault is repaired using repair bus, this task does not
// courrpt Q output in read cycle
//
   output [123:0] Q_output;
   reg list_complete;
   integer i;
   reg [7:0] row_address;
   reg [0:0] column_address;
   reg [6:0] bitPlace;
   reg [1:0] fault_type;
   reg [1:0] red_fault;
   reg valid;
begin
   entry_found = 1'b0;
   list_complete = 1'b0;
   i = 0;
   Q_output = Q_in;
   while(!list_complete)
   begin
      fault_entry = fault_table[i];
      {row_address, column_address, bitPlace, fault_type, red_fault, valid} = fault_entry;
      i = i + 1;
      if (valid == 1'b1)
      begin
         if (red_fault === NO_RED_FAULT)
         begin
            if (row_address == A[8:1] && column_address == A[0:0])
            begin
               if (bitPlace < 62)
                  bit_error(Q_output,fault_type, bitPlace);
               else if (bitPlace >= 62 )
                  bit_error(Q_output,fault_type, bitPlace);
            end
         end
      end
      else
         list_complete = 1'b1;
      end
   end
   endtask
   always @ (Q_in or CLK or A or CEN or BEN or TQ)
   begin
   if (CEN === 1'b0 && BEN === 1'b1)
      error_injection_on_output(Q_out);
   else if (BEN === 1'b0)
      Q_out = TQ;
   else
      Q_out = Q_in;
   end
endmodule
