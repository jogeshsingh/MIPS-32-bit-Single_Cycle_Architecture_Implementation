`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/15/2022 09:44:58 PM
// Design Name: 
// Module Name: Control_UNIT
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

`define WIDTH_I_FUNC 6
`define WIDTH_OP 2
`define WIDTH_opcode 6
`define WIDTH_ALU_control 4
module Control_UNIT(
i_funct, 
i_OPCODE ,
o_alu_control,
RegDst , 
ALUSrc, 
MemReg , 
RegWr, 
MemRd, 
MemWr,
o_branch, 
i_jump 
);

input [`WIDTH_I_FUNC-1:0] i_funct ;
input  [`WIDTH_opcode-1:0] i_OPCODE;
output [`WIDTH_ALU_control-1:0] o_alu_control;
wire  [`WIDTH_OP-1:0] i_ALU_OP;
output RegDst ;
output ALUSrc ;
output MemReg;
output RegWr ;
output MemRd;
output MemWr;
output o_branch ;
output i_jump ;
ALU_DECODER DEC
(.i_func(i_funct), 
 .i_ALUOp(i_ALU_OP) ,
 .o_ALU_control(o_alu_control));

Instruction_decoder ID(
 .i_opcode(i_OPCODE), 
 .i_ALU_op(i_ALU_OP), 
 .Reg_Dst(RegDst),
 .ALU_src(ALUSrc), 
 .Mem_reg(MemReg), 
 .Reg_wr(RegWr), 
 .Mem_rd(MemRd),
 .Mem_wr(MemWr),
 .branch(o_branch) , 
 .i_jump(i_jump)
  );

endmodule
