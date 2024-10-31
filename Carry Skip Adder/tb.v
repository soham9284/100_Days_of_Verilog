`timescale 1ns / 1ps
module tb;

    reg [3:0] a, b;
    reg cin;
    wire [3:0] sum;
    wire cout;

    // Instantiate the carry_skip_adder module
    csa uut (
        .a(a),
        .b(b),
        .cin(cin),
        .sum(sum),
        .cout(cout)
    );

    // Test cases
    initial begin
        a = 4'b1010; b = 4'b1100; cin = 1'b0; #10;
        a = 4'b1111; b = 4'b1111; cin = 1'b1; #10;
        a = 4'b0000; b = 4'b0000; cin = 1'b0; #10;
        a = 4'b1001; b = 4'b0101; cin = 1'b1; #10;
        a = 4'b0111; b = 4'b1010; cin = 1'b0; #10;
        $finish;
    end

    // Monitor outputs
    always @(sum or cout) begin
        $display("a = %b, b = %b, cin = %b, Sum = %b, Cout = %b", a, b, cin, sum, cout);
    end

endmodule