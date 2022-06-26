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
rs1_reg ,
rs2_reg ,
rw_reg ,
reg_write,
wr_data,
rs1_read, 
rs2_read );

input i_clk ;
//input i_rst_n ; //active -low -reset//
input [`WIDTH_R_IN -1:0] rs1_reg , rs2_reg; ///regsiter operands r1 , r2 -- 5 bit operand;
input reg_write ;                  ////enable for writing into the register file //
input [`WIDTH_R_IN-1:0] rw_reg  ;    ////write register operand---5 bit operand///
input [`DEPTH_REG-1:0] wr_data ;          ///write data from mem or alu to input of reg file--32 bit data//
output [`WIDTH_R_OUT-1:0] rs1_read , rs2_read ;   ///output read r1 , read r2 ---32 bit //


integer i;

///reg memory//
reg [`WIDTH_R_OUT-1:0] mem_reg [0:`DEPTH_REG-1];

initial
   begin
     mem_reg[0] <= 32'b00000000000000000000000000000000;
     mem_reg[1] <= 32'b00000000000000000000000000000001;
     mem_reg[2] <= 32'b00000000000000000000000000001001;
     mem_reg[3] <= 32'b00000000000000000000000000001001;
     mem_reg[4] <= 32'b00000000000000000000000000000001;
     mem_reg[5] <= 32'b00000000000000000000000000001111;
     mem_reg[6] <= 32'b00000000000000000000000000000001;
     mem_reg[8] <= 32'b00000000000000000000000000100001;
     mem_reg[9] <= 32'b00000000000000000000000000000001;
     mem_reg[10] <= 32'b00000000000000000000000010000001;
     mem_reg[11] <= 32'b00000000000000000000000000000000;
     mem_reg[12] <= 32'b00000000000000000000000000000000;
     mem_reg[13] <= 32'b00000000000000000000000000000000;
     mem_reg[14] <= 32'b00000000000000000000000000001100;
     mem_reg[15] <= 32'b00000000000000000000000000000000;
     mem_reg[16] <= 32'b00000000000000000000000000000000;
     mem_reg[17] <= 32'b00000000000000000000000000000000;
     mem_reg[18] <= 32'b00000000000000000000000000000000;
     mem_reg[19] <= 32'b00000000000000000000000000000000;
     mem_reg[20] <= 32'b00000000000000000000000000000000;
     mem_reg[21] <= 32'b00000000000000000000000000000000;
     mem_reg[22] <= 32'b00000000000000000000000000000000;
     mem_reg[23] <= 32'b00000000000000000000000000000000;
     mem_reg[24] <= 32'b00000000000000000000000000000000;
     mem_reg[25] <= 32'b00000000000000000000000000000000;
     mem_reg[26] <= 32'b00000000000000000000000000000000;
     mem_reg[27] <= 32'b00000000000000000000000000000000;
     mem_reg[28] <= 32'b00000000000000000000000000000000;
     mem_reg[29] <= 32'b00000000000000000000000000000000;
     mem_reg[30] <= 32'b00000000000000000000000000000000;
     mem_reg[31] <= 32'b00000000000000000000000000000000;
     //mem_reg[16] <= 32'b00000000000000000000000000000001;
end

always @(posedge i_clk )
 begin
    if(reg_write==1'b1)
               begin
               mem_reg [rw_reg] <=  wr_data ;
               end 
     end                     
  ///assigning outputs of reg file to read reg rs1_read and rs2_read from reg operands  //     
  assign rs1_read = mem_reg[rs1_reg];
  assign rs2_read = mem_reg[rs2_reg];
       
 endmodule
