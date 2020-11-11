`timescale 1ns / 1ps
module eightBitNor(
    output reg [7:0] out,
    input [7:0] a,
    input [7:0] b
    );
always @(*) out = ~(a | b);
endmodule
