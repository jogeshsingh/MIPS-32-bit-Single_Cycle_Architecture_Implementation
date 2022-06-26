`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/15/2022 09:38:19 PM
// Design Name: 
// Module Name: DATA_MEM
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

`define MEM_DEPTH 256
`define MEM_WIDTH 32
`define MEM_ADDR 32
module DATA_MEM(
 i_clk , 
 i_addr , 
 i_write , 
 i_data , 
 i_read, 
 o_data);
 
 input i_clk ;
 input i_write ;
 input i_read ;
 input [`MEM_WIDTH-1:0] i_data;
 input [`MEM_ADDR-1:0] i_addr;
 output  [`MEM_WIDTH-1:0] o_data ;
 
 ///data memory gen//
 reg [`MEM_WIDTH-1:0] mem_data[0:`MEM_DEPTH-1];
 
 //integer i;
 
 //initializing memory contents //
 initial
     begin
     mem_data[0] <= 32'b00000000000000000000000000000000;
     mem_data[1] <= 32'b00000000000000000000000000000001;
     mem_data[2] <= 32'b00000000000000000000000000111111;
     mem_data[3] <= 32'b00000000000000000000000000001001;
     mem_data[4] <= 32'b00000000000000000000000000000111;
     mem_data[5] <= 32'b00000000000000000000000000001111;
     mem_data[6] <= 32'b00000000000000000000000000000001;
     mem_data[8] <= 32'b00000000000000000000000000100001;
     mem_data[9] <= 32'b00000000000000000000000000000001;
     mem_data[10] <= 32'b00000000000000000000000010000001;
     mem_data[11] <= 32'b00000000000000000000000000000000;
     mem_data[12] <= 32'b00000000000000000000000000000000;
     mem_data[13] <= 32'b00000000000000000000000000000000;
     mem_data[14] <= 32'b00000000000000000000000000001100;
     mem_data[15] <= 32'b00000000000000000000000000000000;
     mem_data[16] <= 32'b00000000000000000000000000000000;
     mem_data[17] <= 32'b00000000000000000000000000000000;
     mem_data[18] <= 32'b00000000000000000000000000000000;
     mem_data[19] <= 32'b00000000000000000000000000000000;
     mem_data[20] <= 32'b00000000000000000000000000000000;
     mem_data[21] <= 32'b00000000000000000000000000000000;
     mem_data[22] <= 32'b00000000000000000000000000000000;
     mem_data[23] <= 32'b00000000000000000000000000000000;
     mem_data[24] <= 32'b00000000000000000000000000000000;
     mem_data[25] <= 32'b00000000000000000000000000000000;
     mem_data[26] <= 32'b00000000000000000000000000000000;
     mem_data[27] <= 32'b00000000000000000000000000000000;
     mem_data[28] <= 32'b00000000000000000000000000000000;
     mem_data[29] <= 32'b00000000000000000000000000000000;
     mem_data[30] <= 32'b00000000000000000000000000000000;
     mem_data[31] <= 32'b00000000000000000000000000000000;
     //mem_reg[16] <= 32'b00000000000000000000000000000001;
end


 
 always @(posedge i_clk)
    begin
     if (i_write==1'b1 )
           begin
              mem_data[i_addr] <= i_data;
            end
    end 
  
       assign o_data = i_read? mem_data[i_addr]:32'b0;            
endmodule
