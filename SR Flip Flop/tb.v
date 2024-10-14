`timescale 1ns / 1ps

module tb;
    reg clk, s, r, reset; 
    wire q, qn;         

    sr uut (
        .clk(clk), 
        .s(s), 
        .r(r), 
        .reset(reset), 
        .q(q), 
        .qn(qn)
    );

    always #5 clk = ~clk;

    initial begin
        clk = 0;
        reset = 0;
        s = 0;
        r = 0;
        reset = 1; #10; 
        reset = 0; #10; 

        s = 0; r = 0; #10; // No Change
        s = 1; r = 0; #10; // Set
        s = 0; r = 1; #10; // Reset
        s = 0; r = 0; #10; // No Change
        s = 1; r = 1; #10; // Invalid State
        $finish;
    end

    always @(*) 
    begin
        $display("Reset=%b | S=%b | R=%b | Q=%b | Qn=%b", reset, s, r, q, qn);
    end
endmodule