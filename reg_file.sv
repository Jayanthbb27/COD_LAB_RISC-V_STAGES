`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.10.2024 23:50:19
// Design Name: 
// Module Name: reg_file
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


module reg_file(
input logic clk,
input logic reset,
input logic [4:0]rs1_addr,
input logic [4:0]rs2_addr,
input logic [4:0]rd_addr,
input logic reg_write,
input logic [31:0]write_data,
output logic [31:0]rs1_data,
output logic [31:0]rs2_data
    );
    logic[31:0]register[31:0];
    always_ff@(posedge clk or posedge reset)
    begin
    if(reset)
      begin
        integer i; 
        for(i=0;i<32;i=i+1)
        register[i]<=0;
      end
     
     else if( reg_write && rd_addr!=5'b0)
     register[rd_addr]<=write_data;
     end
     
     always @(*)
     begin
     rs1_data=register[rs1_addr];
     rs2_data=register[rs2_addr];
     end
     
endmodule
