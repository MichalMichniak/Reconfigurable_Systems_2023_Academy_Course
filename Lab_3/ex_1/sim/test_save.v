`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.03.2023 19:21:59
// Design Name: 
// Module Name: test_save
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


module test_save(
    input txd
    );
    integer file;
    reg [7:0]i;
    initial
    begin
        #2;
        file=$fopen("C:/D/SR/Lab_3/ala_ma_psa_gen.bin","wb");
        
        for(i=0;i<11*16;i=i+1)
        begin
            $fwrite(file,txd);
            #4;
        end
        $fclose(file);
    end

endmodule
