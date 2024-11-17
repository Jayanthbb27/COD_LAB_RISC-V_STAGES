`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.10.2024 01:22:15
// Design Name: 
// Module Name: instruction_decode
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


module instruction_decode(
input logic [31:0]inst,
input logic clk,
input logic reset,
input logic reg_write,
input logic write_data,
output logic [31:0]imm_extended,
output logic [31:0]rs1_data,
output logic [31:0]rs2_data,
output logic [2:0]fun3,
 output logic [6:0]fun7,
 output logic [6:0]opcode
    );
   
    inst_decoder instruction_decoder(.inst(inst), .rs1_addr(rs1_addr), .rs2_addr(rs2_addr), .rd_addr(rd_addr), .fun3(fun3), .fun7(fun7), .imm_value(imm_value), .opcode(opcode));
    sign_extender immediate_generator(.opcode(opcode), .imm_value(imm_value), .imm_extended(imm_extended));
    reg_file register_file( .clk(clk), .reset(reset), .rs1_addr(rs1_addr), .rs2_addr(rs2_addr), .rd_addr(rd_addr), .reg_write(reg_write), .write_data(write_data), .rs1_data(rs1_data), .rs2_data(rs2_data));
    
endmodule
