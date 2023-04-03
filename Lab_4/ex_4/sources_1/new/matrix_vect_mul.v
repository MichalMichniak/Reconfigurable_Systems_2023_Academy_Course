`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.03.2023 15:47:17
// Design Name: 
// Module Name: matrix_vect_mul
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


module matrix_vect_mul(
    input signed [12:0]A,
    input signed [12:0]B,
    output signed [12:0]Y,
    output signed [12:0]Z,
    input CE,
    input CLK 
    );
    wire signed [12:0]a00 = 13'b1111111111110;
    wire signed [12:0]a01 = 13'b0000000100101;
    wire signed [12:0]a10 = 13'b0000000110010;
    wire signed [12:0]a11 = 13'b1111101001100;
    wire signed [25:0]a00A;
    wire signed [25:0]a01B;
    wire signed [25:0]a10A;
    wire signed [25:0]a11B;
    wire signed [26:0]y;
    wire signed [26:0]z;
    mult_gen_0 mul1(
        .CLK(CLK),
        .A(A),
        .B(a00),
        .P(a00A)
    );
    mult_gen_0 mul2(
        .CLK(CLK),
        .A(B),
        .B(a01),
        .P(a01B)
    );
    mult_gen_0 mul3(
        .CLK(CLK),
        .A(A),
        .B(a10),
        .P(a10A)
    );
    mult_gen_0 mul4(
        .CLK(CLK),
        .A(B),
        .B(a11),
        .P(a11B)
    );
    c_addsub_0 add1(
        .CLK(CLK),
        .CE(CE),
        .A(a00A),
        .B(a01B),
        .S(y)
    );
    c_addsub_0 add2(
        .CLK(CLK),
        .CE(CE),
        .A(a10A),
        .B(a11B),
        .S(z)
    );
    assign Y = {y[26],y[20:9]};
    assign Z = {z[26],z[20:9]};
endmodule
