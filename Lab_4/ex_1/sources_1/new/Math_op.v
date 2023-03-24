`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.03.2023 18:55:37
// Design Name: 
// Module Name: Math_op
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


module Math_op(
    input clk,
    input ce,
    input [6:0]A,
    input [6:0]B,
    input [6:0]C,
    output [6:0]Y
    );
    wire [6:0]c;
    wire [7:0]s;
    wire [14:0]y;
    delay #(
    .DELAY(1), //latency 1
    .LENGTH(7)
    ) del (
    .x(C),
    .y(c),
    .clk(clk)
    );
    c_addsub_0 adder(
    .A(A),
    .B(B),
    .CLK(clk),
    .CE(ce),
    .S(s)
    );
    mult_gen_0 mul(
    .CLK(clk),
    .A(s),
    .B(c),
    .P(y)
    );
    assign Y = y[14:8];
endmodule
