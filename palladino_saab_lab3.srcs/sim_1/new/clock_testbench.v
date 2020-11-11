`timescale 1ns / 1ps


module clock_testbench;
    wire out;
    reg clk = 0;
    reg control = 1;
    reg advance = 0;
    
   clock C1(out, clk, control, advance);
    


always #5 clk = ~clk;   //flip signal every 10ns (100MHz)

initial begin
#100 control = 0;
#100 control = 1;
#100 advance = 1;
#100 advance = 0;
#50 advance = 1;
#50 advance = 0;
#100 control = 0;
    end
endmodule