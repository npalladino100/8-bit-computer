`timescale 1ns / 1ps

module clock(
output reg clock_signal = 0,
input clk_100MHz,
input clk_control, // switch
input advance_clk  // button
);

wire manual_clk;
wire divided_clk;


clk_divider D1(divided_clk, clk_100MHz);    //divide to 100Hz

assign manual_clk = advance_clk;

always @(*) begin
if (clk_control == 1'b0)
clock_signal = divided_clk;
else
clock_signal = manual_clk;
end

endmodule