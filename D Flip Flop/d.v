`timescale 1ns / 1ps
module d(
    input clk,reset,D,      
    output reg Q          // Data output
);

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            Q <= 1'b0;     // Reset the output Q to 0
        end 
        else begin
            Q <= D;        // Transfer D to Q
        end
    end
endmodule