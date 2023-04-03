`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.03.2023 23:13:06
// Design Name: 
// Module Name: Acumulator
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


module Acumulator(
    input signed [12:0]x,
    output signed [20:0]y,
    input rst,
    input clk,
    input ce
    );
    reg signed [20:0]acc = 21'b0;
    wire signed [20:0]acc_wire;
    
    c_addsub_0 add(
    .CE(ce),
    .A(x),
    .B(acc),
    .S(acc_wire)
    );
    always @(posedge clk)
    begin
        if(rst == 1'b1)
        begin
            acc <= 21'b0;
        end
        else 
        begin
            if(ce == 1'b1)
            begin
                acc <= acc_wire;
            end
        end
    end
    assign y = acc;
endmodule
