`timescale 1ns / 1ps

module tb;

    reg clk, j, k, reset;
    wire q, qn;

    jk uut (
        .clk(clk), 
        .j(j), 
        .k(k), 
        .reset(reset), 
        .q(q), 
        .qn(qn)
    );

    always #5 clk = ~clk;

    initial begin
        clk = 0;
        reset = 0;
        j = 0;
        k = 0;

        reset = 1; #10;
        reset = 0; #10; 

        j = 1; k = 1; #10;
        j = 0; k = 0; #10;
        j = 0; k = 1; #10;
        j = 1; k = 0; #10;
        
        $finish;
    end

    always @(*) 
    begin
        $display("Reset=%b | J=%b | K=%b | Q=%b | Qn=%b", reset, j, k, q, qn);
    end
endmodule