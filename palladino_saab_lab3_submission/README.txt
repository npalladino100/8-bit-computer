Nicholas Palladino	U52182660
Anthony Saab		U90831072

For our digital system, we designed a really dumb 8-bit computer.
It's really dumb because it doesn't have any control logic, so it must be
controlled manually using 35 switches and a button.

Modules:
clock			100 Hz clock, also manually controllable
8-bit ALU		performs up to 256 arithmetic and logical operations
A register		stores an 8-bit value	(general purpose register)
B register		stores an 8-bit value
RAM			8 byte, 16 address random access memory
instruction register	stores the current instruction
output register		stores an 8-bit value, displayed on 7-seg display
program counter		4 bits track location in program


Switch Controls:
halt     	  halts and allows for clock to be controlled by button
MAR_in   	  memory address register in                           
RAM_in   	  random-access memory in                              
RAM_out  	  random-access memory out                             
IR_out   	  instruction register out                             
IR_in    	  instruction register in                              
A_in     	  A register in                                        
A_out    	  A register out                                       
ALU_out  	  ALU out                                                                                      
B_in     	  B register in                                        
out_in   	  output register in                                   
c_enable 	  counter enable                                       
c_out    	  counter output                                       
jump      	  jump program counter
address_control   allows for manual address input
RAM_data_toggle   allows for manual data input


Dip-Switch Controls:
m_address	  manual address for MAR (4 bits)
manual_data       for manually putting data in RAM (8 bits)
ALU_op		  ALU opcode for selecting operation (8 bits)


Button Control:
advance_clk       debounced button advances clock one cycle


Although programming and controlling this system is a pain, it's very capable.
Using the addition, subtraction, and multiplication from the ALU, many
calculations can be performed.  In theory, the device is Turing Complete
(given enough time and memory).  In reality, it needs more memory, but we
plan on upgrading the RAM to a much larger capacity.  For now, programs are
limited to 16 steps.

We wrote testbenches for each major component of the computer, and while some
testbenches may be outdated because we added additional ports to certain
modules, they have all been ensured functional.

In the demo, we will provide an example of programming and controlling the
computer.  We will multiply two numbers and display the result.




Contribution Statement:
Nicholas Palladino - ALU upgrade, RAM, clock, output register, program counter
Anthony Saab - Register design (A, B, instruction, MAR, output)