`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/09/2023 12:15:30 PM
// Design Name: 
// Module Name: sim_delay
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


module sim_delay#(
    parameter LENGTH = 8
    )(
        output [LENGTH-1:0]y
    );
    
    reg [LENGTH-1:0]cnt=8'b0000000;
    reg clk = 1'b1;
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
    delay #(
    .LENGTH(LENGTH)
    ) DEL (
        .x(cnt),
        .y(y),
        .clk(clk)
    );
endmodule
