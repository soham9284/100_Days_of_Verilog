`timescale 1ns / 1ps

module tb();
    reg clock;      
    reg clear;      
    wire [3:0] count;  

    counter uut (
        .clock(clock),
        .clear(clear),
        .count(count)
    );

    always begin
        #5 clock = ~clock;  
    end

    initial begin
        clock = 0;  
        clear = 1; 
        #20 clear = 0;
        #70;
        #10 clear = 1;
        #10 clear = 0;
        #50;
        $stop;
    end
    
    initial 
    begin
        $monitor("Time = %0dns, Clock = %b, Clear = %b, Count = %d", 
                 $time, clock, clear, count);
    end
endmodule