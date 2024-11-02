`timescale 1ns / 1ps
module tb;

    reg x;
    reg clk;
    reg reset;
    wire detect;

    tsd uut (
        .x(x),
        .clk(clk),
        .reset(reset),
        .detect(detect)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk; 
    end

    initial begin
        x = 0;
        reset = 1;
        #10;reset = 0;
        x = 1; #10;
        x = 0; #10;
        x = 1; #10;
        x = 1; #10;
        x = 0; #20;
        x = 1; #10;
        x = 0; #10;
        x = 0; #10;
        x = 1; #10;
        x = 0; #10; 
        x = 1; #10;
        x = 1; #10;
        x = 0; #10;
        x = 1; #10;
        $finish;
    end

    always@(clk) begin
        $display("x=%b || detect=%b", x, detect);
    end

endmodule