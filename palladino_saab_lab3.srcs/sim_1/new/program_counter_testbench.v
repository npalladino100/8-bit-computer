`timescale 1ns / 1ps
module program_counter_testbench;
	wire [3:0] binary_out;
	wire [3:0] monitor_out;
	reg [3:0] binary_in;
	reg clk;
	reg count_enable = 0;
	reg jump =0;
	reg enable = 1;

    program_counter CO1(binary_out, monitor_out, binary_in, clk, count_enable, jump, enable);
 
 always #5 clk = ~clk;
 
 initial 
 begin
 clk = 0; binary_in = 4'b0101;
 #50 count_enable = 1;
 #50 count_enable = 0;
 #50 count_enable = 1; jump = 1;
 #50 count_enable = 0; jump = 0;
 #50 enable = 0;
 #50 enable = 1;
 #400 $finish;
 end

endmodule