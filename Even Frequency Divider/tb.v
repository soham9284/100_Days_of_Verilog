`timescale 1ns / 1ps

module tb;
    reg clk_in,reset;
    wire clk_out;
    
    div uut(
        .clk_in(clk_in),
        .reset(reset),
        .clk_out(clk_out)
        );

    always #10 clk_in = ~clk_in; //Period = 20ns -> Frequency = 50MHz

    initial begin
        clk_in = 0;
        reset = 1; 
        #20 reset = 0;  // Deactivate reset after 20 ns
        #2000;
        $finish;
    end

    initial begin
        $monitor("At time %t, clk_in = %b, clk_out = %b", $time, clk_in, clk_out);
    end
endmodule