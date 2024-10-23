`timescale 1ns / 1ps
module tb_g2b;

    reg [3:0] gray;        
    wire [3:0] binary;   

    g2b uut (
        .gray(gray),
        .binary(binary)
    );

    initial begin
        gray = 4'b0000; #10;
        gray = 4'b0001; #10;
        gray = 4'b0011; #10;
        gray = 4'b0010; #10;
        gray = 4'b0110; #10;
        gray = 4'b0111; #10;
        gray = 4'b0101; #10;
        gray = 4'b0100; #10;
        gray = 4'b1100; #10;
        gray = 4'b1101; #10;
        gray = 4'b1111; #10;
        gray = 4'b1110; #10;
        $finish;
    end

    always @(gray) begin
        $monitor("Time: %0t || Gray = %b || Binary = %b", $time, gray, binary);
    end
endmodule