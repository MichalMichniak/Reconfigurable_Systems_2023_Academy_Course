`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.03.2023 20:13:42
// Design Name: 
// Module Name: test_generator_or_gate
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


module test_generator_or_gate(
    output [9:0]y
    );
    reg clk = 1'b0;
    reg [9:0]x = 10'b0;
    initial
    begin
        while(1)
        begin
            #2;clk=~clk;
        end
    end
    always @(posedge clk)
    begin
        x <= x+1;
    end
    assign y = x;
endmodule
