`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/17/2022 10:47:11 AM
// Design Name: 
// Module Name: Instruction_decoder
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

`define OPCODE_WIDTH 6
`define ALU_OP_WIDTH 2
`define WIDTH_CONTROL 10
module Instruction_decoder(
 i_opcode, 
 i_ALU_op, 
 Reg_Dst,
 ALU_src, 
 Mem_reg, 
 Reg_wr, 
 Mem_rd,
 Mem_wr,
 branch , 
 i_jump
 );
 
 
 input [`OPCODE_WIDTH-1:0] i_opcode ;
 output [`ALU_OP_WIDTH-1:0] i_ALU_op ;
 output Reg_Dst ;
 output ALU_src;
 output Mem_reg ;
 output Reg_wr;
 output Mem_rd ;
 output Mem_wr ;
 output branch ;
 output i_jump ;
 
 
 reg [`WIDTH_CONTROL-1:0] CV ;   //control vector ///
 //assigning control vector to outputs//
 assign i_jump   = CV[9];
 assign Reg_Dst  = CV[8];
 assign ALU_src  = CV[7];
 assign Mem_reg  = CV[6];
 assign Reg_wr   = CV[5];
 assign Mem_rd   = CV[4];
 assign Mem_wr   = CV[3];
 assign branch   = CV[2];
 assign i_ALU_op = CV[1:0]; 
 
 ///instrcutions ---to execute///
 parameter R_TYPE = 6'b000000,            ///Arithmetic , branch operations //
           Store  = 6'b101011,           //store word to memory
           load   = 6'b100011,          //load word to Reg_file//
           add_i  = 6'b101001,         ///add immediate//
           beq    = 6'b000100,       ///branch  equal
           jump   = 6'b000010;       ///jump ///        
always @(*)
    begin
       case (i_opcode)
       R_TYPE : CV = 10'b010010_0010; ///[{Reg_Dst , Reg_wr , i_AlU_op[1] }= 1 , rest are assigned  0]
       Store  : CV = 10'b0x1x00_1000; ///[{ALU_src , Mem_wr = 1} , rest are assigned 0 except Reg_Dst = 1'bx ]    
       load   : CV = 10'b001111_0000; //[{ALU_Src, Mem_reg ,Reg_wr , Mem_rd = 1} , rest are assigned  0]
       add_i  : CV = 10'b001010_0000;  ///[{ALU_src , Reg_wr = 1}, rest are assigned 0]   
       beq    : CV = 10'b0x0x00_0101;  ///[{branch , i_AlU_op[0] = 1} , rest are assigned  0] 
       jump   : CV = 10'b100000_0000; ///[{i_jump =1} rest all are assigned 0]
       default : CV = 9'b00000_0000;
       endcase
    end    
endmodule
