`timescale 1ns / 1ps

module encoder_tb;

    reg [7:0]in;
    wire [2:0]out;
    
    encoder uut(
        .in(in),
        .out(out)
        );
        
    initial
    begin
           in=8'b00000000;
        #10 in=8'b10000000;
        #10 in=8'b01000000;
        #10 in=8'b00100000;
        #10 in=8'b00010000;
        #10 in=8'b00001000;
        #10 in=8'b00000100;
        #10 in=8'b00000010;
        #10 in=8'b00000001;
        $finish;
    end
    
    initial 
    begin
        $monitor("in = %b || out = %b",in, out);
    end
endmodule
