`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.03.2023 22:43:53
// Design Name: 
// Module Name: save_chars
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


module save_chars(
        input [7:0]data
    );
    integer file;
    reg [7:0]i;
    initial
    begin
        #11;
        file=$fopen("C:/D/SR/Lab_3/ala_ma_psa_char.bin","wb");
        for(i=0;i<16;i=i+1)
        begin
            #44; $fwrite(file,"%c\n",data);
        end
        $fclose(file);
    end
endmodule
