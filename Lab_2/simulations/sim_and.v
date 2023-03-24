`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/09/2023 11:26:08 AM
// Design Name: 
// Module Name: sim_and
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


module sim_and#(
    parameter LENGTH = 8
    )(
        output y
    );
    wire [LENGTH-1:0]x;
    reg clk=1'b0;
    reg [LENGTH-1:0]cnt=2'b0;
    initial
    begin
    while(1)
        begin
            #1; clk=1'b0;
            #1; clk=1'b1;
        end
    end
    
    always @(posedge clk)
        begin
            cnt<=cnt+1;
        end
    and_cascade #(
    .LENGTH(LENGTH)
    ) pawel
    (
        .x(cnt),
        .y(y)
    );
endmodule
