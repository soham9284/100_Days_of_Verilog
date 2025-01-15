`timescale 1ns / 1ps

module tb;
    reg clk;
    reg reset;
    wire [3:0] gray;

    gc uut(
        .clk(clk),
        .reset(reset),
        .gray(gray)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk; 
    end

    // Test sequence
    initial begin
        reset = 1;#10;  
        reset = 0;
        #300;
        $finish;
    end

    initial begin
        $monitor("Reset: %b || Gray Code: %b",reset, gray);
    end
endmodule