`timescale 1ns / 1ps

module  RAM(
output [7:0] O,
input [7:0] bus_data,
input [3:0] address,
input enable,
input load,
input [7:0] manual_data,
input toggle,
input clk
);

reg [7:0] data;
reg load_control;

RAM_reg RR1(O, data, enable, load_control, address, clk);

always @(negedge clk) begin

if (toggle == 0) begin
data = bus_data;
load_control = load;
end

if (toggle == 1) begin
data = manual_data;
load_control = 1;
end
end

endmodule