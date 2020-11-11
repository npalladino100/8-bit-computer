`timescale 1ns / 1ps

module MAR_testbench;
wire [3:0] Q;
reg [3:0] address;
reg clk = 0;
reg enable = 0;
reg load = 0;
reg [3:0] manual_address;
reg toggle = 0;

always #5 clk = ~clk;   //flip signal every 10ns (100MHz)

MAR MAR1(Q, address, clk, enable, load, manual_address, toggle);

initial begin
#100 address = 4'b1010; manual_address = 4'b1111; toggle=0;
#100 load = 1'b1;
#100 enable = 1'b1;
#100 enable = 1'b0;
#100 load = 1'b0; toggle=1;
#100 enable = 1'b1;
#100 load = 1'b1;
#100 $finish;
    end
    
    endmodule