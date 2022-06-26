`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/15/2022 09:35:25 PM
// Design Name: 
// Module Name: TOP_DESIGN
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
`define INSTR_WIDTH 32
`define ALU_CONTROL 4
`define ALU_FUNCT 6
//`define ALU_OP 2
`define OPCODE_WIDTH 6
`define DATA_WID 32
module TOP_DESIGN
(
 input i_clk , 
 input rst_n ,
 input enable ,
 output zero 
  );
wire [`INSTR_WIDTH-1:0] o_instr ;
wire [`ALU_CONTROL-1:0] o_alu_control   ;
wire [`OPCODE_WIDTH-1:0] i_OPCODE     ;
wire RegDst  ;
wire o_branch ;
wire MemReg   ;
wire MemWr ;
wire MemRd    ;
wire ALUSrc   ;
wire RegWr    ;
wire i_jump ;
wire [`DATA_WID-1:0] pc_out ;
wire [`DATA_WID-1:0] ALU_OUT;
wire [`DATA_WID-1:0] o_Write_mem ;
wire [`DATA_WID-1:0] pc_instr ;
wire [`DATA_WID-1:0] rd_data_mem;

/*Instr_mem
	#(
	 .RAM_WIDTH(RAM_WIDTH), 
    .RAM_ADDR_BITS(RAM_ADDR_BITS),
	 .PROG_FILE(PROG_FILE),
	 .INIT_START_ADDR(INIT_START_ADDR),
	 .INIT_END_ADDR(INIT_END_ADDR)
	)
	INST_MEM(
								.clk(i_clk),
								.enable(enable),
								.write_en(1'b0),
    		               .address(pc_out),
    		               .input_data(32'b0),
	                     .output_data(o_instr)
	);
	*/
instr_mem PROGRAM_MEMORY(.pc_addr(pc_out), .o_instr(o_instr)); 

Control_UNIT CU(
.i_funct(o_instr[5:0]), 
.i_OPCODE(o_instr[31:26]) ,
.o_alu_control(o_alu_control),
.RegDst(RegDst) , 
.ALUSrc(ALUSrc), 
.MemReg(MemReg) , 
.RegWr(RegWr), 
.MemRd(MemRd), 
.MemWr(MemWr),
.o_branch(o_branch), 
.i_jump(i_jump)
);


DATA_PATH DU(
 .i_clk(i_clk) , 
 .rst_n(rst_n) ,
 .rd_data(rd_data_mem) ,  ///data  read from data memory ///
 .inst(o_instr),        //Instruction ///
 .RegDst(RegDst),                       ///control signals//
 .o_branch(o_branch) ,                    
 .MemReg(MemReg) ,
 .ALUSrc(ALUSrc) , 
 .RegWr(RegWr) , 
 .i_jump(i_jump),
 .o_alu_control(o_alu_control) ,
 .pc_out(pc_out) ,     ///output of Program counter (aka..instruction pointer ///
 .WR_mem(o_Write_mem) ,  ///data to be written to the data memory//
 .ALU_OUT(ALU_OUT) , ///output of alu to be fed to address input of data memory ///
 .zero(zero) 
);

DATA_MEM MEMORY(
 .i_clk(i_clk) ,
 .i_addr(ALU_OUT) , 
 .i_write(MemWr), 
 .i_data(o_Write_mem) , 
 .i_read(MemRd), 
 .o_data(rd_data_mem));

endmodule
