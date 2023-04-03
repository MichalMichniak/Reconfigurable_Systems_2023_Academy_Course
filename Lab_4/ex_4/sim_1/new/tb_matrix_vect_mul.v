`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.03.2023 17:07:06
// Design Name: 
// Module Name: tb_matrix_vect_mul
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


module tb_matrix_vect_mul(

    );
    reg clk = 1'b0;
    reg [12:0]a = 13'b0111111111111;
    reg [12:0]b = 13'b0111111111111;
    wire [12:0]y;
    wire [12:0]z;
    initial
    begin
        while (1)
        begin
            #2;clk=~clk;
        end
    end
    matrix_vect_mul mat_mul_instance(
    .A(a),
    .B(b),
    .Y(y),
    .Z(z),
    .CE(1'b1),
    .CLK(clk) 
    );
endmodule
