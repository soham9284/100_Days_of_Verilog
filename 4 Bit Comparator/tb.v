`timescale 1ns / 1ps

module tb;
    reg [3:0]a,b;
    wire greater,lesser,equal;
    
    comparator uut(
        .a(a),
        .b(b),
        .greater(greater),
        .lesser(lesser),
        .equal(equal)
        );
        
     initial begin
        a=4'b0110;b=4'b1010;#10;
        a=4'b1110;b=4'b1010;#10;
        a=4'b0100;b=4'b0010;#10;
        a=4'b0110;b=4'b0001;#10;
        a=4'b1101;b=4'b1101;#10;
        a=4'b0111;b=4'b1010;#10;
        $finish;
     end
     
     always@(*)
     begin  
        $display("A:%b || B:%b || Lesser:%b || Equal:%b || Greater:%b",a,b,lesser,equal,greater);
     end
endmodule
