`timescale 1ns / 1ps

module counter(
    input clock,clear,
    output reg [3:0] count
    );
    always@(posedge clock)
    begin
        if(clear)
            count <= 4'd0;
        else 
            count <= count + 1;
    end   
endmodule
