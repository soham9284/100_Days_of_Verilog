`timescale 1ns / 1ps

module mod10 (
    input clk,reset,       
    output reg [3:0] q   // 4-bit output for counter (counts from 0 to 9)
);

    always @(posedge clk) begin
        if (reset) begin
            q <= 4'b0000; 
        end
        else if (q == 4'b1001) begin    // Check if counter has reached 9
            q <= 4'b0000;               // Reset the counter to 0 when it reaches 9
        end
        else 
        begin
            q <= q + 1'b1; // Increment the counter
        end
    end
endmodule