`timescale 1ns / 1ps
module BminusA(
    output reg [7:0] out,
    input [7:0] a,
    input [7:0] b
    );
always @(*) out = b-a;
endmodule
