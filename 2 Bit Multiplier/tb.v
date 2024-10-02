`timescale 1ns / 1ps

module tb;
    reg [1:0] a;
    reg [1:0] b;
    wire [3:0] product;

    code uut (
        .a(a),
        .b(b),
        .product(product)
    );

    initial 
    begin        
        a = 2'b10;b = 2'b11;#10;
        a = 2'b01;b = 2'b01;#10;
        a = 2'b11;b = 2'b11;#10;
        a = 2'b00;b = 2'b10;#10;
        a = 2'b10;b = 2'b10;#10;
        $finish;
    end

    always@(*) 
    begin
        $display("a = %b, b = %b, product = %b", a, b, product);
    end
endmodule