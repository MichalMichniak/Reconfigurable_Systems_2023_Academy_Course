`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.03.2023 21:54:11
// Design Name: 
// Module Name: Reciver
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


module Reciver(
    input clk,
    input rst,
    output recive,
    output [7:0]data,
    input rxd
    );
    localparam STATE0 = 2'b00; // waiting for 1 
    localparam STATE1 = 2'b01;
    localparam STATE2 = 2'b11;
    
    reg [1:0]state = STATE0;
    reg [7:0]out = 8'b0;
    reg recv = 0;
    reg [7:0]data_buff;
    reg [2:0]counter = 3'b000;
    always @(posedge clk)
    begin
        case (state)
            2'b00:
                begin
                    recv <= 1'b0;
                    if (rxd == 1)
                    begin
                        state <= STATE1;
                        counter <= 3'b000;
                    end 
                end
            2'b01:
                begin
                    data_buff[counter] <= rxd;
                    if (counter == 3'b111)
                    begin
                        state <= STATE2;
                    end
                    else
                    begin
                        counter <= counter + 1;
                    end
                end
            2'b11:
                begin
                    out <= data_buff;
                    state <= STATE0;
                    recv <= 1'b1;
                end
        endcase
        if (rst == 1'b1)
        begin
            out <= 8'b0;
            state <= STATE0;
            recv <= 1'b0;
            counter <= 3'b000;
            data_buff <= 8'b0;
        end
    end
    assign data = out;
    assign recive = recv;
endmodule
