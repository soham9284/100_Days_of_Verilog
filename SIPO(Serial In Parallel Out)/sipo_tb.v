`timescale 1ns / 1ps
module sipo_tb;

    reg clk, reset, serial_in;
    wire [3:0] parallel_out;

    sipo uut (
        .clk(clk),
        .reset(reset),
        .serial_in(serial_in),
        .parallel_out(parallel_out)
    );

    always #10 clk = ~clk;

    initial begin
        clk = 0;
        reset = 0;
        serial_in = 0;

        #5 reset = 1; #20;
        #5 reset = 0;

        #10 serial_in = 1; #20;
        #10 serial_in = 0; #20;  
        #10 serial_in = 1; #20; 
        #10 serial_in = 1; #20;  
        #10 serial_in = 0; #20;  
        #10 serial_in = 1; #20;  
        #10 serial_in = 0; #20;  
        #10 serial_in = 0; #20; 
        #10 serial_in = 1; #20;
        #10 serial_in = 1; #20;
        #10 serial_in = 0; #20;
        #10 serial_in = 1; #20;
        #20;
        $finish;
    end


    always @(posedge clk) 
    begin
        $monitor("Time: %0t || Reset = %b || Serial In = %b || Parallel Out = %b || Shift Register = %b", 
                 $time, reset, serial_in, parallel_out, uut.shift_reg);
    end
endmodule