`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.03.2023 19:51:33
// Design Name: 
// Module Name: complex_arythmetic_module
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


module complex_arythmetic_module(
    input signed [17:0]A,
    input signed [7:0]B,
    input signed [11:0]C,
    input signed [7:0]D,
    input signed [13:0]E,
    input signed [18:0]F,
    input clk,
    input ce,
    output [19:0]Y
    );
    wire signed [12:0]b = {B,5'b0};
    wire signed [10:0]d = {D,3'b0};
    wire signed [17:0]e = {E,4'b0};
    wire [11:0]c1;
    wire [18:0]s1;
    wire [14:0]s2;
    wire [19:0]s3;
    wire [29:0]m1;
    wire [33:0]m2;
    wire [34:0]m2_2;
    wire [35:0]y;
    c_addsub_0 add1( // latency 2
    .A(A),
    .B(b),
    .S(s1),
    .CLK(clk),
    .CE(ce)
    );
    
    delay#( // latency 2
    .DELAY(2),
    .LENGTH(12)
    ) del1(
    .x(C),
    .y(c1),
    .clk(clk)
    );
    
    c_addsub_1 add2( // latency 2
    .A(d),
    .B(E),
    .S(s2),
    .CLK(clk),
    .CE(ce)
    );
    
    c_addsub_2 add3( // latency 2
    .A(e),
    .B(F),
    .S(s3),
    .CLK(clk),
    .CE(ce)
    );
    
    mult_gen_0 mul1(
    .CLK(clk),
    .A(s1),
    .B(c1),
    .P(m1)
    );
    
    mult_gen_1 mul2(
    .CLK(clk),
    .A(s3),
    .B(s2),
    .P(m2)
    );
    assign m2_2 = {m2,1'b0};
    
    c_addsub_3 add4( 
    .A(m1),
    .B(m2_2),
    .S(y),
    .CLK(clk),
    .CE(ce)
    );
    assign Y = y[35:15];
    
endmodule
