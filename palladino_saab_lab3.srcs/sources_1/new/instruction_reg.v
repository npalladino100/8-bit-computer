`timescale 1ns / 1ps

module instruction_reg(
output reg [3:0] Q, // only output 4 least significant to the bus
// output reg [3:0] Q2 // to instruction decoder
input [7:0] D,
input clk_signal,
input enable,
input load
);

reg[7:0] L;
reg[7:0] Qsplit;    // split Q into two 4-bit values

always @(negedge clk_signal) begin
	if (load == 1) //Loading value into L (L is an intermediate value)
		L=D;
end
always @(posedge clk_signal) begin
	if (enable == 1)//setting output to whatever L was whenever we enable it
		Qsplit=L;
	else
		Qsplit=8'bzzzzzzzz;
		Q = Qsplit[3:0];
    // Q2 = Qsplit[7:4]; to instruction decoder
	end


endmodule