`timescale 1ns / 1ps

module gc(
    input clk,       
    input reset,    
    output reg [3:0] gray  // 4-bit Gray code output
);
    reg [3:0] binary;  // Internal binary counter

    always @(posedge clk) begin
        if (reset) begin
            binary <= 4'b0000; 
            gray <= 4'b0000;
        end 
        else begin
            binary <= binary + 1'b1;
            gray <= (binary >> 1) ^ binary;
        end
    end
endmodule