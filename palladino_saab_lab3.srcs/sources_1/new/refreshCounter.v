`timescale 1ns / 1ps


module refreshCounter(

    output reg [1:0] refreshCounter = 0,
    input refresh_clock
    );
    
always@(posedge refresh_clock) refreshCounter <= refreshCounter +1;
endmodule