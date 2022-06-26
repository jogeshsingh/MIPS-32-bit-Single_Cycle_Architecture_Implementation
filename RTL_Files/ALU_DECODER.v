`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/15/2022 09:41:34 PM
// Design Name: 
// Module Name: ALU_DECODER
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

`define  WIDTH_ALU_OP 2
`define  WIDTH_FUNC 6
`define  WIDTH_Alu_cntrl 4
module ALU_DECODER(i_func, i_ALUOp , o_ALU_control);
input [`WIDTH_FUNC-1:0] i_func ;
input [`WIDTH_ALU_OP-1:0] i_ALUOp;
output  [`WIDTH_Alu_cntrl-1:0] o_ALU_control;

reg [`WIDTH_Alu_cntrl-1:0] ALU_control ;
///function field ///
parameter ADD = 6'b10_0000,
          SUB = 6'b10_0010,
          AND = 6'b10_0100,
          OR = 6'b10_0101,
          SLT = 6'b10_1010,
          NOR = 6'b10_0011;
          
 
 always @(*)
    begin
        case (i_ALUOp)                       ///desired alu funct//     instruction opcode ///
        2'b00  : ALU_control = 4'b0010;        //add//                   //lw and sw//
        2'b01  : ALU_control = 4'b0110;       //sub//                        //beq//
        2'b10  : 
                case (i_func)
             ADD : ALU_control = 4'b0010;   //add//                         //add//
             SUB : ALU_control = 4'b0110;   //subtract//                    //subtract/
             AND : ALU_control = 4'b0000;   //AND//                        //AND //
             OR  : ALU_control = 4'b0001;   //OR//                         //OR//
             SLT : ALU_control = 4'b0111;   //Set on less than//           //slt//
             NOR : ALU_control = 4'b1100;    //NOR //                      //NOR //
             default : ALU_control = 4'bx; 
         endcase
         default : ALU_control = 4'bx;
      endcase    
   end   
 
 
 assign o_ALU_control = ALU_control ;
 
 
endmodule
