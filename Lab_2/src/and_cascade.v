`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/09/2023 11:10:48 AM
// Design Name: 
// Module Name: and_cascade
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


module and_cascade#(
    parameter LENGTH = 8
    )(
    input [LENGTH-1 : 0]x,
    output y
    );
    
    wire [LENGTH:0]chain;
    assign chain[0] = 1'b1;
    
    genvar i;
    generate
      for (i=0;i<LENGTH;i=i+1)
      begin
        assign chain[i+1] = chain[i] & x[i]; 
      end
    endgenerate
    assign y = chain[LENGTH];
endmodule
