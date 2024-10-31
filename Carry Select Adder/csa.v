`timescale 1ns / 1ps

module csa(a, b, cin, sum, cout);

    input [3:0] a, b;
    input cin;
    output [3:0] sum;
    output cout;
    
    wire [7:0] s, c; // Wires to hold intermediate sums and carries

    // Full adders for cin = 0
    full_adder FA0(s[0], c[0], a[0], b[0], 1'b0);
    full_adder FA1(s[1], c[1], a[1], b[1], c[0]);
    full_adder FA2(s[2], c[2], a[2], b[2], c[1]);
    full_adder FA3(s[3], c[3], a[3], b[3], c[2]);

    // Full adders for cin = 1
    full_adder FA4(s[4], c[4], a[0], b[0], 1'b1);
    full_adder FA5(s[5], c[5], a[1], b[1], c[4]);
    full_adder FA6(s[6], c[6], a[2], b[2], c[5]);
    full_adder FA7(s[7], c[7], a[3], b[3], c[6]);

    // Multiplexers to select the correct sum and carry based on cin
    mux2x1 m0(sum[0], cin, s[0], s[4]);
    mux2x1 m1(sum[1], cin, s[1], s[5]);
    mux2x1 m2(sum[2], cin, s[2], s[6]);
    mux2x1 m3(sum[3], cin, s[3], s[7]);
    
    mux2x1 m4(cout, cin, c[3], c[7]);

endmodule


// Full Adder Module
module full_adder (
    output sum,
    output carry_out,
    input a,
    input b,
    input carry_in
);

    assign sum = a ^ b ^ carry_in;              
    assign carry_out = (a & b) | (b & carry_in) | (a & carry_in);  

endmodule


// 2-to-1 Multiplexer Module (mux2x1)
module mux2x1 (
    output out,
    input sel,
    input in0,
    input in1
);

    assign out = sel ? in1 : in0;   

endmodule