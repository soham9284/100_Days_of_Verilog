`timescale 1ns / 1ps

module tb;
    reg [7:0] num;
    wire prime;
    
    prime uut(
        .num(num),
        .prime(prime)
    );
    
    initial begin
        num = 8'd0;#10;
        num = 8'd2;#10;
        num = 8'd3;#10;
        num = 8'd7;#10;
        num = 8'd8;#10;
        num = 8'd13;#10;
        num = 8'd14;#10;
        num = 8'd17;#10;
        num = 8'd27;#10;
        num = 8'd29;#10;
        $finish;
    end

    initial begin
        $monitor("Number: %0d || Is Prime: %b", num, prime);
    end
endmodule