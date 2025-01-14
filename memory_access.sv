`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.10.2024 20:13:38
// Design Name: 
// Module Name: memory_access
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


module memory_access(
input logic [31:0]ALU_result,
input logic [31:0]rs2_data,
input logic mem_read,
input logic mem_write,
input logic clk,
output logic [31:0]read_data 
);
logic[31:0]data_mem[31:0];
always_ff@(posedge clk)
begin
if(mem_read)
read_data<=data_mem[ALU_result];
else if(mem_write)
begin
data_mem[ALU_result]<=rs2_data;
read_data<=32'b0;
end
else
read_data<=32'b0;
end
 
endmodule
