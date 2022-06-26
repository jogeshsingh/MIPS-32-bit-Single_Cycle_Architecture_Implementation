`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/15/2022 09:57:15 PM
// Design Name: 
// Module Name: MUX_ALU
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

`define WIDTH_MUX_ALU 32
module MUX_ALU(i_m1 , i_m2 , i_sel  , o_mux );
input [`WIDTH_MUX_ALU-1:0] i_m1 , i_m2 ;
input i_sel ;
output [`WIDTH_MUX_ALU -1:0] o_mux ;
//selects inputs from rd2 from reg_file if i_sel =0 else selects 32 bit sign extended from instr.. 15-0 for [I-TYPE Operation like LW, SW)
assign o_mux = i_sel? i_m2 : i_m1 ;

endmodule
