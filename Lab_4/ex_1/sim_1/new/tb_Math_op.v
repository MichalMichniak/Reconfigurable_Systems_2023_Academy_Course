`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.03.2023 19:07:03
// Design Name: 
// Module Name: tb_Math_op
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


module tb_Math_op(

    );
    reg clk = 1'b0;
    reg signed [6:0]A = 7'b0001010;
    reg signed [6:0]B = 7'b1100111;
    reg signed [6:0]C = 7'b0010010;
    wire signed [6:0]Y;
    reg ce = 1'b1;
    initial
    begin
        #2; clk <= ~clk ;
        #2; clk <= ~clk ;
        #2; clk <= ~clk ;
        #2; clk <= ~clk ;
        #2; clk <= ~clk ;
        #2; clk <= ~clk ;
        #2; clk <= ~clk ;
        #2; clk <= ~clk ;
    end
    Math_op math_op_instance(
    .clk(clk),
    .ce(ce),
    .A(A),
    .B(B),
    .C(C),
    .Y(Y)
    );
endmodule
