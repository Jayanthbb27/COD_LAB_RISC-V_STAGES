`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.10.2024 14:16:49
// Design Name: 
// Module Name: asyn_reset_ff
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

module asyn_reset_ff #(parameter WIDTH = 1)  // Parameterized width (default 1 bit)
  (
    input  logic [WIDTH-1:0] D,      // Data input
    input  logic clk,                // Clock signal
    input  logic reset,              // Asynchronous reset signal
    output logic [WIDTH-1:0] Q       // Output
  );

  always_ff @(posedge clk or posedge reset) begin
    if (reset) begin
      Q <= '0;  // Reset Q to 0 if reset is high
    end else begin
      Q <= D;   // On rising edge of clk, Q gets the value of D
    end
  end
endmodule