`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.10.2024 23:09:01
// Design Name: 
// Module Name: sign_extender
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


module sign_extender(
input logic [6:0] opcode,
input logic [11:0] imm_value,
output logic [31:0] imm_extended
    );
    always_comb
    begin 
    
    case(opcode)
    7'b1100011:
    imm_extended={ {19{imm_value [11]}},imm_value [11:0],1'b0};
    
    default:
    imm_extended={{20{imm_value [11]}},imm_value [11:0]};
    
    endcase
    end
    
  
endmodule
