`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/15/2022 10:01:47 PM
// Design Name: 
// Module Name: MUX_MEM
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

`define WIDTH_MEM 32
module MUX_MEM(i_pc_in , o_alu_branch  , i_sel_mem  , o_mem);
input [`WIDTH_MEM-1:0] i_pc_in  ;
input [`WIDTH_MEM-1:0]  o_alu_branch ;
input  i_sel_mem;
output [`WIDTH_MEM-1:0] o_mem ;

assign o_mem = i_sel_mem? o_alu_branch : i_pc_in ;

endmodule
