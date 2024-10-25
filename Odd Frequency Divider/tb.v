`timescale 1ns / 1ps
module tb;
    reg clk_in,reset;
    wire clk_out;

    odd_div uut (
        .clk_in(clk_in),
        .reset(reset),
        .clk_out(clk_out)
    );

    // Generate clock signal (period = 20 ns -> frequency = 50 MHz)
    always #10 clk_in = ~clk_in;

    initial begin
        clk_in = 0;
        reset = 1; 
        #20 reset = 0; 
        #2000;
        $finish;
    end

    initial begin
        $monitor("At time %t, clk_in = %b, clk_out = %b", $time, clk_in, clk_out);
    end
endmodule