`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/15/2022 09:39:48 PM
// Design Name: 
// Module Name: And_gate
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

module And_gate(in_1, in_2, out_g);
input  in_1, in_2 ;
output  out_g ;

///output signal from control(aka -...  branch) and zero from output of alu // //
assign out_g = in_1 & in_2 ;

endmodule
