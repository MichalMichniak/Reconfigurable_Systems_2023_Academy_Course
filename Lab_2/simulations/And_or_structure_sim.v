`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.03.2023 23:18:44
// Design Name: 
// Module Name: And_or_structure_sim
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


module And_or_structure_sim(
        output y
    );
    reg [15:0]cnt=2'b0;
    initial
    begin
            #2; cnt=16'b0000000000000000; // 0
            #2; cnt=16'b1101110010110011; // 1
            #2; cnt=16'b0111110110111011; // 1
            #2; cnt=16'b0101110000000000; // 0
            #2; cnt=16'b0101110010100100; // 0
            #2; cnt=16'b0101110000100100; // 0
            #2; cnt=16'b0101110011010010; // 1
            #2; cnt=16'b1111111111111111; // 1
            #2; cnt=16'b0000000000000000; // 0
    end
    And_or_structure pawel
    (
        .x(cnt[7:0]),
        .y(cnt[15:8]),
        .z(y)
    );
endmodule
