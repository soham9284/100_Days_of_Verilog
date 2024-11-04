`timescale 1ns / 1ps
module tb;

    reg [7:0] in1, in2;
    wire [7:0] HCF;

    hcf uut (
        .in1(in1),
        .in2(in2),
        .HCF(HCF)
    );
    
    initial begin
        in1 = 8'b00001010; // 10
        in2 = 8'b00000101; // 5
        #10;
        
        in1 = 8'b00001100; // 12
        in2 = 8'b00000100; // 4
        #10;

        in1 = 8'b00001000; // 8
        in2 = 8'b00000010; // 2
        #10;

        in1 = 8'b00000111; // 7
        in2 = 8'b00000101; // 5
        #10;

        in1 = 8'b00010010; // 18
        in2 = 8'b00011000; // 24
        #10;

        in1 = 8'b00001000; // 8
        in2 = 8'b00001000; // 8
        #10;
        $finish;
    end

    always @(HCF) begin
        $display("HCF(%d, %d) = %d", in1, in2, HCF);
    end

endmodule