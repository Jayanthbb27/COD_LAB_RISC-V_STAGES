`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.10.2024 19:20:43
// Design Name: 
// Module Name: instruction_execution
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


module instruction_execution(
input logic branch,
input logic [31:0]rs1_data,
input logic [31:0]rs2_data,
input logic[31:0]imm_extended,
input logic ALU_src,
input logic [3:0]ALU_op,
output logic [31:0]ALU_result,
output logic pc_src

    );
    mux2 mux_2(rs2_data,imm_extended,ALU_src,value_2);
    alu ALU(rs1_data,value_2,ALU_op,zero,ALU_result);
    and_gate and_gate(branch,zero,pc_src);
endmodule
