`timescale 1ns / 1ps

module Areg_testbench;
wire [7:0] Q;
wire [7:0] L;
reg [7:0] D;
reg clk = 0;
reg enable = 0;
reg load = 0;

always #5 clk = ~clk;   //flip signal every 10ns (100MHz)

Areg AR1(Q, L, D, clk, enable, load);

initial begin
#100 D = 8'b10101001;
#100 load = 1'b1;
#100 enable = 1'b1;
#100 enable = 1'b0;
#100 load = 1'b0;
#100 D = 8'b11111101;
#100 enable = 1'b1; load = 1;
#100 $finish;
    end
    
    endmodule