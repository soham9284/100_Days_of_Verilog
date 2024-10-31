`timescale 1ns / 1ps

module tb;
    reg [3:0] a;
    reg [3:0] b;
    reg cin;
    wire [3:0] sum;
    wire cout;

    csa uut (
        .a(a),
        .b(b),
        .cin(cin),
        .sum(sum),
        .cout(cout)
    );

    initial begin

        $monitor("Time=%0t | a=%b | b=%b | cin=%b | sum=%b | cout=%b", $time, a, b, cin, sum, cout);

        a = 4'b0000; b = 4'b0000; cin = 1'b0;#10;
        a = 4'b0101; b = 4'b0011; cin = 1'b0;#10;
        a = 4'b0101; b = 4'b0011; cin = 1'b1;#10;
        a = 4'b1111; b = 4'b0001; cin = 1'b0;#10;
        a = 4'b1111; b = 4'b0001; cin = 1'b1;#10;
        a = 4'b1010; b = 4'b0101; cin = 1'b0;#10;
        a = 4'b1010; b = 4'b0101; cin = 1'b1;#10;
        a = 4'b1101; b = 4'b0110; cin = 1'b1;#10;
        a = 4'b1111; b = 4'b1111; cin = 1'b1;#10;
        $finish;
    end
endmodule