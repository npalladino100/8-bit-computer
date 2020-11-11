`timescale 1ns / 1ps


module negateA(
    output [7:0] out,
    input [7:0] a,
    input [7:0] b
    );
    wire [7:0] w1;
    
    onesComplementA OC1(w1, a, b);
    carrySelectAdder R3(out, w1, 8'b1);
    

endmodule
