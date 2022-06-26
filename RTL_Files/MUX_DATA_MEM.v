`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/17/2022 10:19:22 PM
// Design Name: 
// Module Name: MUX_DATA_MEM
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
module MUX_DATA_MEM(
i_rd_data , 
i_alu_out ,
i_sel_mem , 
o_mux_mem
    );
input[`WIDTH_MEM-1:0] i_rd_data ; ///output of data memory//
input [`WIDTH_MEM-1:0] i_alu_out ; //output of ALU_reg ///
input i_sel_mem ;
output [`WIDTH_MEM-1:0] o_mux_mem ;

assign o_mux_mem = i_sel_mem? i_rd_data : i_alu_out ;     
endmodule
