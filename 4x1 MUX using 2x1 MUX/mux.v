`timescale 1ns / 1ps

module mux(
    input [1:0] in,
    input sel,
    output reg out 
    );
    
    always @(*)
    begin
        case(sel)
            1'b0: out=in[0];
            1'b1: out=in[1];
        endcase
    end
endmodule

module muxx(
    output out,
    input [3:0]in,
    input [1:0]sel,
    output w1,w2
    );
    
    mux m1(.out(w1),.in(in[1:0]),.sel(sel[0]));
    mux m2(.out(w2),.in(in[3:2]),.sel(sel[0]));
    mux m3(.out(out),.in({w2,w1}),.sel(sel[1]));
    
endmodule
