`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.03.2023 18:56:44
// Design Name: 
// Module Name: testbench
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


module testbench(
    
    );
    wire TxD;
    wire clk;
    wire rst;
    wire [7:0]data;
    wire send;
    test_generator insta(
        .clk(clk),
        .rst(rst),
        .data(data),
        .send(send)
    );
    FSM fsm_instance(
        .clk(clk),
        .rst(rst),
        .data(data),
        .send(send),
        .txd(TxD)
    );
    test_save save_insta(
        .txd(TxD)
    );
endmodule
