`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/15/2022 09:35:56 PM
// Design Name: 
// Module Name: Register_file
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

`define WIDTH_R_IN 5
`define WIDTH_R_OUT 32
`define DEPTH_REG 32
module Register_file
(i_clk ,
i_rst_n , 
rs1_reg ,
rs2_reg ,
rw_reg ,
reg_write,
wr_data,
rs1_read, 
rs2_read );

input i_clk ;
input i_rst_n ; //active -low -reset//
input [`WIDTH_R_IN -1:0] rs1_reg , rs2_reg; ///regsiter operands r1 , r2 -- 5 bit operand;
input reg_write ;                  ////enable for writing into the register file //
input [`WIDTH_R_IN-1:0] rw_reg  ;    ////write register operand---5 bit operand///
input [`DEPTH_REG-1:0] wr_data ;          ///write data from mem or alu to input of reg file--32 bit data//
output [`WIDTH_R_OUT-1:0] rs1_read , rs2_read ;   ///output read r1 , read r2 ---32 bit //


integer i;

///reg memory//
reg [`WIDTH_R_OUT-1:0] mem_reg [0:`DEPTH_REG-1];

always @(posedge i_clk )
 begin
       if(~i_rst_n)
          begin
          for (i=0; i<`DEPTH_REG ; i= i+1)
                begin
              mem_reg[i] <= 32'b0;  
              end
            end  
         else if(reg_write==1'b1)
               begin
               mem_reg [rw_reg] <=  wr_data ;
               end   
       end         
  ///assigning outputs of reg file to read reg rs1_read and rs2_read from reg operands  //     
  assign rs1_read = mem_reg[rs1_reg];
  assign rs2_read = mem_reg[rs2_reg];
       
 endmodule
