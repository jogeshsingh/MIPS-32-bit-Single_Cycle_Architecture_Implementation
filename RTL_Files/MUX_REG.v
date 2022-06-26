`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/17/2022 10:12:01 PM
// Design Name: 
// Module Name: MUX_REG
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


  `define WIDTH_MUX 5
module MUX_REG(i_1, i_2, sel_1  , mux_o1 );
input [`WIDTH_MUX-1:0] i_1 ,i_2 ;
input sel_1 ;
output [`WIDTH_MUX-1:0] mux_o1 ;
///output selects if sel_1 = 1 , then instr .. 15-11 rd[for R-TYPE instr..] else instr.. 20-16 rt(for I-type instr..]
assign mux_o1 = sel_1?i_2 :i_1 ; 
endmodule  
    
