`timescale 1ns / 1ps
module tb;

    reg [3:0] binary;    
    wire [3:0] gray;    

    b2g uut(
        .binary(binary),
        .gray(gray)
    );

    initial begin
        binary = 4'b0000; #10;
        binary = 4'b0001; #10;
        binary = 4'b0010; #10;
        binary = 4'b0011; #10;
        binary = 4'b0100; #10;
        binary = 4'b0101; #10;
        binary = 4'b0110; #10;
        binary = 4'b0111; #10;
        binary = 4'b1000; #10;
        binary = 4'b1001; #10;
        binary = 4'b1010; #10;
        binary = 4'b1011; #10;
        $finish;
    end

    always @(binary) 
    begin
        $monitor("Time: %0t || Binary = %b || Gray = %b", $time, binary, gray);
    end
endmodule