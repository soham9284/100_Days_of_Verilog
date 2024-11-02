`timescale 1ns / 1ps

module tb;
    reg clk;
    reg reset;
    wire [7:0] data;

    lfsr uut (clk,reset,data);

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        reset = 1;#10;  
        reset = 0;

        #200;
        $finish;
    end

    always @(posedge clk) begin
        $display("Time = %0dns, Reset = %b, Data = %b", $time, reset, data);
    end

endmodule