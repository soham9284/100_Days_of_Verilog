`timescale 1ns / 1ps
module tb;
    reg clk,reset,D;
    wire Q;

    d uut(
        .clk(clk),
        .reset(reset),
        .D(D),
        .Q(Q)
    );

    always #10 clk = ~clk;

    initial begin
        clk = 0;
        reset = 0;
        D = 0;

        #5 reset = 1; #20;  
        #5 reset = 0;      

        #10 D = 1;  
        #20 D = 0;  
        #20 D = 1; 
        #20 D = 0;  
        #20;
        $finish;  
    end

    initial begin
        $monitor("clk = %b | reset = %b | D = %b | Q = %b",clk, reset, D, Q);
    end
endmodule