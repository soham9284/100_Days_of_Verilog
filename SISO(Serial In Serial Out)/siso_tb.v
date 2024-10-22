`timescale 1ns / 1ps
module siso_tb;

    reg clk,reset,serial_in;
    wire serial_out;

    siso uut (
        .clk(clk),
        .reset(reset),
        .serial_in(serial_in),
        .serial_out(serial_out)
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
        #10 serial_in = 1; #20;  
        #10 serial_in = 0; #20;  
        #10 serial_in = 0; #20;  
        #10 serial_in = 1; #20; 
        #10 serial_in = 1; #20;  
        #10 serial_in = 1; #20;
        #10 serial_in = 0; #20;  
        #10 serial_in = 0; #20; 
        #20;
        $finish;
    end
    
    always @(posedge clk) 
    begin
        $monitor("Reset = %b || Serial In = %b || Serial Out = %b || Shift Register = %b",reset, serial_in, serial_out, uut.shift_reg);
    end
endmodule