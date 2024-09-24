`timescale 1ns / 1ps

module mux_2x1(
    input [1:0] in,
    input sel,
    output out    
    );
    
    assign out= sel ? in[1] : in[0];
    
endmodule

module gates_mux(
    input a, b,
    output nand_out, nor_out
    );
    wire b_bar;
    
    mux_2x1 mux_bbar({1'b0, 1'b1}, b, b_bar);   
    mux_2x1 mux_nand({b_bar, 1'b1}, a, nand_out);
    mux_2x1 mux_nor({1'b0, b_bar}, a, nor_out);
    
endmodule