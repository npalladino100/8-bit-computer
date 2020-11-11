`timescale 1ns / 1ps


module negateB(
    output [7:0] out,
    input [7:0] a,
    input [7:0] b
    );
    wire [7:0] w1;
    
    onesComplementB OC2(w1, a, b);
    carrySelectAdder R4(out, w1, 8'b1);
    

endmodule
