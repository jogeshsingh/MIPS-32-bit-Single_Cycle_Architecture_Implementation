`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/15/2022 09:40:27 PM
// Design Name: 
// Module Name: ALU_REG
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

`define DATA_ALU_IN 32
`define ALU_SEL 4
`define ALU_OUT  32
//***************////
`define AND  4'b0000
`define OR   4'b0001
`define add  4'b0010
`define sub  4'b0110
`define slt  4'b0111
`define nor  4'b1100

module ALU_REG(i_rd1 , i_rd2 , i_sel_reg , o_ALU_reg, o_zero);
input [`DATA_ALU_IN-1:0] i_rd1 ;
input [`DATA_ALU_IN-1:0] i_rd2;
input [`ALU_SEL-1:0] i_sel_reg ;
output reg [`ALU_OUT-1:0] o_ALU_reg ;
output o_zero;
 
always @(*)
   begin
      case (i_sel_reg)
      `AND  : o_ALU_reg = i_rd1 & i_rd2;
      `OR   : o_ALU_reg = i_rd1 | i_rd2; 
      `add  : o_ALU_reg = i_rd1 + i_rd2;
      `sub  : o_ALU_reg = i_rd1 - i_rd2;
      `slt  : o_ALU_reg = (i_rd1<i_rd2)?{{32{1'b0}}, 1'b1}:{32{1'b0}};
      `nor  : o_ALU_reg = ~(i_rd1 | i_rd2) ;
      default : o_ALU_reg = 32'b0;
      endcase
end

assign o_zero = (o_ALU_reg == 32'b0)?1'b1:1'b0;
endmodule
