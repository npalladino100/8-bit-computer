`timescale 1ns / 1ps

module RAM_testbench;
wire [7:0] O;
reg [7:0] bus_data;
reg [3:0] address;
reg enable = 0;
reg load = 0;
reg [7:0] manual_data;
reg toggle;


RAM RAM1(O, bus_data, address, enable, load, manual_data, toggle);

initial begin
#100 address = 4'b0000; #100 bus_data = 8'b10101001; toggle = 0; manual_data = 8'b10000001;
#100 load = 1'b1;
#100 load = 1'b0;
#100 enable = 1'b1;
#100 enable = 1'b0;
#100 address = 4'b0001;
#100 bus_data = 8'b11111101;
#100 load = 1'b1; toggle = 1;
#100 load = 1'b0;
#100 enable = 1'b1;
#100 enable = 1'b0; load = 1'b0;
#100 address = 4'b0000;
#100 enable = 1'b1; load = 1'b1; 
address = 4'b0001; load = 1'b0; toggle = 0;
#100 $finish;
    end
    
    endmodule