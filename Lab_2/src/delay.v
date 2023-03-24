`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/09/2023 12:04:23 PM
// Design Name: 
// Module Name: delay
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


module delay #(
    parameter LENGTH=3,
    parameter DELAY = 8
    )(
       input [LENGTH-1:0]x,
       output [LENGTH-1:0]y,
       input clk
    );
    reg [LENGTH-1:0]buffor[DELAY-1:0];
    genvar i;
    always @(posedge clk)
    begin
    buffor[0] <= x;
    end
    generate
        for(i=0;i<DELAY-1;i=i+1)
        begin
            always @(posedge clk)
            begin
                buffor[i+1] <= buffor[i];
            end
        end       
    endgenerate
  
    assign y = buffor[DELAY-1];
endmodule
