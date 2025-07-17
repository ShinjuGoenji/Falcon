 `include "MKGAUSS.v"

/*
 * Generate a random polynomial with a Gaussian distribution. This function
 * also makes sure that the resultant of the polynomial with phi is odd.
 */
module POLY_SMALL_MKGAUSS #(
    parameter logn = 9
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

//---------------------------------------------------------------------
//   Parameter & Integer
//---------------------------------------------------------------------
localparam n = 1 << (logn);
localparam f_bit = (logn == 9) ? 7 : 6;

//---------------------------------------------------------------------
//   Input & Output
//---------------------------------------------------------------------
/**
 * @input   ena             Enable signal of this module.
 * @input   rng_valid       Valid signal from RNG.
 * @input   rng             Two 64-bit random numbers from random number generator.
 * @output  rng_extract     Response signal to RNG.
 * @output  f_valid         Valid signal of output f.
 * @output  f               7-bit signed output value (registered).
 */
input                         clk;
input                         rst_n;
input                         ena;
input                         rng_valid;
input             [127:0]     rng;

output reg                    rng_extract;
output reg                    f_valid;
output reg signed [f_bit-1:0] f;

//---------------------------------------------------------------------
//   Reg & Wire
//---------------------------------------------------------------------
reg mkgauss_ena, _mkgauss_ena;

reg s_valid;
reg [f_bit-1:0] s;

reg mod2, mod2_reg;

reg [logn-1:0] cnt, cnt_reg;
reg ena_reg;

//---------------------------------------------------------------------
//   Submodule
//---------------------------------------------------------------------
MKGAUSS #(.logn(logn)) u_MKGAUSS(
    .clk(clk),
    .rst_n(rst_n),
    .ena(mkgauss_ena),
    .rng_valid(rng_valid),
    .rng(rng),
    .rng_extract(rng_extract),
    .val_valid(s_valid),
    .val(s)
);

//---------------------------------------------------------------------
//   FSM
//---------------------------------------------------------------------
always @(*) begin
    if (ena) begin
        if (s_valid) begin
            if ((cnt_reg == n-1) && !(mod2 ^ s[0]))
                cnt = cnt_reg;
            else
                cnt = cnt_reg + 1;
        end
        else if (f_valid)
            cnt = 0;
        else
            cnt = cnt_reg;
    end
    else begin
        cnt = 0;
    end
end

//---------------------------------------------------------------------
//   Datapath Logic
//---------------------------------------------------------------------
always @(*) begin
    if (ena) begin
        if ((cnt_reg == n-1) && (mod2 ^ s[0]) && s_valid)
            _mkgauss_ena = 0;
        else
            _mkgauss_ena = 1;
    end
    else 
        _mkgauss_ena = 0;
end

/*
 * We need the sum of all coefficients to be 1; otherwise,
 * the resultant of the polynomial with X^N+1 will be even,
 * and the binary GCD will fail.
 */
always @(*) begin
    if (ena) begin
        if (s_valid)
            if (cnt_reg == n-1)
                mod2 = mod2_reg;
            else
                mod2 = mod2_reg ^ s[0];
        else
            mod2 = mod2_reg;
    end
    else 
        mod2 = 0;
end

//---------------------------------------------------------------------
//   Sequential Logic
//---------------------------------------------------------------------
always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        cnt_reg <= 0;
        mod2_reg <= 0;
        mkgauss_ena <= 0;
        ena_reg <= 0;
    end
    else begin
        cnt_reg <= cnt;
        mod2_reg <= mod2;
        mkgauss_ena <= _mkgauss_ena;
        ena_reg <= ena;
    end
end

//---------------------------------------------------------------------
//   Output Assignments
//---------------------------------------------------------------------
always @(*) begin
    if (ena_reg) begin
        if (cnt_reg == n-1) begin
            if (mod2_reg ^ s[0])
                f_valid = s_valid;
            else 
                f_valid = 0;
        end
        else f_valid = s_valid;
    end
    else f_valid = 0;
end

assign f = s;

endmodule