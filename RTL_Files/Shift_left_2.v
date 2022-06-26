`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/15/2022 09:43:45 PM
// Design Name: 
// Module Name: Shift_left_2
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

`define DATA_SHIFT 32
module Shift_left_2( i_instr  , o_instr );
input [`DATA_SHIFT-1:0] i_instr ;
output [`DATA_SHIFT-1:0] o_instr ;


assign o_instr = i_instr<<2 ;
endmodule
