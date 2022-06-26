`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/15/2022 11:16:18 PM
// Design Name: 
// Module Name: Program_counter
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

`define WIDTH_PC 32
module Program_counter(
i_clk , 
i_rst_n ,
i_PC , 
o_PC  
);

input i_clk ;
input i_rst_n ;
input [`WIDTH_PC-1:0] i_PC;
output reg [`WIDTH_PC-1:0] o_PC ;

always @(posedge i_clk , negedge i_rst_n)
  begin
     if (~i_rst_n)
        begin
         o_PC <= 32'b0;
         end
      else
         begin
         o_PC = i_PC ;
         end
       end      
endmodule


