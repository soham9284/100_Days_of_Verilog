`timescale 1ns/1ns

module pwm_generator(
	input [7:0]duty,
	input clk, 
	output reg [7:0] counter, 
	output reg pwmout
    );

    initial begin
        counter = 0;
    end

    always @(posedge clk) begin
        if(counter < 99)
            counter <= counter + 1; 
        else
            counter <= 0;
    end
    
    always @(posedge clk) begin
        if(counter < duty) 
            pwmout <= 1'b1;
        else if (counter == 99) 
            pwmout <= 1'b1;
        else
            pwmout <= 1'b0;
    end         
endmodule