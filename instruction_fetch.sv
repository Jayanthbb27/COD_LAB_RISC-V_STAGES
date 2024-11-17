`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.10.2024 15:13:17
// Design Name: 
// Module Name: instruction_fetch
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


module instruction_fetch 
(
input logic [31:0]pcimm,
input logic pc_src,
input logic clk,
input logic reset,
output logic [31:0]inst,
output logic [31:0]pc4 );


logic [31:0]y;
logic [31:0]Q;
logic [31:0]b,c;



   
      mux2(pc4,pcimm,pc_src,y);
     full_adder(Q,b,c,pc4);
     sync_reset_ff(y,clk,reset,Q);
     inst_mem(Q,reset,inst);
    
endmodule
