`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.10.2024 15:25:58
// Design Name: 
// Module Name: alu
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


module alu(
input logic [31:0]rs1_data,
input logic [31:0]value_2,
input logic [3:0]ALU_op,
output logic zero,
output logic [31:0]ALU_result 
    );
   
   always_comb
    begin
    
    case(ALU_op)
    4'b0000:
    begin 
    ALU_result=rs1_data & value_2;
    zero=0;
    end
    
    4'b0001:
    begin
    ALU_result=rs1_data | value_2;
    zero=0;
    end
    
    4'b0010:
    begin
    ALU_result=rs1_data + value_2;
    zero=0;
    end
    
    4'b0110:
    begin
    if(rs1_data-value_2==0)
    zero=0;
    else
    zero=1;
    ALU_result=32'b0;
    end
    
    endcase
    end
    
    endmodule
   
   
    
    
   
    
