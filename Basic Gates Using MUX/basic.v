`timescale 1ns / 1ps

module basic(
    input [1:0]in,
    input sel,
    output out
    );
    
    assign out = sel ? in[1] : in[0];
endmodule

module gates(
    input a,b,
    output and_op,or_op,not_op
    );
    
    basic mux_and({b,1'b0},a,and_op);
    basic mux_or({1'b1,b},a,or_op);
    basic mux_not({1'b0,1'b1},a,not_op);
endmodule
