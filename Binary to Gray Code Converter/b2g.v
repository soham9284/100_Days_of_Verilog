`timescale 1ns / 1ps

module b2g(
    input [3:0] binary,   
    output [3:0] gray     
);

    assign gray[3] = binary[3];                      
    assign gray[2] = binary[3] ^ binary[2];          // XOR successive bits
    assign gray[1] = binary[2] ^ binary[1];
    assign gray[0] = binary[1] ^ binary[0];
endmodule