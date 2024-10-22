`timescale 1ns / 1ps
module pipo(
    input clk, reset, 
    input [3:0] parallel_in,  
    output reg [3:0] parallel_out 
);

    always @(posedge clk) begin
        if (reset) begin
            parallel_out <= 4'b0000; 
        end 
        else begin
            parallel_out <= parallel_in; // Load parallel input into parallel output
        end
    end
endmodule