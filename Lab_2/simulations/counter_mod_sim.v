`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.03.2023 18:04:13
// Design Name: 
// Module Name: counter_mod_sim
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


module counter_mod_sim#(
    parameter mod1 = 5,
    parameter WIDTH1 = $clog2(mod1),
    parameter mod2 = 7,
    parameter WIDTH2 = $clog2(mod2)
    )(
    output [WIDTH1-1:0]y1,
    output [WIDTH2-1:0]y2
    );
    reg clk=1'b0;
    initial
    begin
    while(1)
        begin
            #1; clk=1'b0;
            #1; clk=1'b1;
        end
    end
    counter_mod #(
        .N(mod1)
    ) temp1 (
    .CLK(clk),
    .y(y1)
    );
    counter_mod #(
        .N(mod2)
    ) temp2 (
    .CLK(clk),
    .y(y2)
    );
    
endmodule
