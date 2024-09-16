`timescale 1ns / 1ps

module hs_tb();
    reg a,b;
    wire diff,bout;
    
    hs uut(
        .a(a),
        .b(b),
        .diff(diff),
        .bout(bout)
    );

    initial begin
        a=0;b=0; #5
        a=0;b=1; #5
        a=1;b=0; #5
        a=1;b=1; #5
        $finish;
    end
    
    always@(*)
    begin   
        $display("a = %b, b = %b, diff = %b, bout = %b", a, b, diff, bout);
    end
endmodule