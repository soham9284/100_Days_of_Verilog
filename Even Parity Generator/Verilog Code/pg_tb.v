`timescale 1ns / 1ps

module pg_tb();
    reg a,b,c;
    wire p;
    
    pg uut(
        .a(a),
        .b(b),
        .c(c),
        .p(p)
        );
        
 initial begin
        a=0;b=0;c=0; #5
        a=0;b=0;c=1; #5
        a=0;b=1;c=0; #5
        a=0;b=1;c=1; #5
        a=1;b=0;c=0; #5
        a=1;b=0;c=1; #5
        a=1;b=1;c=0; #5
        a=1;b=1;c=1; #5
        $finish;          
    end
    
    always @(*)
    begin
        $display("a = %b, b = %b, c = %b, even parity = %b", a, b, c, p);
    end       
    
endmodule
