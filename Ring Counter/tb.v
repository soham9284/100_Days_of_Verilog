`timescale 1ns / 1ps
module tb;
    reg clk,reset;
    wire [7:0] count;

    ring_counter uut (
        .clk(clk),
        .reset(reset),
        .count(count)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin

        reset = 1;
        #10 reset = 0; 

        #200;

        reset = 1;
        #10 reset = 0;
        
        #100;
        $finish;
    end

    initial begin
        $monitor("Reset=%b || Count=%b", reset, count);
    end
endmodule