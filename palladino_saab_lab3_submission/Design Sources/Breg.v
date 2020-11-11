`timescale 1ns / 1ps

module Breg(
output reg [7:0] Q,
output reg[7:0] L,
input [7:0] D,
input clk_signal,
input enable,
input load
);


always @(negedge clk_signal) begin
	if (load == 1) //Loading value into L (L is an intermediate value)
		L=D;
end
always @(posedge clk_signal) begin
	if (enable == 1)//setting output to whatever L was whenever we enable it
		Q=L;
	else
		Q=8'bzzzzzzzz;
	end
endmodule