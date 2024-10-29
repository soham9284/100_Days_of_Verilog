`timescale 1ns / 1ps
module tb_csa;

    parameter N = 4;
    reg [N-1:0] a, b, c;
    wire [N-1:0] sum, carry;

    csa #(N) uut (
        .a(a),
        .b(b),
        .c(c),
        .sum(sum),
        .carry(carry)
    );
    initial begin
        a = 4'b1010;b = 4'b1100;c = 4'b0110;#10;
        a = 4'b1111;b = 4'b1111;c = 4'b1111;#10;
        a = 4'b0000;b = 4'b0000;c = 4'b0000;#10;
        a = 4'b1001;b = 4'b0101;c = 4'b0011;#10;
        a = 4'b0111;b = 4'b1010;c = 4'b1100;#10;
        $finish;
    end

    always @(sum or carry) begin
        $display("a = %b, b = %b, c = %b, Sum = %b, Carry = %b", a, b, c, sum, carry);
    end

endmodule