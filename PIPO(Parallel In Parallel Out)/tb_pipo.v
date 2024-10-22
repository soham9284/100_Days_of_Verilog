`timescale 1ns / 1ps
module tb_pipo;

    reg clk, reset;
    reg [3:0] parallel_in;
    wire [3:0] parallel_out;

    pipo uut(
        .clk(clk),
        .reset(reset),
        .parallel_in(parallel_in),
        .parallel_out(parallel_out)
    );

    always #10 clk = ~clk;

    initial begin

        clk = 0;
        reset = 0;
        parallel_in = 4'b0000;

        #5 reset = 1; #20;
        #5 reset = 0;

        #10 parallel_in = 4'b1011; #20; 
        #10 parallel_in = 4'b1100; #20;  
        #10 parallel_in = 4'b0011; #20
        #10 parallel_in = 4'b0110; #20;
        #40;
        $finish;
    end

    always @(posedge clk) begin
        $monitor("Reset = %b || Parallel In = %b || Parallel Out = %b",reset, parallel_in, parallel_out);
    end
endmodule