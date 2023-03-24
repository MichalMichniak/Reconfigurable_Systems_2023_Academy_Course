`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.03.2023 21:12:53
// Design Name: 
// Module Name: genblk_and_cascade
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


module genblk_and_cascade#(
    parameter LENGTH = 8
    )(
    input [LENGTH-1 : 0]x,
    output y
    );
    wire temporary;
    genvar i;
    generate
      for (i=0;i<LENGTH;i=i+1)
      begin : g1
        wire a;
        if (i == 0)
        begin
            assign a = x[i];
        end 
        else
        begin
            assign a = g1[i-1].a & x[i];
        end
      end
      assign temporary = g1[LENGTH-1].a;
    endgenerate
    assign y = temporary;

endmodule
