`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.03.2023 23:38:20
// Design Name: 
// Module Name: tb_Acumulator
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


module tb_Acumulator(
    
    );
    reg clk = 1'b0;
    reg signed [12:0]add;
    reg rst = 1'b0;
    reg ce = 1'b1;
    wire signed [20:0]y;
    initial
    begin
       add = 13'b0111111111111;
       #2; clk = ~clk;
       #2; clk = ~clk;
//        add = 13'b0000000000001;
       #2; clk = ~clk;
       #2; clk = ~clk;
//       add = 13'b0000000000001;
       #2; clk = ~clk;
       #2; clk = ~clk;
//       add = 13'b0000000000001;
       #2; clk = ~clk;
       #2; clk = ~clk;
//       add = 13'b0000000000001;
       #2; clk = ~clk;
       #2; clk = ~clk;
//       add = 13'b0000000000001;
       #2; clk = ~clk;
       #2; clk = ~clk;
//       add = 13'b0000000000001;
       #2; clk = ~clk;
       #2; clk = ~clk;
//       add = 13'b0000000000001;
       #2; clk = ~clk;
       #2; clk = ~clk;
//       add = 13'b0000000000001;
       #2; clk = ~clk;
       #2; clk = ~clk;
//       add = 13'b0000000000001;
       #2; clk = ~clk;
       #2; clk = ~clk;
    end
    Acumulator acc(
    .x(add),
    .y(y),
    .rst(rst),
    .clk(clk),
    .ce(ce)
    );
endmodule
