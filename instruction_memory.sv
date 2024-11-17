`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.10.2024 14:31:35
// Design Name: 
// Module Name: instruction_memory
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

module instructoin_memory #(parameter N =32,M=1024)
(
 input logic [N-1:0] address,
 input logic reset,
 output logic [N-1:0] inst,
 
 logic[N-1:0]mem[0:M-1]);
 always_comb
 begin
 if (reset==1)
 inst=0;
 else 
 inst=mem[address];
 end
 endmodule



