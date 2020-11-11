`timescale 1ns / 1ps

module MAR(
output reg [3:0] Q,
input [3:0] address,
input clk_signal,
input load,
input [3:0] manual_address,
input toggle
);

reg[3:0] L;

always @(negedge clk_signal) begin
	if (load == 1)  //Loading value into L (L is an intermediate value)
		if (toggle==0) L=address;
	if (toggle == 1) L=manual_address;

		Q=L;
end
endmodule