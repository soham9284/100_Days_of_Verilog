`timescale 1ns/1ns

module tb;
    reg [7:0] duty;
    reg clk;
    wire [7:0] counter;
    wire pwmout;
    
    pwm_generator uut(
        .duty(duty), 
        .clk(clk), 
        .counter(counter), 
        .pwmout(pwmout)
        );
        
    initial begin
        clk = 1'b1;
    end
    always #10 clk <= ~clk; 

    initial begin
        #0 duty = 0;
        #2000 duty = 10;
        #2000 duty = 40; 
        #2000 duty = 50; 
        #2000 duty = 80; 
        #2000 duty = 90; 
        #2000 $finish; 
    end
endmodule