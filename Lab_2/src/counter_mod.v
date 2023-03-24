`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.03.2023 17:35:50
// Design Name: 
// Module Name: counter_mod
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


module counter_mod#
    (
    parameter N = 5,
    parameter WIDTH = $clog2(N)
    )(
    input CLK,
    output [WIDTH-1:0]y
    );
    reg [WIDTH-1:0]state;
    initial state <= {WIDTH{1'b0}};
    always @(posedge CLK)
    begin
        state <= state + 1;
        if (state == N - 1 )
        begin
            state <= {WIDTH{1'b0}};
        end
    end
    assign y = state; 
    
endmodule
