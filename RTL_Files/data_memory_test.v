`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/16/2022 08:39:55 PM
// Design Name: 
// Module Name: data_memory_test
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

`define  M_DEPTH 256
`define D_WIDTH 32
`define ADDR_WIDTH 5
module data_memory_test();
reg i_clk , i_rst_n , i_write , i_read ;
reg [`ADDR_WIDTH-1:0] i_addr ;
reg [`D_WIDTH-1:0] i_data ;
wire [`D_WIDTH-1:0] o_data ;


///instantiating the memory module ///
DATA_MEM DUT(
 i_clk ,
 i_rst_n , 
 i_addr , 
 i_write , 
 i_data , 
 i_read, 
 o_data);

//clk gen///
always #5 i_clk = ~i_clk ;

initial
  begin
   i_clk = 1'b0;
   i_rst_n = 1'b0;
   end
   
   ///address ///
 initial
   begin
   #10 i_addr = 5'b00000;
    #10  i_addr = 5'b00001;
   #10 i_addr = 5'b00010;
    #10  i_addr = 5'b00011;
     #10 i_addr = 5'b00100;
    #10  i_addr = 5'b00101;
   #10 i_addr = 5'b00110;
    #10  i_addr = 5'b00111;
   end
   
   
   initial
    begin
     i_rst_n = 1'b1 ;
     #40;
     end 
     
     
   initial
      begin
       #10 i_data = 32'd45;
          i_write = 1'b1;
          i_read = 1'b1;
       #10 i_data = 32'd55; 
          i_write = 1'b1 ;
          i_read = 1'b0;
       #14 i_data = 32'd560;
           i_write = 1'b1 ;
           i_read = 1'b1;
       #14 i_data = 32'd567;
          i_write = 1'b1;
        #2  i_read = 1'b1;
        #300 $stop ;
        end
                    

endmodule
