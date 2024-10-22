`timescale 1ns / 1ps
module TB_PISO;

    reg clk, reset, load;
    reg [3:0] parallel_in;
    wire serial_out;

    PISO uut (
        .clk(clk),
        .reset(reset),
        .parallel_in(parallel_in),
        .load(load),
        .serial_out(serial_out)
    );

    always #10 clk = ~clk;

    initial begin

        clk = 0;
        reset = 0;
        load = 0;
        parallel_in = 4'b0000;

        #5 reset = 1; #20;
        #5 reset = 0;

        #10 parallel_in = 4'b1011; load = 1; #20; 
        #10 load = 0; #20; 
        #20; 

        #10 parallel_in = 4'b1100; load = 1; #20;  
        #10 load = 0; #20;  
        #20;  

        #10 parallel_in = 4'b0110; load = 1; #20; 
        #10 load = 0; #20; 
        #40;
        $finish;
    end

    always @(posedge clk) 
    begin
        $monitor("Reset = %b || Load = %b || Parallel In = %b || Serial Out = %b || Shift Register = %b",reset, load, parallel_in, serial_out, uut.shift_reg);
    end
endmodule