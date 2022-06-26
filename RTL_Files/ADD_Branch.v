`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/17/2022 11:26:32 AM
// Design Name: 
// Module Name: ADD_Branch
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

`define WIDTH_BRANCH 32
module ADD_Branch(i_op1 , i_op2 , o_out);
input [`WIDTH_BRANCH-1:0] i_op1 ;
input [`WIDTH_BRANCH-1:0] i_op2 ;
output [`WIDTH_BRANCH-1:0] o_out;


assign o_out = i_op1 + i_op2 ;
endmodule
