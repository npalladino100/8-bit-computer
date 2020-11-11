module program_counter(
    output reg [3:0] binary_out,
    output [3:0] monitor_out,
    input [3:0] binary_in,
    input wire clk,
    input count_enable,
    input jump,
    input enable
   );
 
   reg [3:0] cnt = 0;
always @(posedge clk) begin
    if (count_enable == 1) cnt <= cnt+1;
    if (jump == 1) cnt <= binary_in;
    if (enable == 1)//setting output to whatever L was whenever we enable it
		binary_out = cnt;
	else
		binary_out =4'bzzzz;
end

assign monitor_out = cnt;
endmodule