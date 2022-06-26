`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/22/2022 09:24:50 AM
// Design Name: 
// Module Name: MUX5_JUMP
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

`define WIDTH_JUMP_ADDR 32
`define WIDTH_MUX_MEM 32
`define WIDTH_OUT_JUMP 32
module MUX5_JUMP(
input i_jump_sel ,
input [`WIDTH_JUMP_ADDR-1:0] o_jump , 
input [`WIDTH_MUX_MEM-1:0] o_mux_mem ,
output [`WIDTH_OUT_JUMP-1:0] o_mux5  
    );
assign o_mux5 = i_jump_sel ? o_jump : o_mux_mem ;        
endmodule
