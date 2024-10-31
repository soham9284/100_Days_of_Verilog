`timescale 1ns / 1ps

module csa(
    output [3:0] sum, 
    output cout,
    input [3:0] a, b,
    input cin
    );
    wire c, sel;
    wire [3:0] w;

    parallel_adder pa(a, b, cin, sum, c);

    // Propagate signals p[i] for each bit position
    xor (w[0], a[0], b[0]);
    xor (w[1], a[1], b[1]);
    xor (w[2], a[2], b[2]);
    xor (w[3], a[3], b[3]);
    
    // Generate skip condition
    and (sel, w[0], w[1], w[2], w[3]);

    // Select cout based on skip condition
    assign cout = sel ? cin : c;
endmodule

module full_adder(
    input a, b, cin,
    output sout, cout
    );
        
    assign sout = a ^ b ^ cin;
    assign cout = (a & b) | (cin & (a ^ b));

endmodule


module parallel_adder(
    input [3:0] A, B,
    input carry_in, 
    output [3:0] sum,
    output carry
    );
    wire [2:0] c;

    full_adder fa1(A[0], B[0], carry_in, sum[0], c[0]);
    full_adder fa2(A[1], B[1], c[0], sum[1], c[1]);
    full_adder fa3(A[2], B[2], c[1], sum[2], c[2]);
    full_adder fa4(A[3], B[3], c[2], sum[3], carry);
endmodule


