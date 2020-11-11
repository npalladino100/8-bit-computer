`timescale 1ns / 1ps

module RAM_reg(
output reg [7:0] Q,
input [7:0] D,
input enable,
input load,
input [3:0] address,
input clk
);

reg[127:0] L;

always @(negedge clk) begin
	if (load == 1)begin //Loading value into L (L is an intermediate value)

		case (address)
		4'b0000 : L[127:120] = D;
		4'b0001 : L[119:112] = D;
		4'b0010 : L[111:104] = D;
		4'b0011 : L[103:96] = D;
		4'b0100 : L[95:88] = D;
		4'b0101 : L[87:80] = D;
		4'b0110 : L[79:72] = D;
		4'b0111 : L[71:64] = D;
		4'b1000 : L[63:56] = D;
		4'b1001 : L[55:48] = D;
		4'b1010 : L[47:40] = D;
		4'b1011 : L[39:32] = D;
		4'b1100 : L[31:24] = D;
		4'b1101 : L[23:16] = D;
		4'b1110 : L[15:8] = D;
		4'b1111 : L[7:0] = D;
		endcase
		
end
end
always @(posedge clk) begin
	if (enable == 1) begin//setting output to whatever L was whenever we enable it
		case (address)
		4'b0000 : Q = L[127:120];
		4'b0001 : Q = L[119:112];
		4'b0010 : Q = L[111:104];
		4'b0011 : Q = L[103:96];
		4'b0100 : Q = L[95:88];
		4'b0101 : Q = L[87:80];
		4'b0110 : Q = L[79:72];
		4'b0111 : Q = L[71:64];
		4'b1000 : Q = L[63:56];
		4'b1001 : Q = L[55:48];
		4'b1010 : Q = L[47:40];
		4'b1011 : Q = L[39:32];
		4'b1100 : Q = L[31:24];
		4'b1101 : Q = L[23:16];
		4'b1110 : Q = L[15:8];
		4'b1111 : Q = L[7:0];
		endcase
end	else Q=8'bzzzzzzzz;
		
	 end
endmodule