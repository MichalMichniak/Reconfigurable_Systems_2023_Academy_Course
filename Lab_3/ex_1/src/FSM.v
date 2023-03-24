`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.03.2023 16:56:38
// Design Name: 
// Module Name: FSM
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


module FSM(
    input clk,
    input rst,
    input send,
    input [7:0]data,
    output txd
    );
    localparam STATE0 = 2'b00; // waiting for send
    localparam STATE1 = 2'b01;
    localparam STATE2 = 2'b11;
    localparam STATE3 = 2'b10;
    
    reg [1:0]state = STATE0;
    reg out = 0;
    reg prev = 0;
    reg [7:0]data_buff;
    reg [2:0]counter = 3'b000;
    always @(posedge clk)
    begin
        case (state)
            2'b00:
            begin
                if((prev == 0) &  (send == 1))
                begin
                    data_buff <= data;
                    state <= STATE1;
                end
            end
            2'b01: 
            begin
                out <= 1'b1;
                state <= STATE2;
                counter <= 3'b000;
            end
            2'b11: 
            begin
                out <= data_buff[counter];
                if(counter == 3'b111)
                begin
                    state <= STATE3;
                end
                else counter <= counter + 1;
            end
            2'b10: 
            begin

                out <= 1'b0;
                state <= STATE0;
            end
        endcase
        if (rst == 1'b1)
        begin
            state <= STATE0;
            prev <= 0;
            counter <= 3'b000;
            out <= 0;
            data_buff<=8'b0;
        end
        prev = send;
    end
    assign txd = out;
    
endmodule
