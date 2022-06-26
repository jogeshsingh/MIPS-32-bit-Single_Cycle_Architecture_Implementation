`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/15/2022 09:36:46 PM
// Design Name: 
// Module Name: ADD_PC_4
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

`define WIDTH_PC  32
module ADD_PC_4(in_pc , out_pc);
 input [`WIDTH_PC-1:0] in_pc ;
 output [`WIDTH_PC-1:0] out_pc ; 
 
 assign out_pc = in_pc + 32'd4; 
endmodule
