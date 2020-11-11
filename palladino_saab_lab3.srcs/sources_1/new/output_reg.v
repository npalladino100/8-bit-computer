`timescale 1ns / 1ps

module output_reg(
output reg [7:0] Q,
output [6:0] LED_OUT,
output [3:0] ANODE_OUT,
input [7:0] D,
input clk_signal,
input clk_100MHz,
input enable,
input load
);

reg[7:0] L;

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

wire [3:0] Hundreds;
wire [3:0] Tens;
wire [3:0] Ones;
wire [6:0] segments1;
wire [6:0] segments2;
wire [6:0] segments3;
binaryBCD BB1(Hundreds, Tens, Ones, L);
BCDDisplay BD1(segments1, segments2, segments3, Hundreds, Tens, Ones);



wire clk_10KHz;
wire [1:0] refresh_counter;
clk_divider_10KHz CD1(clk_10KHz, clk_100MHz);
refreshCounter RF(refresh_counter, clk_10KHz);
anodeControl AC(ANODE_OUT, refresh_counter);
cathodeControl CC(LED_OUT, segments1, segments2, segments3, refresh_counter);

endmodule