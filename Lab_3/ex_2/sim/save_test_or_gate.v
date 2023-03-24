`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.03.2023 20:14:20
// Design Name: 
// Module Name: save_test_or_gate
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


module save_test_or_gate(
    input [9:0]x,
    input y
    );
    integer file;
    reg [7:0]i;
    initial
    begin
        #2;
        file=$fopen("C:/D/SR/Lab_3/or_gate.bin","wb");
        while(1)
        begin
            if(x > 0 & y == 0) $fwrite(file,"blad dla wartosci x = %d\n",x);
            if(x == 0 & y != 0) $fwrite(file,"blad dla wartosci x = %d\n",x);
            #4;
        end
        $fclose(file);
    end
endmodule
