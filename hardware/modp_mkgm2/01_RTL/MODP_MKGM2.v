`include "MODP_DIV.v"

/*
 * Compute the roots for NTT and inverse NTT (binary case). Input
 * parameter g is a primitive 2048-th root of 1 modulo p (i.e. g^1024 =
 * -1 mod p). This fills gm[] and igm[] with powers of g and 1/g:
 *   gm[rev(i)] = g^i mod p
 *   igm[rev(i)] = (1/g)^i mod p
 * where rev() is the "bit reversal" function over 10 bits. It fills
 * the arrays only up to N = 2^logn values.
 *
 * The values stored in gm[] and igm[] are in Montgomery representation.
 *
 * p must be a prime such that p = 1 mod 2048.
 */
module MODP_MKGM2 (
    // Main channel
    // Input signals
    clk,
    rst_n,
    in_valid,
    logn,
    g,
    p,
    p0i,
    mode,
    // Output signals
    out_valid_gm,
    v_gm,
    gm,
    out_valid_igm,
    v_igm,
    igm,
    // MODP_MONTYMUL_TOP
    // Input signals
    out_valid_modp_montymul_bus,
    d_modp_montymul_bus,
    ready_modp_montymul_bus,
    // Output signals
    in_valid_modp_montymul_bus,
    a_modp_montymul_bus,
    b_modp_montymul_bus,
    p_modp_montymul_bus,
    p0i_modp_montymul_bus,
    isMQ_modp_montymul_bus,
    // MODP_R2_TOP
    // Input signals
    out_valid_modp_R2,
    R2_modp_R2,
    ready_modp_R2,
    // Output signals
    in_valid_modp_R2,
    p_modp_R2,
    p0i_modp_R2
);

//---------------------------------------------------------------------
//   Parameter & Integer
//---------------------------------------------------------------------
localparam    P_WIDTH = 31;
localparam LOGN_WIDTH = 4;

`ifdef FALCON1024
    localparam N_WIDTH = 11;
`else
    localparam N_WIDTH = 10;
`endif

/*
 * Bit-reversal index table.
 */
`ifdef FALCON1024
    localparam LUT_SIZE = 1024;
    localparam LUT_WIDTH = $clog2(LUT_SIZE);
    localparam [LUT_WIDTH-1:0] REV10 [0:LUT_SIZE-1] = {
        10'd0,      10'd512,	10'd256,	10'd768,	10'd128,	10'd640,	10'd384,	10'd896,	10'd64,	    10'd576,	10'd320,	10'd832,	10'd192,	10'd704,	10'd448,	10'd960,
        10'd32,     10'd544,	10'd288,	10'd800,	10'd160,	10'd672,	10'd416,	10'd928,	10'd96,	    10'd608,	10'd352,	10'd864,	10'd224,	10'd736,	10'd480,	10'd992,
        10'd16,     10'd528,	10'd272,	10'd784,	10'd144,	10'd656,	10'd400,	10'd912,	10'd80,	    10'd592,	10'd336,	10'd848,	10'd208,	10'd720,	10'd464,	10'd976,
        10'd48,     10'd560,	10'd304,	10'd816,	10'd176,	10'd688,	10'd432,	10'd944,	10'd112,	10'd624,	10'd368,	10'd880,	10'd240,	10'd752,	10'd496,	10'd1008,
        10'd8,      10'd520,	10'd264,	10'd776,	10'd136,	10'd648,	10'd392,	10'd904,	10'd72,	    10'd584,	10'd328,	10'd840,	10'd200,	10'd712,	10'd456,	10'd968,
        10'd40,     10'd552,	10'd296,	10'd808,	10'd168,	10'd680,	10'd424,	10'd936,	10'd104,	10'd616,	10'd360,	10'd872,	10'd232,	10'd744,	10'd488,	10'd1000,
        10'd24,     10'd536,	10'd280,	10'd792,	10'd152,	10'd664,	10'd408,	10'd920,	10'd88,	    10'd600,	10'd344,	10'd856,	10'd216,	10'd728,	10'd472,	10'd984,
        10'd56,     10'd568,	10'd312,	10'd824,	10'd184,	10'd696,	10'd440,	10'd952,	10'd120,	10'd632,	10'd376,	10'd888,	10'd248,	10'd760,	10'd504,	10'd1016,
        10'd4,      10'd516,	10'd260,	10'd772,	10'd132,	10'd644,	10'd388,	10'd900,	10'd68,	    10'd580,	10'd324,	10'd836,	10'd196,	10'd708,	10'd452,	10'd964,
        10'd36,     10'd548,	10'd292,	10'd804,	10'd164,	10'd676,	10'd420,	10'd932,	10'd100,	10'd612,	10'd356,	10'd868,	10'd228,	10'd740,	10'd484,	10'd996,
        10'd20,     10'd532,	10'd276,	10'd788,	10'd148,	10'd660,	10'd404,	10'd916,	10'd84,	    10'd596,	10'd340,	10'd852,	10'd212,	10'd724,	10'd468,	10'd980,
        10'd52,     10'd564,	10'd308,	10'd820,	10'd180,	10'd692,	10'd436,	10'd948,	10'd116,	10'd628,	10'd372,	10'd884,	10'd244,	10'd756,	10'd500,	10'd1012,
        10'd12,     10'd524,	10'd268,	10'd780,	10'd140,	10'd652,	10'd396,	10'd908,	10'd76,	    10'd588,	10'd332,	10'd844,	10'd204,	10'd716,	10'd460,	10'd972,
        10'd44,     10'd556,	10'd300,	10'd812,	10'd172,	10'd684,	10'd428,	10'd940,	10'd108,	10'd620,	10'd364,	10'd876,	10'd236,	10'd748,	10'd492,	10'd1004,
        10'd28,     10'd540,	10'd284,	10'd796,	10'd156,	10'd668,	10'd412,	10'd924,	10'd92,	    10'd604,	10'd348,	10'd860,	10'd220,	10'd732,	10'd476,	10'd988,
        10'd60,     10'd572,	10'd316,	10'd828,	10'd188,	10'd700,	10'd444,	10'd956,	10'd124,	10'd636,	10'd380,	10'd892,	10'd252,	10'd764,	10'd508,	10'd1020,
        10'd2,      10'd514,	10'd258,	10'd770,	10'd130,	10'd642,	10'd386,	10'd898,	10'd66,	    10'd578,	10'd322,	10'd834,	10'd194,	10'd706,	10'd450,	10'd962,
        10'd34,     10'd546,	10'd290,	10'd802,	10'd162,	10'd674,	10'd418,	10'd930,	10'd98,	    10'd610,	10'd354,	10'd866,	10'd226,	10'd738,	10'd482,	10'd994,
        10'd18,     10'd530,	10'd274,	10'd786,	10'd146,	10'd658,	10'd402,	10'd914,	10'd82,	    10'd594,	10'd338,	10'd850,	10'd210,	10'd722,	10'd466,	10'd978,
        10'd50,     10'd562,	10'd306,	10'd818,	10'd178,	10'd690,	10'd434,	10'd946,	10'd114,	10'd626,	10'd370,	10'd882,	10'd242,	10'd754,	10'd498,	10'd1010,
        10'd10,     10'd522,	10'd266,	10'd778,	10'd138,	10'd650,	10'd394,	10'd906,	10'd74,	    10'd586,	10'd330,	10'd842,	10'd202,	10'd714,	10'd458,	10'd970,
        10'd42,     10'd554,	10'd298,	10'd810,	10'd170,	10'd682,	10'd426,	10'd938,	10'd106,	10'd618,	10'd362,	10'd874,	10'd234,	10'd746,	10'd490,	10'd1002,
        10'd26,     10'd538,	10'd282,	10'd794,	10'd154,	10'd666,	10'd410,	10'd922,	10'd90,	    10'd602,	10'd346,	10'd858,	10'd218,	10'd730,	10'd474,	10'd986,
        10'd58,     10'd570,	10'd314,	10'd826,	10'd186,	10'd698,	10'd442,	10'd954,	10'd122,	10'd634,	10'd378,	10'd890,	10'd250,	10'd762,	10'd506,	10'd1018,
        10'd6,      10'd518,	10'd262,	10'd774,	10'd134,	10'd646,	10'd390,	10'd902,	10'd70,	    10'd582,	10'd326,	10'd838,	10'd198,	10'd710,	10'd454,	10'd966,
        10'd38,     10'd550,	10'd294,	10'd806,	10'd166,	10'd678,	10'd422,	10'd934,	10'd102,	10'd614,	10'd358,	10'd870,	10'd230,	10'd742,	10'd486,	10'd998,
        10'd22,     10'd534,	10'd278,	10'd790,	10'd150,	10'd662,	10'd406,	10'd918,	10'd86,	    10'd598,	10'd342,	10'd854,	10'd214,	10'd726,	10'd470,	10'd982,
        10'd54,     10'd566,	10'd310,	10'd822,	10'd182,	10'd694,	10'd438,	10'd950,	10'd118,	10'd630,	10'd374,	10'd886,	10'd246,	10'd758,	10'd502,	10'd1014,
        10'd14,     10'd526,	10'd270,	10'd782,	10'd142,	10'd654,	10'd398,	10'd910,	10'd78,	    10'd590,	10'd334,	10'd846,	10'd206,	10'd718,	10'd462,	10'd974,
        10'd46,     10'd558,	10'd302,	10'd814,	10'd174,	10'd686,	10'd430,	10'd942,	10'd110,	10'd622,	10'd366,	10'd878,	10'd238,	10'd750,	10'd494,	10'd1006,
        10'd30,     10'd542,	10'd286,	10'd798,	10'd158,	10'd670,	10'd414,	10'd926,	10'd94,	    10'd606,	10'd350,	10'd862,	10'd222,	10'd734,	10'd478,	10'd990,
        10'd62,     10'd574,	10'd318,	10'd830,	10'd190,	10'd702,	10'd446,	10'd958,	10'd126,	10'd638,	10'd382,	10'd894,	10'd254,	10'd766,	10'd510,	10'd1022,
        10'd1,      10'd513,	10'd257,	10'd769,	10'd129,	10'd641,	10'd385,	10'd897,	10'd65,	    10'd577,	10'd321,	10'd833,	10'd193,	10'd705,	10'd449,	10'd961,
        10'd33,     10'd545,	10'd289,	10'd801,	10'd161,	10'd673,	10'd417,	10'd929,	10'd97,	    10'd609,	10'd353,	10'd865,	10'd225,	10'd737,	10'd481,	10'd993,
        10'd17,     10'd529,	10'd273,	10'd785,	10'd145,	10'd657,	10'd401,	10'd913,	10'd81,	    10'd593,	10'd337,	10'd849,	10'd209,	10'd721,	10'd465,	10'd977,
        10'd49,     10'd561,	10'd305,	10'd817,	10'd177,	10'd689,	10'd433,	10'd945,	10'd113,	10'd625,	10'd369,	10'd881,	10'd241,	10'd753,	10'd497,	10'd1009,
        10'd9,      10'd521,	10'd265,	10'd777,	10'd137,	10'd649,	10'd393,	10'd905,	10'd73,	    10'd585,	10'd329,	10'd841,	10'd201,	10'd713,	10'd457,	10'd969,
        10'd41,     10'd553,	10'd297,	10'd809,	10'd169,	10'd681,	10'd425,	10'd937,	10'd105,	10'd617,	10'd361,	10'd873,	10'd233,	10'd745,	10'd489,	10'd1001,
        10'd25,     10'd537,	10'd281,	10'd793,	10'd153,	10'd665,	10'd409,	10'd921,	10'd89,	    10'd601,	10'd345,	10'd857,	10'd217,	10'd729,	10'd473,	10'd985,
        10'd57,     10'd569,	10'd313,	10'd825,	10'd185,	10'd697,	10'd441,	10'd953,	10'd121,	10'd633,	10'd377,	10'd889,	10'd249,	10'd761,	10'd505,	10'd1017,
        10'd5,      10'd517,	10'd261,	10'd773,	10'd133,	10'd645,	10'd389,	10'd901,	10'd69,	    10'd581,	10'd325,	10'd837,	10'd197,	10'd709,	10'd453,	10'd965,
        10'd37,     10'd549,	10'd293,	10'd805,	10'd165,	10'd677,	10'd421,	10'd933,	10'd101,	10'd613,	10'd357,	10'd869,	10'd229,	10'd741,	10'd485,	10'd997,
        10'd21,     10'd533,	10'd277,	10'd789,	10'd149,	10'd661,	10'd405,	10'd917,	10'd85,	    10'd597,	10'd341,	10'd853,	10'd213,	10'd725,	10'd469,	10'd981,
        10'd53,     10'd565,	10'd309,	10'd821,	10'd181,	10'd693,	10'd437,	10'd949,	10'd117,	10'd629,	10'd373,	10'd885,	10'd245,	10'd757,	10'd501,	10'd1013,
        10'd13,     10'd525,	10'd269,	10'd781,	10'd141,	10'd653,	10'd397,	10'd909,	10'd77,	    10'd589,	10'd333,	10'd845,	10'd205,	10'd717,	10'd461,	10'd973,
        10'd45,     10'd557,	10'd301,	10'd813,	10'd173,	10'd685,	10'd429,	10'd941,	10'd109,	10'd621,	10'd365,	10'd877,	10'd237,	10'd749,	10'd493,	10'd1005,
        10'd29,     10'd541,	10'd285,	10'd797,	10'd157,	10'd669,	10'd413,	10'd925,	10'd93,	    10'd605,	10'd349,	10'd861,	10'd221,	10'd733,	10'd477,	10'd989,
        10'd61,     10'd573,	10'd317,	10'd829,	10'd189,	10'd701,	10'd445,	10'd957,	10'd125,	10'd637,	10'd381,	10'd893,	10'd253,	10'd765,	10'd509,	10'd1021,
        10'd3,      10'd515,	10'd259,	10'd771,	10'd131,	10'd643,	10'd387,	10'd899,	10'd67,	    10'd579,	10'd323,	10'd835,	10'd195,	10'd707,	10'd451,	10'd963,
        10'd35,     10'd547,	10'd291,	10'd803,	10'd163,	10'd675,	10'd419,	10'd931,	10'd99,	    10'd611,	10'd355,	10'd867,	10'd227,	10'd739,	10'd483,	10'd995,
        10'd19,     10'd531,	10'd275,	10'd787,	10'd147,	10'd659,	10'd403,	10'd915,	10'd83,	    10'd595,	10'd339,	10'd851,	10'd211,	10'd723,	10'd467,	10'd979,
        10'd51,     10'd563,	10'd307,	10'd819,	10'd179,	10'd691,	10'd435,	10'd947,	10'd115,	10'd627,	10'd371,	10'd883,	10'd243,	10'd755,	10'd499,	10'd1011,
        10'd11,     10'd523,	10'd267,	10'd779,	10'd139,	10'd651,	10'd395,	10'd907,	10'd75,	    10'd587,	10'd331,	10'd843,	10'd203,	10'd715,	10'd459,	10'd971,
        10'd43,     10'd555,	10'd299,	10'd811,	10'd171,	10'd683,	10'd427,	10'd939,	10'd107,	10'd619,	10'd363,	10'd875,	10'd235,	10'd747,	10'd491,	10'd1003,
        10'd27,     10'd539,	10'd283,	10'd795,	10'd155,	10'd667,	10'd411,	10'd923,	10'd91,	    10'd603,	10'd347,	10'd859,	10'd219,	10'd731,	10'd475,	10'd987,
        10'd59,     10'd571,	10'd315,	10'd827,	10'd187,	10'd699,	10'd443,	10'd955,	10'd123,	10'd635,	10'd379,	10'd891,	10'd251,	10'd763,	10'd507,	10'd1019,
        10'd7,      10'd519,	10'd263,	10'd775,	10'd135,	10'd647,	10'd391,	10'd903,	10'd71,	    10'd583,	10'd327,	10'd839,	10'd199,	10'd711,	10'd455,	10'd967,
        10'd39,     10'd551,	10'd295,	10'd807,	10'd167,	10'd679,	10'd423,	10'd935,	10'd103,	10'd615,	10'd359,	10'd871,	10'd231,	10'd743,	10'd487,	10'd999,
        10'd23,     10'd535,	10'd279,	10'd791,	10'd151,	10'd663,	10'd407,	10'd919,	10'd87,	    10'd599,	10'd343,	10'd855,	10'd215,	10'd727,	10'd471,	10'd983,
        10'd55,     10'd567,	10'd311,	10'd823,	10'd183,	10'd695,	10'd439,	10'd951,	10'd119,	10'd631,	10'd375,	10'd887,	10'd247,	10'd759,	10'd503,	10'd1015,
        10'd15,     10'd527,	10'd271,	10'd783,	10'd143,	10'd655,	10'd399,	10'd911,	10'd79,	    10'd591,	10'd335,	10'd847,	10'd207,	10'd719,	10'd463,	10'd975,
        10'd47,     10'd559,	10'd303,	10'd815,	10'd175,	10'd687,	10'd431,	10'd943,	10'd111,	10'd623,	10'd367,	10'd879,	10'd239,	10'd751,	10'd495,	10'd1007,
        10'd31,     10'd543,	10'd287,	10'd799,	10'd159,	10'd671,	10'd415,	10'd927,	10'd95,	    10'd607,	10'd351,	10'd863,	10'd223,	10'd735,	10'd479,	10'd991,
        10'd63,     10'd575,	10'd319,	10'd831,	10'd191,	10'd703,	10'd447,	10'd959,	10'd127,	10'd639,	10'd383,	10'd895,	10'd255,	10'd767,	10'd511,	10'd1023
        };    
`else
    localparam LUT_SIZE = 512;
    localparam LUT_WIDTH = $clog2(LUT_SIZE);
    localparam [LUT_WIDTH-1:0] REV10 [0:LUT_SIZE-1] = {
        9'd0,	9'd256,	9'd128,	9'd384,	9'd64,	9'd320,	9'd192,	9'd448,	9'd32,	9'd288,	9'd160,	9'd416,	9'd96,	9'd352,	9'd224,	9'd480,
        9'd16,	9'd272,	9'd144,	9'd400,	9'd80,	9'd336,	9'd208,	9'd464,	9'd48,	9'd304,	9'd176,	9'd432,	9'd112,	9'd368,	9'd240,	9'd496,
        9'd8,	9'd264,	9'd136,	9'd392,	9'd72,	9'd328,	9'd200,	9'd456,	9'd40,	9'd296,	9'd168,	9'd424,	9'd104,	9'd360,	9'd232,	9'd488,
        9'd24,	9'd280,	9'd152,	9'd408,	9'd88,	9'd344,	9'd216,	9'd472,	9'd56,	9'd312,	9'd184,	9'd440,	9'd120,	9'd376,	9'd248,	9'd504,
        9'd4,	9'd260,	9'd132,	9'd388,	9'd68,	9'd324,	9'd196,	9'd452,	9'd36,	9'd292,	9'd164,	9'd420,	9'd100,	9'd356,	9'd228,	9'd484,
        9'd20,	9'd276,	9'd148,	9'd404,	9'd84,	9'd340,	9'd212,	9'd468,	9'd52,	9'd308,	9'd180,	9'd436,	9'd116,	9'd372,	9'd244,	9'd500,
        9'd12,	9'd268,	9'd140,	9'd396,	9'd76,	9'd332,	9'd204,	9'd460,	9'd44,	9'd300,	9'd172,	9'd428,	9'd108,	9'd364,	9'd236,	9'd492,
        9'd28,	9'd284,	9'd156,	9'd412,	9'd92,	9'd348,	9'd220,	9'd476,	9'd60,	9'd316,	9'd188,	9'd444,	9'd124,	9'd380,	9'd252,	9'd508,
        9'd2,	9'd258,	9'd130,	9'd386,	9'd66,	9'd322,	9'd194,	9'd450,	9'd34,	9'd290,	9'd162,	9'd418,	9'd98,	9'd354,	9'd226,	9'd482,
        9'd18,	9'd274,	9'd146,	9'd402,	9'd82,	9'd338,	9'd210,	9'd466,	9'd50,	9'd306,	9'd178,	9'd434,	9'd114,	9'd370,	9'd242,	9'd498,
        9'd10,	9'd266,	9'd138,	9'd394,	9'd74,	9'd330,	9'd202,	9'd458,	9'd42,	9'd298,	9'd170,	9'd426,	9'd106,	9'd362,	9'd234,	9'd490,
        9'd26,	9'd282,	9'd154,	9'd410,	9'd90,	9'd346,	9'd218,	9'd474,	9'd58,	9'd314,	9'd186,	9'd442,	9'd122,	9'd378,	9'd250,	9'd506,
        9'd6,	9'd262,	9'd134,	9'd390,	9'd70,	9'd326,	9'd198,	9'd454,	9'd38,	9'd294,	9'd166,	9'd422,	9'd102,	9'd358,	9'd230,	9'd486,
        9'd22,	9'd278,	9'd150,	9'd406,	9'd86,	9'd342,	9'd214,	9'd470,	9'd54,	9'd310,	9'd182,	9'd438,	9'd118,	9'd374,	9'd246,	9'd502,
        9'd14,	9'd270,	9'd142,	9'd398,	9'd78,	9'd334,	9'd206,	9'd462,	9'd46,	9'd302,	9'd174,	9'd430,	9'd110,	9'd366,	9'd238,	9'd494,
        9'd30,	9'd286,	9'd158,	9'd414,	9'd94,	9'd350,	9'd222,	9'd478,	9'd62,	9'd318,	9'd190,	9'd446,	9'd126,	9'd382,	9'd254,	9'd510,
        9'd1,	9'd257,	9'd129,	9'd385,	9'd65,	9'd321,	9'd193,	9'd449,	9'd33,	9'd289,	9'd161,	9'd417,	9'd97,	9'd353,	9'd225,	9'd481,
        9'd17,	9'd273,	9'd145,	9'd401,	9'd81,	9'd337,	9'd209,	9'd465,	9'd49,	9'd305,	9'd177,	9'd433,	9'd113,	9'd369,	9'd241,	9'd497,
        9'd9,	9'd265,	9'd137,	9'd393,	9'd73,	9'd329,	9'd201,	9'd457,	9'd41,	9'd297,	9'd169,	9'd425,	9'd105,	9'd361,	9'd233,	9'd489,
        9'd25,	9'd281,	9'd153,	9'd409,	9'd89,	9'd345,	9'd217,	9'd473,	9'd57,	9'd313,	9'd185,	9'd441,	9'd121,	9'd377,	9'd249,	9'd505,
        9'd5,	9'd261,	9'd133,	9'd389,	9'd69,	9'd325,	9'd197,	9'd453,	9'd37,	9'd293,	9'd165,	9'd421,	9'd101,	9'd357,	9'd229,	9'd485,
        9'd21,	9'd277,	9'd149,	9'd405,	9'd85,	9'd341,	9'd213,	9'd469,	9'd53,	9'd309,	9'd181,	9'd437,	9'd117,	9'd373,	9'd245,	9'd501,
        9'd13,	9'd269,	9'd141,	9'd397,	9'd77,	9'd333,	9'd205,	9'd461,	9'd45,	9'd301,	9'd173,	9'd429,	9'd109,	9'd365,	9'd237,	9'd493,
        9'd29,	9'd285,	9'd157,	9'd413,	9'd93,	9'd349,	9'd221,	9'd477,	9'd61,	9'd317,	9'd189,	9'd445,	9'd125,	9'd381,	9'd253,	9'd509,
        9'd3,	9'd259,	9'd131,	9'd387,	9'd67,	9'd323,	9'd195,	9'd451,	9'd35,	9'd291,	9'd163,	9'd419,	9'd99,	9'd355,	9'd227,	9'd483,
        9'd19,	9'd275,	9'd147,	9'd403,	9'd83,	9'd339,	9'd211,	9'd467,	9'd51,	9'd307,	9'd179,	9'd435,	9'd115,	9'd371,	9'd243,	9'd499,
        9'd11,	9'd267,	9'd139,	9'd395,	9'd75,	9'd331,	9'd203,	9'd459,	9'd43,	9'd299,	9'd171,	9'd427,	9'd107,	9'd363,	9'd235,	9'd491,
        9'd27,	9'd283,	9'd155,	9'd411,	9'd91,	9'd347,	9'd219,	9'd475,	9'd59,	9'd315,	9'd187,	9'd443,	9'd123,	9'd379,	9'd251,	9'd507,
        9'd7,	9'd263,	9'd135,	9'd391,	9'd71,	9'd327,	9'd199,	9'd455,	9'd39,	9'd295,	9'd167,	9'd423,	9'd103,	9'd359,	9'd231,	9'd487,
        9'd23,	9'd279,	9'd151,	9'd407,	9'd87,	9'd343,	9'd215,	9'd471,	9'd55,	9'd311,	9'd183,	9'd439,	9'd119,	9'd375,	9'd247,	9'd503,
        9'd15,	9'd271,	9'd143,	9'd399,	9'd79,	9'd335,	9'd207,	9'd463,	9'd47,	9'd303,	9'd175,	9'd431,	9'd111,	9'd367,	9'd239,	9'd495,
        9'd31,	9'd287,	9'd159,	9'd415,	9'd95,	9'd351,	9'd223,	9'd479,	9'd63,	9'd319,	9'd191,	9'd447,	9'd127,	9'd383,	9'd255,	9'd511
    };
`endif

localparam S_IDLE = 0;
localparam S_R2 = 1;
localparam S_G = 2;
localparam S_iG = 3;
localparam S_iG_GM = 4;
localparam S_ONLY_GM = 5;
localparam S_ONLY_iGM = 6;
localparam S_GM_iGM = 7;

localparam M_ONLY_GM = 1;
localparam M_ONLY_IGM = 2;

//---------------------------------------------------------------------
//   Input & Output
//---------------------------------------------------------------------
/*
 * Main channel
 */
input                       clk;
input                       rst_n;
input                       in_valid;
input      [LOGN_WIDTH-1:0] logn;
input      [P_WIDTH-1:0]    g;
input      [P_WIDTH-1:0]    p;
input      [P_WIDTH-1:0]    p0i;
input      [1:0]            mode;

output reg                  out_valid_gm;
output reg [LUT_WIDTH-1:0]  v_gm;
output reg [P_WIDTH-1:0]    gm;
output reg                  out_valid_igm;
output reg [LUT_WIDTH-1:0]  v_igm;
output reg [P_WIDTH-1:0]    igm;

/*
 * MODP_MONTYMUL_TOP
 */
input  [1:0]           out_valid_modp_montymul_bus;
input  [P_WIDTH*2-1:0] d_modp_montymul_bus;
input  [1:0]           ready_modp_montymul_bus;

output [1:0]           in_valid_modp_montymul_bus;
output [P_WIDTH*2-1:0] a_modp_montymul_bus;
output [P_WIDTH*2-1:0] b_modp_montymul_bus;
output [P_WIDTH*2-1:0] p_modp_montymul_bus;
output [P_WIDTH*2-1:0] p0i_modp_montymul_bus;
output [1:0]           isMQ_modp_montymul_bus;

/*
 * MODP_R2_TOP
 */
input                    out_valid_modp_R2;
input      [P_WIDTH-1:0] R2_modp_R2;
input                    ready_modp_R2;

output reg           in_valid_modp_R2;
output [P_WIDTH-1:0] p_modp_R2;
output [P_WIDTH-1:0] p0i_modp_R2;

//---------------------------------------------------------------------
//   Reg & Wire
//---------------------------------------------------------------------
wire [N_WIDTH-1:0]    n;
wire [LOGN_WIDTH-1:0] k;

reg [2:0] state, next_state;
reg [9:0] cnt, next_cnt;
reg [9:0] cnt2, next_cnt2;

/*
 * variables
 */
// reg [LOGN_WIDTH-1:0] logn_reg, logn_comb;
reg [P_WIDTH-1:0]    g_reg, g_comb;
reg [P_WIDTH-1:0]    ig_reg, ig_comb;
reg [P_WIDTH-1:0]    x1, x1_comb;
reg [P_WIDTH-1:0]    x2, x2_comb;
reg [P_WIDTH-1:0]    R;

/*
 * R2
 */
reg in_valid_modp_R2_reg, in_valid_modp_R2_comb;

/*
 * MONTY_MUL
 */
// slave 1
reg               out_valid_modp_montymul_0;
reg [P_WIDTH-1:0] d_modp_montymul_0;
reg               ready_modp_montymul_0;

reg               in_valid_modp_montymul_0, in_valid_modp_montymul_0_comb;
reg [P_WIDTH-1:0] a_modp_montymul_0;
reg [P_WIDTH-1:0] b_modp_montymul_0;
reg [P_WIDTH-1:0] p_modp_montymul_0;
reg [P_WIDTH-1:0] p0i_modp_montymul_0;
reg               isMQ_modp_montymul_0;

// slave 2
reg               out_valid_modp_montymul_1;
reg [P_WIDTH-1:0] d_modp_montymul_1;
reg               ready_modp_montymul_1;

reg               in_valid_modp_montymul_1, in_valid_modp_montymul_1_reg, in_valid_modp_montymul_1_comb;
reg [P_WIDTH-1:0] a_modp_montymul_1;
reg [P_WIDTH-1:0] b_modp_montymul_1;
reg [P_WIDTH-1:0] p_modp_montymul_1;
reg [P_WIDTH-1:0] p0i_modp_montymul_1;
reg               isMQ_modp_montymul_1;

/*
 * DIV
 */
reg               in_valid_modp_div, in_valid_modp_div_comb;
reg [P_WIDTH-1:0] a_modp_div;
reg [P_WIDTH-1:0] b_modp_div;
reg [P_WIDTH-1:0] R_modp_div;

reg               out_valid_modp_div;
reg [P_WIDTH-1:0] z_modp_div;

reg               out_valid_modp_montymul_modp_div;
reg [P_WIDTH-1:0] d_modp_montymu_modp_div;
reg               ready_modp_montymul_modp_div;

reg               in_valid_modp_montymul_modp_div;
reg [P_WIDTH-1:0] a_modp_montymul_modp_div;
reg [P_WIDTH-1:0] b_modp_montymul_modp_div;
reg [P_WIDTH-1:0] p_modp_montymul_modp_div;
reg [P_WIDTH-1:0] p0i_modp_montymul_modp_div;
reg               isMQ_modp_montymul_modp_div;

//---------------------------------------------------------------------
//   Submodule
//---------------------------------------------------------------------
MODP_R u_MODP_R (.p(p), .R(R));

MODP_DIV u_MODP_DIV (
    // Main channel
    // Input signals
    .clk(clk),
    .rst_n(rst_n),
    .in_valid(in_valid_modp_div),
    .a(a_modp_div),
    .b(b_modp_div),
    .p(p),
    .p0i(p0i),
    .R(R_modp_div),
    // Output signals
    .out_valid(out_valid_modp_div),
    .z(z_modp_div),
    // MODP_MONTYMUL_TOP
    // Input signals
    .out_valid_modp_montymul(out_valid_modp_montymul_1),
    .d_modp_montymul(d_modp_montymul_1),
    .ready_modp_montymul(ready_modp_montymul_1),
    // Output signals
    .in_valid_modp_montymul(in_valid_modp_montymul_modp_div),
    .a_modp_montymul(a_modp_montymul_modp_div),
    .b_modp_montymul(b_modp_montymul_modp_div),
    .p_modp_montymul(p_modp_montymul_modp_div),
    .p0i_modp_montymul(p0i_modp_montymul_modp_div),
    .isMQ_modp_montymul(isMQ_modp_montymul_modp_div)
);

//---------------------------------------------------------------------
//   Combinational Logic
//---------------------------------------------------------------------
assign n = 1 << logn;
assign k = $clog2(LUT_SIZE) - logn;

/*
 * FSM
 */
always @(*) begin
    case (state)
        S_IDLE: begin
            if (in_valid)
                next_state = S_R2;
            else
                next_state = state;
        end
        S_R2: 
            if (out_valid_modp_R2)
                next_state = S_G;
            else
                next_state = state;
        S_G: 
            if (cnt == 10 && out_valid_modp_montymul_0)
                if (mode == M_ONLY_GM)
                    next_state = S_ONLY_GM;
                else if (mode == M_ONLY_IGM)
                    next_state = S_iG;
                else
                    next_state = S_iG_GM;
            else
                next_state = state;
        S_ONLY_GM:
            if (cnt == n - 1)
                next_state = S_IDLE;
            else
                next_state = state;
        S_iG:
            if (out_valid_modp_div)
                next_state = S_ONLY_iGM;
            else
                next_state = state;
        S_ONLY_iGM:
            if (cnt2 == n - 1)
                next_state = S_IDLE;
            else
                next_state = state;
        S_iG_GM:
            if (out_valid_modp_div)
                next_state = S_GM_iGM;
            else
                next_state = state;
        S_GM_iGM:
            if (cnt == n - 1 && cnt2 == n - 1)
                next_state = S_IDLE;
            else
                next_state = state;
    endcase
end

always @(*) begin
    case (state)
        S_IDLE:
            next_cnt = 0;
        S_R2: 
            if (next_state == S_G)
                next_cnt = logn;
            else
                next_cnt = cnt;
        S_G: 
            if (out_valid_modp_montymul_0)
                if (cnt == 10)
                    next_cnt = 0;
                else 
                    next_cnt = cnt + 1;
            else
                next_cnt = cnt;
        S_ONLY_GM:
            if (cnt < n - 1 && out_valid_modp_montymul_0)
                next_cnt = cnt + 1;
            else
                next_cnt = cnt;
        S_iG_GM:
            if (cnt < n - 1 && out_valid_modp_montymul_0)
                next_cnt = cnt + 1;
            else
                next_cnt = cnt;
        S_GM_iGM:
            if (cnt < n - 1 && out_valid_modp_montymul_0)
                next_cnt = cnt + 1;
            else
                next_cnt = cnt;
        default: 
            next_cnt = cnt;
    endcase
end

always @(*) begin
    case (state)
        S_IDLE:
            next_cnt2 = 0;
        S_ONLY_iGM:
            if (cnt2 < n - 1 && out_valid_modp_montymul_1)
                next_cnt2 = cnt2 + 1;
            else
                next_cnt2 = cnt2;
        S_GM_iGM:
            if (cnt2 < n - 1 && out_valid_modp_montymul_1)
                next_cnt2 = cnt2 + 1;
            else
                next_cnt2 = cnt2;
        default: 
            next_cnt2 = cnt2;
    endcase
end

// /*
//  *  Register input
//  */
// always @(*) begin
//     if (in_valid) begin
//         logn_comb = logn;
//     end
//     else begin
//         logn_comb = logn_reg;
//     end
// end

/*
 *  MODP_R2 
 */
// p, p0i
assign in_valid_modp_R2 = (in_valid) ? in_valid : in_valid_modp_R2_reg;
assign p_modp_R2 = p;
assign p0i_modp_R2 = p0i;

// in_valid
always @(*) begin
    if (in_valid) 
        if (ready_modp_R2)
            in_valid_modp_R2_comb = 0;
        else 
            in_valid_modp_R2_comb = 1;
    else if (state == S_R2 && ready_modp_R2)
        in_valid_modp_R2_comb = 0;
    else 
        in_valid_modp_R2_comb = in_valid_modp_R2_reg;
end

/*
 * Pack / unpack MODP_MONTYMUL bus
 */
assign out_valid_modp_montymul_0 = out_valid_modp_montymul_bus[0];
assign out_valid_modp_montymul_1 = out_valid_modp_montymul_bus[1];
assign d_modp_montymul_0 = d_modp_montymul_bus[P_WIDTH-1:0];
assign d_modp_montymul_1 = d_modp_montymul_bus[P_WIDTH*2-1 -: P_WIDTH];
assign ready_modp_montymul_0 = ready_modp_montymul_bus[0];
assign ready_modp_montymul_1 = ready_modp_montymul_bus[1];

assign in_valid_modp_montymul_bus = {in_valid_modp_montymul_1, in_valid_modp_montymul_0};
assign a_modp_montymul_bus = {a_modp_montymul_1, a_modp_montymul_0};
assign b_modp_montymul_bus = {b_modp_montymul_1, b_modp_montymul_0};
assign p_modp_montymul_bus = {p_modp_montymul_1, p_modp_montymul_0};
assign p0i_modp_montymul_bus = {p0i_modp_montymul_1, p0i_modp_montymul_0};
assign isMQ_modp_montymul_bus = {isMQ_modp_montymul_1, isMQ_modp_montymul_0};

/*
 *  MODP_MONTYMUL slave 0
 */
// p, p0i
assign p_modp_montymul_0 = p;
assign p0i_modp_montymul_0 = p0i;
assign isMQ_modp_montymul_0 = 1'b0;

// in_valid
always @(*) begin
    // state 'S_G'
    if (state == S_R2 && next_state == S_G) 
        in_valid_modp_montymul_0_comb = 1;
    else if (state == S_G)
        if (out_valid_modp_montymul_0 && cnt != 10)
            in_valid_modp_montymul_0_comb = 1;
        else if (next_state == S_ONLY_GM || next_state == S_iG_GM || next_state == S_GM_iGM)
            in_valid_modp_montymul_0_comb = 1;
        else if (ready_modp_montymul_0)
            in_valid_modp_montymul_0_comb = 0;
        else
            in_valid_modp_montymul_0_comb = in_valid_modp_montymul_0;
    // state 'S_ONLY_GM' or 'S_GM_iGM'
    else if (state == S_ONLY_GM || state == S_iG_GM || state == S_GM_iGM)
        if (out_valid_modp_montymul_0 && cnt < n-2)
            in_valid_modp_montymul_0_comb = 1;
        else if (ready_modp_montymul_0)
            in_valid_modp_montymul_0_comb = 0;
        else
            in_valid_modp_montymul_0_comb = in_valid_modp_montymul_0;
    else
        in_valid_modp_montymul_0_comb = in_valid_modp_montymul_0;
end

// a, b
always @(*) begin
    if (state == S_G) 
        a_modp_montymul_0 = g_reg;
    else if (state == S_ONLY_GM || state == S_iG_GM || state == S_GM_iGM) 
        a_modp_montymul_0 = g_reg;
    else 
        a_modp_montymul_0 = 0;
end

always @(*) begin
    if (state == S_G) 
        if (cnt == logn)
            b_modp_montymul_0 = ig_reg;
        else 
            b_modp_montymul_0 = g_reg;
    else if (state == S_ONLY_GM || state == S_iG_GM || state == S_GM_iGM) 
        b_modp_montymul_0 = x1;
    else 
        b_modp_montymul_0 = 0;
end

/*
 *  MODP_MONTYMUL slave 1
 */
// p, p0i
assign p_modp_montymul_1 = p;
assign p0i_modp_montymul_1 = p0i;
assign isMQ_modp_montymul_1 = 1'b0;

// in_valid
assign in_valid_modp_montymul_1 = (state == S_iG || state == S_iG_GM) ? in_valid_modp_montymul_modp_div : in_valid_modp_montymul_1_reg;
always @(*) begin
    // state 'S_ONLY_iGM' or 'S_GM_iGM'
    if ((state == S_iG && next_state == S_ONLY_iGM) || (state == S_iG_GM && next_state == S_GM_iGM))
        in_valid_modp_montymul_1_comb = 1;
    else if (state == S_ONLY_iGM || state == S_GM_iGM)
        if (out_valid_modp_montymul_1 && cnt2 < n-2)
            in_valid_modp_montymul_1_comb = 1;
        else if (ready_modp_montymul_1)
            in_valid_modp_montymul_1_comb = 0;
        else
            in_valid_modp_montymul_1_comb = in_valid_modp_montymul_1_reg;
    else
        in_valid_modp_montymul_1_comb = 0;
end

// a, b
always @(*) begin
    if (state == S_iG || state == S_iG_GM) 
        a_modp_montymul_1 = a_modp_montymul_modp_div;
    else if (state == S_ONLY_iGM || state == S_GM_iGM) 
        a_modp_montymul_1 = ig_reg;
    else 
        a_modp_montymul_1 = 0;
end

always @(*) begin
    if (state == S_iG || state == S_iG_GM) 
        b_modp_montymul_1 = b_modp_montymul_modp_div;
    else if (state == S_ONLY_iGM || state == S_GM_iGM) 
        b_modp_montymul_1 = x2;
    else 
        b_modp_montymul_1 = 0;
end

/*
 *  MODP_DIV
 */
// a, b
assign a_modp_div = ig_reg;
assign b_modp_div = g_reg;
assign R_modp_div = x2;

// in_valid
always @(*) begin
    if (state == S_G && cnt == 10 && (next_state == S_iG || next_state == S_iG_GM) && out_valid_modp_montymul_0) 
        in_valid_modp_div_comb = 1;
    else 
        in_valid_modp_div_comb = 0;
end

/*
 *  variables
 */
// g
always @(*) begin
    if (in_valid) 
        g_comb = g;
    else if (state == S_G && out_valid_modp_montymul_0) 
        g_comb = d_modp_montymul_0;
    else 
        g_comb = g_reg;
end

// ig
always @(*) begin
    if (state == S_R2 && out_valid_modp_R2) 
        ig_comb = R2_modp_R2;
    else if ((state == S_iG || state == S_iG_GM) && out_valid_modp_div) 
        ig_comb = z_modp_div;
    else
        ig_comb = ig_reg;
end

// x1
always @(*) begin
    if (in_valid) 
        x1_comb = R;
    else if ((state == S_ONLY_GM || state == S_iG_GM || state == S_GM_iGM) && out_valid_modp_montymul_0)
        x1_comb = d_modp_montymul_0;
    else   
        x1_comb = x1;
end

// x2
always @(*) begin
    if (in_valid) 
        x2_comb = R;
    else if ((state == S_ONLY_iGM || state == S_GM_iGM) && out_valid_modp_montymul_1)
        x2_comb = d_modp_montymul_1;
    else   
        x2_comb = x2;
end

/*
 *  output
 */
// gm
always @(*) begin
    if (state == S_G && cnt == 10 && out_valid_modp_montymul_0)
        out_valid_gm = 1;
    else if ((state == S_ONLY_GM || state == S_iG_GM || state == S_GM_iGM) && out_valid_modp_montymul_0)
        out_valid_gm = 1;
    else 
        out_valid_gm = 0;
end

assign v_gm = REV10[next_cnt << k];

always @(*) begin
    if (state == S_G)
        gm = x1;
    else 
        gm = d_modp_montymul_0;
end

// igm
always @(*) begin
    if ((state == S_iG || state == S_iG_GM) && out_valid_modp_div)
        out_valid_igm = 1;
    else if ((state == S_ONLY_iGM || state == S_GM_iGM) && out_valid_modp_montymul_1)
        out_valid_igm = 1;
    else 
        out_valid_igm = 0;
end

assign v_igm = REV10[next_cnt2 << k];

always @(*) begin
    // if (state == S_ONLY_iGM || state == S_GM_iGM)
    if (state == S_iG || state == S_iG_GM)
        igm = x2;
    else 
        igm = d_modp_montymul_1;
end




//---------------------------------------------------------------------
//   Sequential Logic
//---------------------------------------------------------------------
always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        state <= 0;
        cnt <= 0;
        cnt2 <= 0;
        g_reg <= 0;
        ig_reg <= 0;
        x1 <= 0;
        x2 <= 0;
        in_valid_modp_R2_reg <= 0;
        in_valid_modp_montymul_0 <= 0;
        in_valid_modp_montymul_1_reg <= 0;
        in_valid_modp_div <= 0;
    end
    else begin
        state <= next_state;
        cnt <= next_cnt;
        cnt2 <= next_cnt2;
        g_reg <= g_comb;
        ig_reg <= ig_comb;
        x1 <= x1_comb;
        x2 <= x2_comb;
        in_valid_modp_R2_reg <= in_valid_modp_R2_comb;
        in_valid_modp_montymul_0 <= in_valid_modp_montymul_0_comb;
        in_valid_modp_montymul_1_reg <= in_valid_modp_montymul_1_comb;
        in_valid_modp_div <= in_valid_modp_div_comb;
    end
end

endmodule
