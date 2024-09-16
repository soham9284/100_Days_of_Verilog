`timescale 1ns / 1ps

module fs_tb();
    reg a,b,bin;
    wire diff,bout;
    
    fs uut(
        .a(a),
        .b(b),
        .bin(bin),
        .diff(diff),
        .bout(bout)
        );
        
    initial begin
        a=0;b=0;bin=0; #5
        a=0;b=0;bin=1; #5
        a=0;b=1;bin=0; #5
        a=0;b=1;bin=1; #5
        a=1;b=0;bin=0; #5
        a=1;b=0;bin=1; #5
        a=1;b=1;bin=0; #5
        a=1;b=1;bin=1; #5
        $finish;          
    end
    
    always @(*)
    begin
        $display("a = %b, b = %b, bin = %b, diff = %b, bout = %b", a, b, bin, diff, bout);
    end
endmodule
