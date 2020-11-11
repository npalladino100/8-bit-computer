`timescale 1ns / 1ps

module instruction_reg_testbench;
wire [7:0] Q;
reg [7:0] D;
reg clk = 0;
reg enable = 0;
reg load = 0;

always #5 clk = ~clk;   //flip signal every 10ns (100MHz)

instruction_reg IR1(Q, D, clk, enable, load);

initial begin
#100 D = 8'b10101001;
#100 load = 1'b1;
#100 enable = 1'b1;
#100 enable = 1'b0;
#100 load = 1'b0;
#100 enable = 1'b1;
#100 $finish;
    end
    
    endmodule