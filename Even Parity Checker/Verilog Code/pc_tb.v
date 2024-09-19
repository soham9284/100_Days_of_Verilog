`timescale 1ns / 1ps

module pc_tb();
    reg a,b,c,p;
    wire pc;
    
    pc uut(
        .a(a),
        .b(b),
        .c(c),
        .p(p),
        .pc(pc)
    );
    
    initial begin
        a=0;b=0;c=0;p=0; #5
        a=0;b=0;c=1;p=0; #5
        a=0;b=1;c=0;p=1; #5
        a=0;b=1;c=1;p=1; #5
        a=1;b=0;c=0;p=1; #5
        a=1;b=0;c=1;p=0; #5
        a=1;b=1;c=0;p=1; #5
        a=1;b=1;c=1;p=0; #5
        $finish;          
    end
    
    always @(*)
    begin
        $display("a = %b, b = %b, c = %b, p = %b, pc = %b", a, b, c, p, pc);
    end       

endmodule
