`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.03.2023 21:06:20
// Design Name: 
// Module Name: tb_complex_arythmetic_module
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


module tb_complex_arythmetic_module(

    );
    reg clk = 1'b0;
    reg [17:0]A = 18'b111001101110101001;
    reg [7:0]B = 8'b00111011;
    reg [11:0]C = 12'b110110001010;
    reg [7:0]D = 8'b00100100;
    reg [13:0]E = 14'b11001110000000;
    reg [18:0]F = 19'b0010000110100011111;
    wire [19:0]out;
    initial
    begin
        while(1)
        begin
            #2;clk=~clk;
        end
    end
    complex_arythmetic_module cam_instance(
    .A(A),
    .B(B),
    .C(C),
    .D(D),
    .E(E),
    .F(F),
    .clk(clk),
    .ce(1'b1),
    .Y(out)
    );
endmodule
