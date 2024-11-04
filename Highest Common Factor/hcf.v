`timescale 1ns / 1ps

module hcf (
    input [7:0] in1, 
    input [7:0] in2,
    output reg [7:0] HCF
);
    reg [7:0] a, b;

    always @(*) begin
        a = in1;b = in2;
        while (a != b) begin
            if (a > b) 
                a = a - b;
            else 
                b = b - a;
        end
        HCF = a; 
    end
endmodule