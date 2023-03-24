`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.03.2023 21:18:05
// Design Name: 
// Module Name: genblk_and_cascade_sim
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


module genblk_and_cascade_sim #(
    parameter LENGTH = 8
    )(
        output y
    );
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
    genblk_and_cascade #(
    .LENGTH(LENGTH)
    ) pawel
    (
        .x(cnt),
        .y(y)
    );
endmodule

