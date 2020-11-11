`timescale 1ns / 1ps

module computer_bus(
//~~~~~~~~~~~~~FPGA Constraints~~~~~~~~~~~~~~\\
output [6:0] LED_OUT,  
output [3:0] ANODE_OUT,
input clk_100MHz,
input [7:0] manual_data,// for manually putting data in RAM
input RAM_data_toggle,  // allows for manual data input
input advance_clk,      // advances clock one cycle
input address_control,  // allows for manual address input
input [3:0] m_address,  // manual address for MAR
output [3:0] pc_monitor_out,    // monitor program counter with LEDS
output [7:0] bus_monitor_out,   // monitor contents on bus with LEDS
//~~~~~~~~~~~~~~~~Controls~~~~~~~~~~~~~~~~~~~~\\ (Eventually connect to control unit)
input halt,     // halts and allows for clock to be controlled by button
input MAR_in,   // memory address register in
input RAM_in,   // random-access memory in
input RAM_out,  // random-access memory out
input IR_out,   // instruction register out
input IR_in,    // instruction register in
input A_in,     // A register in
input A_out,    // A register out
input ALU_out,  // ALU out
input [7:0] ALU_op,// ALU opcode
input B_in,     // B register in
input out_in,   // output register in
input c_enable, // counter enable
input c_out,    // counter output
input jump      // jump

    );
    
//~~~~~~~~~~~~~~~~Connections~~~~~~~~~~~~~~~~~~~~\\
wire [7:0] AALU;    // A register to ALU
wire [7:0] BALU;    // B register to ALU    
wire clk_100Hz;     // 100Hz divided clock signal
wire [3:0] address; // connect address register to RAM
wire B_out;         //unused for now
wire advance_clk_db;//debounced button signal for manual clock advance
 
    
wire [7:0] the_holy_wire;
      
      
    debouncer DB1(advance_clk_db, clk_100MHz, advance_clk);
    ALU_8bit ALU1(the_holy_wire, AALU, BALU, ~ALU_op, ALU_out, clk_100Hz);
    output_reg OR1(the_holy_wire, LED_OUT, ANODE_OUT, the_holy_wire, clk_100Hz, clk_100MHz, 0, out_in);
    RAM RAM1(the_holy_wire, the_holy_wire, address, RAM_out, RAM_in, ~manual_data, RAM_data_toggle, clk_100Hz);
    clock CLK1(clk_100Hz, clk_100MHz, halt, advance_clk_db);
    Areg AR1(the_holy_wire, AALU, the_holy_wire, clk_100Hz, A_out, A_in);
    Breg BR1(the_holy_wire, BALU, the_holy_wire, clk_100Hz, B_out, B_in);
    MAR MAR1(address, the_holy_wire[3:0], clk_100Hz, MAR_in, ~m_address, address_control);
    instruction_reg IR1(the_holy_wire[3:0], the_holy_wire, clk_100Hz, IR_out, IR_in);
    program_counter PC1(the_holy_wire[3:0], pc_monitor_out, the_holy_wire[3:0], clk_100Hz, c_enable, jump, c_out);
    
    assign bus_monitor_out = the_holy_wire;
    
endmodule
