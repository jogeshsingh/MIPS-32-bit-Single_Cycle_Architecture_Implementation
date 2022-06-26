`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/19/2022 05:40:41 PM
// Design Name: 
// Module Name: Top_design_tb
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

`define DATA_PWIDTH 32
`define INST_WIDTH 32
module Top_design_tb();
reg i_clk ;
reg rst_n ;
wire zero ;


TOP_DESIGN DUT2(
  i_clk , 
  rst_n, 
  zero 
  );
  
  
 /* DATA_MEM DUT1(
 i_clk ,
 i_rst_n , 
 i_addr , 
 i_write , 
 i_data , 
 i_read, 
 o_data);
 */
initial
   begin
    i_clk = 1'b0;
    rst_n = 1'b0;
    //enable = 1'b0;
    end
    
    always #5 i_clk = ~i_clk ;
    
   initial
      begin
       #5 rst_n = 1'b1 ;
      /// #2 enable = 1'b1 ;
       #1000 $stop ;
       end
        
   
endmodule
