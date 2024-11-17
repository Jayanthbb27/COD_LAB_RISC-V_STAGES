`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.10.2024 21:18:26
// Design Name: 
// Module Name: write_back_stage
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


module write_back_stage(
input logic [31:0]read_data,
input logic [31:0]ALU_result,
input logic mem_to_reg,
output logic [31:0]write_data
);
mux2 wb_mux(ALU_result,read_data,mem_to_reg,write_data);
endmodule
