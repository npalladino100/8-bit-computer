`timescale 1ns / 1ps
module BCDDisplay(
    output reg [6:0] segments1,
    output reg [6:0] segments2,
		output reg [6:0] segments3,
    input [3:0] Hundreds,
    input [3:0] Tens,
		input [3:0] Ones
    );

    always @(*)
        case (Hundreds)
            4'b0000: segments1 = 7'b100_0000;
            4'b0001: segments1 = 7'b111_1001;
            4'b0010: segments1 = 7'b010_0100;
            4'b0011: segments1 = 7'b011_0000;
            4'b0100: segments1 = 7'b001_1001;
            4'b0101: segments1 = 7'b001_0010;
            4'b0110: segments1 = 7'b000_0010;
            4'b0111: segments1 = 7'b111_1000;
            4'b1000: segments1 = 7'b000_0000;
            4'b1001: segments1 = 7'b001_1000;   
            default: segments1 = 7'b100_0000;
        endcase
        
    always @(*)
        case (Tens)
            4'b0000: segments2 = 7'b100_0000;
            4'b0001: segments2 = 7'b111_1001;
            4'b0010: segments2 = 7'b010_0100;
            4'b0011: segments2 = 7'b011_0000;
            4'b0100: segments2 = 7'b001_1001;
            4'b0101: segments2 = 7'b001_0010;
            4'b0110: segments2 = 7'b000_0010;
            4'b0111: segments2 = 7'b111_1000;
            4'b1000: segments2 = 7'b000_0000;
            4'b1001: segments2 = 7'b001_1000;   
            default: segments2 = 7'b100_0000;
        endcase

    always @(*)
        case (Ones)
            4'b0000: segments3 = 7'b100_0000;
            4'b0001: segments3 = 7'b111_1001;
            4'b0010: segments3 = 7'b010_0100;
            4'b0011: segments3 = 7'b011_0000;
            4'b0100: segments3 = 7'b001_1001;
            4'b0101: segments3 = 7'b001_0010;
            4'b0110: segments3 = 7'b000_0010;
            4'b0111: segments3 = 7'b111_1000;
            4'b1000: segments3 = 7'b000_0000;
            4'b1001: segments3 = 7'b001_1000;   
            default: segments3 = 7'b100_0000;
        endcase
        
endmodule