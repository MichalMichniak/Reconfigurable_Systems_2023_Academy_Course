`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.03.2023 22:35:59
// Design Name: 
// Module Name: tb_reciver
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


module tb_reciver(

    );
    wire TxD;
    wire clk;
    wire rst;
    wire [7:0]data;
    wire send;
    wire recive;
    wire [7:0]recv_data;
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
    Reciver fsm_reciver_instance(
        .clk(clk),
        .rst(rst),
        .recive(recive),
        .data(recv_data),
        .rxd(TxD)
    );
    save_chars logger(
        .data(recv_data)
    );
    
endmodule
