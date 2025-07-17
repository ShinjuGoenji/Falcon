`include "MKGAUSS.v"

/*
 * Generate a random polynomial with a Gaussian distribution. This function
 * also makes sure that the resultant of the polynomial with phi is odd.
 */
module POLY_SMALL_MKGAUSS #(
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
    f_valid,
    f
);

//---------------------------------------------------------------------
//   Parameter & Integer
//---------------------------------------------------------------------
localparam n = 1 << (logn);

//---------------------------------------------------------------------
//   Input & Output
//---------------------------------------------------------------------
input                     clk;
input                     rst_n;
input                     ena;
input                     rng_valid;
input             [127:0] rng;

output reg                rng_extract;
output reg                f_valid;
output reg signed [7:0]   f [0:n-1];

//---------------------------------------------------------------------
//   Reg & Wire
//---------------------------------------------------------------------
reg mkgauss_ena, _mkgauss_ena;

reg s_valid;
reg [31:0] s;

reg mod2, mod2_reg;

reg [logn-1:0] cnt, cnt_reg;

//---------------------------------------------------------------------
//   Submodule
//---------------------------------------------------------------------
MKGAUSS u_MKGAUSS(
    .clk(clk),
    .rst_n(rst_n),
    .ena(_mkgauss_ena),
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
    end
    else begin
        cnt_reg <= cnt;
        mod2_reg <= mod2;
        mkgauss_ena <= _mkgauss_ena;
    end
end

//---------------------------------------------------------------------
//   Output Assignments
//---------------------------------------------------------------------
always @(posedge clk or negedge rst_n) begin
    if (!rst_n) 
        f_valid <= 0;
    else begin
        if (ena) begin
            if (cnt_reg == (n - 1) && s_valid && (mod2 ^ s[0]))
                f_valid <= 1;
            else
                f_valid <= 0;
        end
        else begin
            f_valid <= 0;
        end
    end
end

reg signed [7:0] _f [0:n-1];
genvar u;
generate
    for (u = 0; u < n; u = u + 1) begin
        always @(posedge clk or negedge rst_n) begin
            if (!rst_n)
                f[u] <= 0;
            else begin
                if (ena) begin
                    if ((u == cnt_reg) && s_valid)
                        f[u] <= s;
                    else
                        f[u] <= f[u];
                end
                else begin
                    f[u] <= f[u];
                end
            end
        end
    end
endgenerate

endmodule