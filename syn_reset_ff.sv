`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.10.2024 14:18:41
// Design Name: 
// Module Name: syn_reset_ff
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


module sync_reset_ff   // Parameterized width (default 1 bit)
  (
    input  logic [31:0] D,      // Data input
    input  logic clk,                // Clock signal
    input  logic reset,              // Synchronous reset signal
    output logic [31:0] Q       // Output
  );

  always_ff @(posedge clk) begin
    if (reset) begin
      Q <= '0;  // Reset Q to 0 if reset is high (but only on clock edge)
    end else begin
      Q <= D;   // On rising edge of clk, Q gets the value of D
    end
  end

endmodule
