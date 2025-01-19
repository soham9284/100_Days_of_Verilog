`timescale 1ns / 1ps

module tb;
    reg [7:0] num;
    wire even,odd;
    code uut (
        .num(num),
        .even(even),
        .odd(odd)
    );

    initial begin
        num = 8'b00000000; #10;
        $display("Num: %d, Even: %b, Odd: %b", num, even, odd);

        num = 8'b00000001; #10;
        $display("Num: %d, Even: %b, Odd: %b", num, even, odd);

        num = 8'b00000110; #10;
        $display("Num: %d, Even: %b, Odd: %b", num, even, odd);

        num = 8'b00000111; #10;
        $display("Num: %d, Even: %b, Odd: %b", num, even, odd);
        $finish;
    end
endmodule