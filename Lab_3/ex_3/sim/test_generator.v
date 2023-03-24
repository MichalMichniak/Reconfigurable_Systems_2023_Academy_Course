`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.03.2023 19:00:44
// Design Name: 
// Module Name: test_generator
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


module test_generator(
     output clk,
     output rst,
     output [7:0]data,
     output send
    );
    integer file;
    reg [7:0]i;
  
    reg [7:0]j;
    reg clk_ = 1'b0;
    reg rst_ = 1'b0;
    reg [7:0]data_ = 8'b00000000;
    reg send_ = 1'b0;
    initial
    begin
        file=$fopen("C:/D/SR/Lab_3/ala_ma_psa.bin","rb");
        for(i=0;i<16;i=i+1)
        begin
            #2; data_=$fgetc(file); 
            send_ = 1'b1;
            clk_ = ~clk_;
            #2; clk_ = ~clk_;
            send_ = 1'b0;
            for(j=0;j<10;j=j+1)
            begin
                #2; clk_ = ~clk_;
                #2; clk_ = ~clk_;
            end
        end
        #2; clk_ = ~clk_;
        #2; clk_ = ~clk_;
        $fclose(file);
    end
    assign clk = clk_;
    assign data = data_;
    assign rst = rst_;
    assign send = send_;
endmodule
