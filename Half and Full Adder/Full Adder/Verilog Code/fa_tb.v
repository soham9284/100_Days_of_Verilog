`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.09.2024 12:50:58
// Design Name: 
// Module Name: fa_tb
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


module fa_tb();
    reg a,b,cin;
    wire sum,cout;
    
    fa uut(
        .a(a),
        .b(b),
        .cin(cin),
        .sum(sum),
        .cout(cout)
    );
    initial begin
        a=0;b=0;cin=0; #5
        a=0;b=0;cin=1; #5
        a=0;b=1;cin=0; #5
        a=0;b=1;cin=1; #5
        a=1;b=0;cin=0; #5
        a=1;b=0;cin=1; #5
        a=1;b=1;cin=0; #5
        a=1;b=1;cin=1; #5
        $finish;
    end 
    always@(*) 
    begin
        $display("a = %b, b = %b, cin = %b, Sum = %b, Cout = %b", a, b, cin, sum, cout);
    end
endmodule