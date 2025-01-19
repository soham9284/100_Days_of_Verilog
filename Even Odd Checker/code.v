`timescale 1ns / 1ps

module code(
    input [7:0] num,       
    output reg even,odd  
);
    always @(*) begin
        if (num % 2 == 0) begin
            even = 1'b1;odd = 1'b0;
        end
        else begin
            even = 1'b0;odd = 1'b1;
        end
    end
endmodule