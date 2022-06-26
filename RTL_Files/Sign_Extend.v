`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/15/2022 09:43:15 PM
// Design Name: 
// Module Name: Sign_Extend
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

`define DATA_WIDTH 16
`define DATA_OUT 32
module Sign_Extend(
instr_a , out_sign
    );
 input [`DATA_WIDTH-1:0] instr_a ;
 output [`DATA_OUT-1:0] out_sign ;
 
 /////it extends the instr[15] bit position 16 times left(MSB] and concatenates the  instr_a[15:0] to the the right[LSB] //
 assign out_sign = {{`DATA_WIDTH{instr_a[`DATA_WIDTH-1]}} , instr_a};
     
endmodule
