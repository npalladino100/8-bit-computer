`timescale 1ns / 1ps


module cathodeControl(
output reg [6:0] ONE_DIGIT = 0,
input [6:0] Hundreds,
input [6:0] Tens,
input [6:0] Ones,
input [1:0] refreshCounter
    );
    
    
    always@(refreshCounter)
    begin
        case(refreshCounter)
            2'd0:
                ONE_DIGIT = Ones;
            2'd1:
                ONE_DIGIT = Tens;
            2'd2:
                ONE_DIGIT = Hundreds;
            2'd3:
                ONE_DIGIT = 7'b1000000;   // we'll use this digit to display negative
        endcase
    end
    
    
endmodule