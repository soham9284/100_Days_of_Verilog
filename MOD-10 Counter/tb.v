`timescale 1ns / 1ps
module tb;
    reg clk,reset;
    wire [3:0] q;

    mod10 uut (
        .clk(clk),
        .reset(reset),
        .q(q)
    );

    always #5 clk = ~clk; // Clock with period 10ns (100MHz)

    initial begin

        clk = 0;
        reset = 1;
        #10 reset = 0;
        #200 $stop;
    end

    always @(posedge clk) 
    begin
        $display("Time = %0dns, q = %b", $time, q);
    end
endmodule