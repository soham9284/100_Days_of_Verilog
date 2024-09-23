`timescale 1ns / 1ps

module mux4x1(
    input [3:0]ip,
    output reg out,
    input [1:0]sel
    );
    
    always @(*) 
    begin
        case(sel)
            2'b00: out = ip[0];  
            2'b01: out = ip[1];  
            2'b10: out = ip[2];  
            2'b11: out = ip[3];
        endcase
    end
endmodule