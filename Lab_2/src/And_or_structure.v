`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.03.2023 18:40:51
// Design Name: 
// Module Name: And_or_structure
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


module And_or_structure(
    input [7:0]x,
    input [7:0]y,
    output z
    );
    generate
        genvar i;
        genvar j;
        for(i = 0; i<4; i=i+1)
        begin : g1
            wire [2**(3-i)-1:0] a;
            if (i==0)
            begin
                assign a = x & y;
            end
            else
            begin
                if (i%2 == 0)
                begin
                    for(j = 0; j < 2**(3-i); j=j+1)
                    begin
                        assign a[j] = g1[i-1].a[2*j] & g1[i-1].a[2*j+1];
                    end
                end
                else
                begin
                    for(j = 0; j < 2**(3-i); j=j+1)
                    begin
                        assign a[j] = g1[i-1].a[2*j] | g1[i-1].a[2*j+1];
                    end
                end
            end
        end
        assign z = g1[3].a[0];
    endgenerate
    
endmodule
