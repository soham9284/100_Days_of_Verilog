`timescale 1ns / 1ps

module csa #(parameter N = 4)(      // Port level Parameters
    input [N-1:0] a,
    input [N-1:0] b,
    input [N-1:0] c,
    output [N-1:0] sum,
    output [N-1:0] carry
    );
    
    genvar i;
    
    generate   
        for (i=0; i < N; i = i + 1) begin
            assign sum[i] = a[i] ^ b[i] ^ c[i];                                 // Sum without carry propagation
            assign carry[i] = (a[i] & b[i]) | (b[i] & c[i]) | (c[i] & a[i]);    // Carry bit
        end
    endgenerate   
     
endmodule