`timescale 1ns / 1ps

module computer_bus_testbench;

wire [6:0] LED_OUT;  
wire [3:0] ANODE_OUT;
reg clk_100MHz=0;
reg [7:0] manual_data;// for manually putting data in RAM
reg RAM_data_toggle;  // allows for manual data input
reg advance_clk=0;      // advances clock one cycle
reg address_control;  // allows for manual address input
reg [3:0] m_address;  // manual address for MAR
wire [3:0] pc_monitor_out;    // monitor program counter with LEDS
//~~~~~~~~~~~~~~~~Controls~~~~~~~~~~~~~~~~~~~~\\ (Eventually connect to control unit)
reg halt=0;     // halts and allows for clock to be controlled by button
reg MAR_in;   // memory address register in
reg RAM_in;   // random-access memory in
reg RAM_out;  // random-access memory out
reg IR_out;   // instruction register out
reg IR_in;    // instruction register in
reg A_in;     // A register in
reg A_out;    // A register out
reg ALU_out;  // ALU out
reg [7:0] ALU_op;// ALU opcode
reg B_in;     // B register in
reg out_in;   // output register in
reg c_enable=1; // counter enable
reg c_out=1;    // counter output
reg jump=0;


computer_bus BUS1(LED_OUT, ANODE_OUT, clk_100MHz, manual_data, RAM_data_toggle, 
advance_clk, address_control, m_address, pc_monitor_out, halt, MAR_in, RAM_in, 
RAM_out, IR_out, IR_in, A_in, A_out, ALU_out, ALU_op, B_in, out_in, c_enable, 
c_out, jump);




always #5 clk_100MHz = ~clk_100MHz;   //flip signal every 10ns (100MHz)

initial begin
#500 $finish;
end


endmodule
