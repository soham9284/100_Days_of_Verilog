`timescale 1ns / 1ps

module gates_tb;
    reg a,b;
    wire and_op,or_op,not_op;
    
    gates uut(
        .a(a),
        .b(b),
        .and_op(and_op),
        .or_op(or_op),
        .not_op(not_op)
        );
    
    initial 
        begin
         a=1'b0;b=1'b0; #10
         a=1'b0;b=1'b1; #10
         a=1'b1;b=1'b0; #10
         a=1'b1;b=1'b1; #10
         $finish;         
        end

    initial begin
        $monitor("a=%b, b=%b, and output=%b, or output=%b, not output=%b",a ,b, and_op, or_op, not_op);          
    end
endmodule
