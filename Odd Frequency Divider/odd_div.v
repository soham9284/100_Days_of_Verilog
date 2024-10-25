`timescale 1ns / 1ps
module odd_div (
    input clk_in,reset,
    output reg clk_out
);
    //Frequency Divider by a Factor of 5	
    reg [2:0] count;  // 3-bit counter for 5 states

    always @(posedge clk_in or posedge reset) begin
        if (reset) begin
            count <= 0;  
            clk_out <= 0;  
        end
        else begin
            if (count == 4) begin  // When count reaches 4 (N-1 for N=5)
                count <= 0;
                clk_out <= ~clk_out;  // Toggle the output clock
            end
            else begin
                count <= count + 1;
            end
        end
    end
endmodule