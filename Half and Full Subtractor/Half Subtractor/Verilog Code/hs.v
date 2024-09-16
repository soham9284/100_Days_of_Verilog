`timescale 1ns / 1ps

module hs(
    input a,b,
    output diff,bout
    );
    
    assign diff = a^b;
    assign bout = ~a&b;
endmodule
