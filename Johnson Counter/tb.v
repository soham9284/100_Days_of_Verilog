`timescale 1ns / 1ps
module tb;

    reg clk;
    reg reset;
    wire [3:0] q;

    jc uut (
        .clk(clk),
        .reset(reset),
        .q(q)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk; 
    end

    initial begin
        reset = 1; #10;
        reset = 0; #200;
        $finish;
    end
    always @(posedge clk) begin
        $display("Time: %0t || q = %b", $time, q);
    end
endmodule