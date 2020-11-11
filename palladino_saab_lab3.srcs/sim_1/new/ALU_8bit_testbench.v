`timescale 1ns / 1ps


module ALU_8bit_testbench();
    wire [7:0] out;
    reg [7:0] a;
    reg [7:0] b;
    reg [7:0] opcode;
    reg enable;
    
    ALU_8bit A1(out, a, b, opcode, enable);
    

    initial begin
 #10 enable = 1;   
 #10 opcode=8'b00001010; a=28; b=14;
 #10 opcode=8'b00000001; a=5; b=6;
 #10 opcode=8'b00000010; a=5; b=6;
 
 #10 enable = 0;
 
 #10 opcode=8'b00000011; a=5; b=6;
 #10 opcode=8'b00000100; a=5; b=6;
 #10 opcode=8'b00000101; a=5; b=6;
 #10 opcode=8'b00000110; a=5; b=6;
 
 #10 enable = 1;
 
 #10 opcode=8'b00000111; a=5; b=6;
 #10 opcode=8'b00001000; a=5; b=6;
 #10 opcode=8'b00001001; a=5; b=6;
 #10 opcode=8'b00001010; a=5; b=6;
 #10 opcode=8'b00001011; a=5; b=6;
 
 #10 enable = 0;
  
 #10 opcode=8'b00001100; a=5; b=6;
 #10 opcode=8'b00001101; a=5; b=6;
 #10 opcode=8'b00001110; a=5; b=6;
 
 #10 enable = 1;
  
 #10 opcode=8'b00001111; a=5; b=6;
    
    
$finish;
    end
    
endmodule
