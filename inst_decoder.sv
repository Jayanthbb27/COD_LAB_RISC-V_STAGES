`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.10.2024 14:16:45
// Design Name: 
// Module Name: inst_decoder
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


module inst_decoder( 

input logic [31:0]inst,
output logic [4:0]rs1_addr,
output logic [4:0]rs2_addr,
output logic [4:0]rd_addr,
output logic [2:0]fun3,
output logic [6:0]fun7,
output logic [11:0]imm_value,
output logic [6:0]opcode);
assign opcode=inst[6:0];
always_comb 
  begin
 
   
   case(opcode)
   7'b0110011: //R type
       begin 
        rd_addr=inst[11:7];
        fun3=inst[14:12];
        rs1_addr=inst[19:15];
        rs2_addr=inst[24:20];
        fun7=inst[31:25];
        end
   7'b0010011: // I type
        begin
        rd_addr=inst[11:7];
        fun3=inst[14:12];
        rs1_addr=inst[19:15];
        imm_value=inst[31:20];
        end
   7'b0000011: // Load
        begin
        rd_addr=inst[11:7];
        fun3=inst[14:12];
        rs1_addr=inst[19:15];
        imm_value=inst[31:20];
        end
   7'b0100011: // store
        begin
        fun3=inst[14:12];
        rs1_addr=inst[19:15];
        rs2_addr=inst[24:20];
        imm_value={inst[31:25],inst[11:7]};
        end
   7'b1100011:  // B type
        begin
        fun3=inst[14:12];
        rs1_addr=inst[19:15];
        rs2_addr=inst[24:20];
        imm_value={inst[31],inst[7],inst[30:25],inst[11:8]};
        end
endcase

end
   
    
   
endmodule
