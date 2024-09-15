`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.09.2024 21:06:37
// Design Name: 
// Module Name: ha_tb
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


module ha_tb();
    reg a,b;
    wire sum,cout;
    
    ha uut(
        .a(a),
        .b(b),
        .sum(sum),
        .cout(cout)
    );
    initial begin
        a=0;b=0;#5
        a=0;b=1;#5
        a=1;b=0;#5
        a=1;b=1;#5
        $finish;
    end 
    always@(*) 
    begin
        $display("a = %b, b = %b, Sum = %b, Cout = %b", a, b, sum, cout);
    end
endmodule
