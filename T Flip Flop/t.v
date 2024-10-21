`timescale 1ns / 1ps

module t(
    input wire clk,reset,T,   
    output reg Q        
    );

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            Q <= 1'b0; 
        end 
        else if (T) begin
            Q <= ~Q;   // Toggle Q if T is 1
        end
    end
endmodule