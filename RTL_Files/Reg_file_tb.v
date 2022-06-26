`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/15/2022 10:42:48 PM
// Design Name: 
// Module Name: Reg_file_tb
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


module Reg_file_tb();
reg i_clk ;
reg i_rst_n ;
reg [4:0] rs1_reg , rs2_reg ;
reg reg_write ;
reg [4:0] rw_reg ;
reg [31:0] wr_data ;
wire [31:0] rs1_read , rs2_read ;

Register_file DUT (i_clk ,
i_rst_n , 
rs1_reg ,
rs2_reg ,
rw_reg ,
reg_write,
wr_data,
rs1_read, 
rs2_read );

initial
  begin
    i_clk = 1'b0;
    i_rst_n = 1'b0;
    wr_data = 0;
   // rw_reg = 0;
    
     end
     
     
     always #5 i_clk = ~i_clk ;
     
     
     initial
          begin
         #12 wr_data = 32'd43;
             rw_reg  = 0;
         #10 wr_data = 32'd68;
             rw_reg  = 1;
         #10 wr_data = 32'd69;
             rw_reg = 0;
         #10 wr_data = 32'd48;
             rw_reg = 1;
         #10 wr_data = 32'd73;
         #10 wr_data = 32'd88;
         #10 wr_data = 32'd86;
         #10 wr_data = 32'd108;
      end
     initial
       begin
        #12 i_rst_n = 1'b1 ;
        #10 rs1_reg = 5'b00000;
         rs2_reg = 5'b00001;
         reg_write= 1'b1 ;
        #10 rs1_reg = 5'b00000;
         rs2_reg = 5'b00001;
         reg_write = 1'b1 ;
        #10 rs1_reg = 5'b00001;
         rs2_reg = 5'b00000;
         reg_write = 1'b1 ;
        #10 rs1_reg = 5'b00001;
         rs2_reg = 5'b00001;
         reg_write = 1'b1 ;
        #300;
        
        end 
endmodule
