`timescale 1ns / 1ps


module ALU_8bit (
    output reg  [7:0] out,
    input       [7:0] a,
    input       [7:0] b,
    input       [7:0] opcode,
    input            enable,
    input clk
    );		                    
    
    reg [7:0] out_reg;          
    wire [7:0] w1;    //AND          0
    wire [7:0] w2;    //OR           1 
    wire [7:0] w3;    //NAND         2 
    wire [7:0] w4;    //NOR          3 
    wire [7:0] w5;    //XOR          4 
    wire [7:0] w6;    //XNOR         5 
    wire [7:0] w7;    //NOTA         6 
    wire [7:0] w8;    //NOTB         7 
                                      
    wire [7:0] w9;    //NEGA         8  
    wire [7:0] w10;   //NEGB         9 
    wire [7:0] w11;   //APLUSB       10
    wire [7:0] w12;   //AMINUSB      11
    wire [7:0] w13;   //ATIMESB      12
    wire [7:0] w14;   //BMINUSA      13
    wire [7:0] w15;   //APLUSONE     14
    wire [7:0] w16;   //AMINUSONE    15
                                     
    eightBitAnd AND1(w1, a, b);
    eightBitOr OR1(w2, a, b);
    eightBitNand NAND1(w3, a, b);
    eightBitNor NOR1(w4, a, b);
    eightBitXor XOR1(w5, a, b);
    eightBitXnor XNOR1(w6, a, b);
    onesComplementA ONES1(w7, a, b);
    onesComplementB ONES2(w8, a, b);
    negateA TWOS1(w9, a, b);
    negateB TWOS2(w10, a, b);
    carrySelectAdder ADD1(w11, a, b);
    carrySelectSubtractor SUB1(w12, a, b);
    eightBitMultiplier PROD1(w13, a, b);
    BminusA SUB2(w14, a, b);
    Aplus1 ADD2(w15, a, b);
    Aminus1 SUB3(w16, a, b);


  // This always block is executed whenever a, b, c or sel changes in value
  always @ (*) begin
    case(opcode)
      //Logic
      4'b00000000    : out_reg = w1;	//AND          0 	
      4'b00000001    : out_reg = w2; 	//OR           1 	
      4'b00000010    : out_reg = w3; 	//NAND         2 	
      4'b00000011    : out_reg = w4; 	//NOR          3 	
      4'b00000100    : out_reg = w5; 	//XOR          4 	
      4'b00000101    : out_reg = w6; 	//XNOR         5 	
      4'b00000110    : out_reg = w7; 	//NOTA         6 	
      4'b00000111    : out_reg = w8;    //NOTB         7 
                      
      //Arithmetic		      
      4'b00001000    : out_reg = w9; 	//NEGA         8    
      4'b00001001    : out_reg = w10; 	//NEGB         9 	
      4'b00001010    : out_reg = w11; 	//APLUSB       10
      4'b00001011    : out_reg = w12; 	//AMINUSB      11
      4'b00001100    : out_reg = w13; 	//ATIMESB      12
      4'b00001101    : out_reg = w14; 	//BMINUSA      13
      4'b00001110    : out_reg = w15; 	//APLUSONE     14
      4'b00001111    : out_reg = w16; 	//AMINUSONE    15
      default  : out_reg = 0; 		// If sel is anything else, out is always 0
    endcase
    end
    
    
    always @(posedge clk) begin
    if (enable == 1'b1) out = out_reg;
    else
    out = 8'bzzzzzzzz;
    end
    
endmodule