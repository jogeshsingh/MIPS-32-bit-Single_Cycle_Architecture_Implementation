`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/15/2022 09:36:15 PM
// Design Name: 
// Module Name: Instr_mem
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
module instr_mem( input [31:0] pc_addr, 
                  output [31:0] o_instr); 
	
	reg [32:0] rom[24:0];
	
		assign  o_instr =  rom[pc_addr[31:0]] ; // provides required instruction

	initial 
		begin 
		         ///opcode/ /rs/  /rt/   rd///shamt///funct//
		rom[0] = 32'b000000_00001_00010_01100_00000_100000;  //add rd[12] rs[1] rt[2];
		rom[1] = 32'b000000_00101_00011_01011_00000_100101;  //or rd[11] rs[5] rt[3];
		rom[2] = 32'b000000_01000_00101_01101_00000_100100;  //
		rom[3] = 32'b000000_01000_00101_01101_00000_100100;  //
		rom[4] = 32'b000000_01000_00101_01101_00000_100100;  //and Rd[13] Rs[8] Rt[5]
		rom[5] = 32'b000000_00000_00000_00000_00000_000000;	
		rom[6] = 32'b00000000000000000000000000000000; 
		rom[7] = 32'b00000000000000000000000000000000;  
		rom[8] = 32'b101001_01110_00000_0000010001111100;  //add_immediate == in Rt[0] = Rs[14]+imm(1148)/// 
		rom[9] = 32'b00000000000000000000000000000000; 
		rom[10] = 32'b00000000000000000000000000000000;  
		rom[11] = 32'b00000000000000000000000000000000;  
		rom[12] = 32'b101011_00101_00100_0000000000000001; ///store word (mem[$rs[]+offset] <= rt[]) , 
		rom[13] = 32'b00000000000000000000000000000000;  
		rom[14] = 32'b00000000000000000000000000000000;
		rom[15] = 32'b00000000000000000000000000000000;
		rom[16] = 32'b100011_11000_00010_0000000000000010; ///load word $dest((rt)) <= mem(offset($rs[])) ..
		rom[17] = 32'b00000000000000000000000000000000;  
		rom[18] = 32'b00000000000000000000000000000000;
		rom[19] = 32'b00000000000000000000000000000000;
		rom[20] = 32'b000000_00010_00000_11001_00000_100000; ///r-type add  rd-> rs(24) + rt(2)  here 24 and 2 are the address locations of source register operands// 
		rom[21] = 32'b100011_11000_00010_0000000000000010; ///load word $dest((rt)) , offset($rs) ..
		rom[22] = 32'b00000000000000000000000000000000;  
		rom[23] = 32'b00000000000000000000000000000000;
		rom[24] = 32'b000010_00000000000000000000000010;
		//rom[20] = 32'b000000_00010_00000_11001_00000_100000; ///r-type add  rd-> rs(24) + rt(2)  here 24 and 2 are the address locations of source register operands// 
		
		end 
	
endmodule

/*module Instr_mem
	#(
		parameter RAM_WIDTH 		= 32,
		parameter RAM_ADDR_BITS 	= 32,
		parameter PROG_FILE 		= "instruction_add.txt",
		parameter INIT_START_ADDR 	= 0,
		parameter INIT_END_ADDR		= 2
	)
	(
	input							clk,
	input							enable,
	input							write_en,
   input 		[RAM_ADDR_BITS-1:0]	address,
   input 		[RAM_WIDTH-1:0] 	input_data,
	output reg 	[RAM_WIDTH-1:0] 	output_data
	);
	
   
   (* RAM_STYLE="BLOCK" *)
   reg [RAM_WIDTH-1:0] mem [(2**RAM_ADDR_BITS)-1:0];


   //  The forllowing code is only necessary if you wish to initialize the RAM 
   //  contents via an external file (use $readmemb for binary data)
   initial
      $readmemh(PROG_FILE, mem, INIT_START_ADDR, INIT_END_ADDR);

   always @(posedge clk)
      if (enable) begin
         if (write_en)
            mem[address] <= input_data;
         output_data <= mem[address>>2];
      end

endmodule
*/



/*`define INSTR_WIDTH 32
`define INSTR_DEPTH 3
module Instr_mem(i_clk , enable  , i_pc , o_instr);
///parameter HEX_PATH = "instruction_add.txt";  // Set to local dir
input i_clk ;
input enable ;
input [`INSTR_WIDTH-1:0] i_pc ;
output  reg [`INSTR_WIDTH-1:0] o_instr ;


///program memory//
reg[`INSTR_WIDTH-1:0] mem[0:`INSTR_DEPTH-1] ;

initial
begin

      $readmemb("instruction_add.txt", mem, 0, (2**INSTR_DEPTH)-1);
end
   always @(posedge i_clk)
      if (enable)
         o_instr <= mem[i_pc>>2];
				
	// parameter ROM_WIDTH = <rom_width>;
 //  parameter ROM_ADDR_BITS = <rom_addr_bits>;

  // (* rom_style="{distributed | block}" *)
  // reg [ROM_WIDTH-1:0] <rom_name> [(2**ROM_ADDR_BITS)-1:0];
  // reg [ROM_WIDTH-1:0] <output_data>;

  // <reg_or_wire> [ROM_ADDR_BITS-1:0] <address>;

 			

  
  
  
endmodule
*/
