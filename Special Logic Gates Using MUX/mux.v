`timescale 1ns / 1ps

module mux_2_1(
    input [1:0] i,
    input sel,
    output out    
    );
    
    assign out= sel ? i[1] : i[0];
endmodule

module gates_mux(
    input a,b,
    output xor_out, xnor_out
    );
    wire bbar;
   
    mux_2_1 mbbar({1'b0, 1'b1}, b, bbar);    
    mux_2_1 mxor({bbar, b}, a, xor_out);
    mux_2_1 mxnor({b, bbar}, a, xnor_out);

endmodule
