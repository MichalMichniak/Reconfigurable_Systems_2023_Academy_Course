`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.03.2023 20:12:43
// Design Name: 
// Module Name: tb_or_gate
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


module tb_or_gate(

    );

    wire [9:0]x;
    wire y;
    test_generator_or_gate gen_insta(
        .y(x)
    );
    or_gate or_gate_instance(
        .i(x),
        .o(y)
    );
    save_test_or_gate save_insta(
        .x(x),
        .y(y)
    );
endmodule
