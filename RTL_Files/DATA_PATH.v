`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/15/2022 09:45:15 PM
// Design Name: 
// Module Name: DATA_PATH
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

`define WIDTH_INSTR 32
`define WIDTH_DATA 32
`define WIDTH_RegWR 5
`define WIDTH_REG_SEL 5
`define WIDTH_ALU_CNTRL 4
module DATA_PATH(
input i_clk , 
input rst_n ,
input [`WIDTH_DATA-1:0] rd_data ,  ///data  read from data memory ///
input [`WIDTH_INSTR-1:0]inst,        //Instruction ///
input RegDst,                       ///control signals//
input o_branch ,                    
input MemReg ,
input ALUSrc , 
input RegWr ,
input i_jump ,
input [`WIDTH_ALU_CNTRL-1:0] o_alu_control ,

output [`WIDTH_DATA-1:0] pc_out ,     ///output of Program counter (aka..instruction pointer ///
output [`WIDTH_DATA-1:0] WR_mem ,  ///data to be written to the data memory//
output [`WIDTH_DATA-1:0] ALU_OUT , ///output of alu to be fed to address input of data memory ///
output zero 
);
wire [`WIDTH_DATA-1:0] jump_addr ;
wire [`WIDTH_DATA-1:0] RD1_reg ;       ///read data1 from reg file///
wire [`WIDTH_DATA-1:0] RD2_reg ;       ///read data2 from reg file //
wire [`WIDTH_DATA-1:0] Alu_out ;       ///output of ALU///
//wire [`WIDTH_INSTR-1:0]o_mem_out ,  ////data out from mux4 to be written to reg file ///
wire  Pc_src   ;                   ///output of and_gate for selection of pc_+_4 or branch address///
wire [`WIDTH_DATA-1:0] o_PC_4_ADD ;     //output of pc_adder//
wire [`WIDTH_REG_SEL-1:0] MUX_3_REG ;    ///output of mux selection of either rs or rt///
wire [`WIDTH_DATA-1:0] MUX_1_ALU_REG ;   //output of mux selection of either RD2_reg from reg file or sign_extension unit //
wire [`WIDTH_DATA-1:0] MUX_2_BRANCH ;      //output of mux of either pc_+4 or branch address//
wire [`WIDTH_DATA-1:0] MUX_4_DATA_MEM ;         //output of DATA_mem selection of wither alu_out or data read from data memory//
wire [`WIDTH_DATA-1:0] out_ADD_BRANCH ;      ///output of adder2 which adds pc_+_4 and sign_extend (shift_left<<2) //
wire [`WIDTH_DATA-1:0] out_SIGN_EXTEND ;     //output of sign_extend unit//
wire [`WIDTH_DATA-1:0] out_shift     ;       //output of shift_left_by_2 unit ///
wire [`WIDTH_DATA-1:0] o_sign_extend_jump ;
wire [`WIDTH_DATA-1:0] MUX_5_JUMP;
assign pc_inst = pc_out ;
assign WR_mem = RD2_reg ;
assign ALU_OUT = Alu_out ;
assign jump_addr = {o_PC_4_ADD[31:28] , o_sign_extend_jump[25:0] } ;
////REG_FILE INSTANTIATION///
Register_file REG_FILE
(.i_clk(i_clk) , 
.rs1_reg(inst[25:21]) ,          //reg_1 op ///
.rs2_reg(inst[20:16]) ,         ///reg_2 op //
.rw_reg(MUX_3_REG) ,               //wr_op ///
.reg_write(RegWr),          ///reg_write enable ///
.wr_data(MUX_4_DATA_MEM),            ///data to be written from data memory///
.rs1_read(RD1_reg),             ///read register 1 //
.rs2_read(RD2_reg) );           ///read register 2///


 ///AND_GATE //
 And_gate AND_BRANCH(.in_1(o_branch), .in_2(zero), .out_g(Pc_src));
 
 ///ADDER PC_4///
 ADD_PC_4 ADDER_PC (.in_pc(pc_out) ,.out_pc(o_PC_4_ADD));
 
 ///ALU_REG_SEL_MUX
 MUX_ALU MUX1(.i_m1(RD2_reg) , .i_m2(out_SIGN_EXTEND) , .i_sel(ALUSrc)  , .o_mux(MUX_1_ALU_REG) );
 
 ///MUX_MEM SEL branch or PC_+_4//
 MUX_MEM MUX2(.i_pc_in(o_PC_4_ADD) , .o_alu_branch(out_ADD_BRANCH)  , .i_sel_mem(Pc_src)  , .o_mem(MUX_2_BRANCH));
 
 ///MUX_REG SEL either rt or rd//
 MUX_REG MUX3(.i_1(inst[20:16]), .i_2(inst[15:11]), .sel_1(RegDst)  , .mux_o1(MUX_3_REG) );
 
 //MUX DATA_MEMORY SEL either rd_data from mem or from ALU///
 MUX_DATA_MEM MUX4(
 .i_rd_data(rd_data) ,
 .i_alu_out( Alu_out) ,
 .i_sel_mem(MemReg) , 
 .o_mux_mem(MUX_4_DATA_MEM)
    );
 
 ///ADDER for BRANCH//
 ADD_Branch ADDER2
 (.i_op1(o_PC_4_ADD) ,
  .i_op2(out_shift) , 
  .o_out(out_ADD_BRANCH ));
 
 //ALU///
 ALU_REG ALU
  (.i_rd1(RD1_reg) ,
  .i_rd2(MUX_1_ALU_REG) ,
  .i_sel_reg(o_alu_control) ,
  .o_ALU_reg(Alu_out),
  .o_zero(zero));
  
  ///PROGRAM_COUNTER ///
  Program_counter PC
  (.i_clk(i_clk) , 
   .i_rst_n(rst_n) ,
   .i_PC(MUX_5_JUMP) , 
   .o_PC(pc_out)  
   );
   
   ///MUX_5 for the selection of either jump or {branch or pc+4) ///
   MUX5_JUMP MUX_5(.i_jump_sel(i_jump) , .o_jump(jump_addr) , .o_mux_mem(MUX_2_BRANCH) , .o_mux5(MUX_5_JUMP  ));
   //shift left by 2 for jump instruction ///
   Shift_left_2 SHIFT_INSTR( .i_instr(inst[25:0])  , .o_instr(o_sign_extend_jump ) );
   
   ///shift left by 2 for immediate//
   Shift_left_2 SHIFT_immediate( .i_instr(out_SIGN_EXTEND)  , .o_instr(out_shift) );
   
   ///SIGN -EXTENSION//
  Sign_Extend SIGN_EXTEND(.instr_a(inst[15:0]) , .out_sign(out_SIGN_EXTEND));
 
endmodule
