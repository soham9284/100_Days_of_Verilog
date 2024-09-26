`timescale 1ns / 1ps

module demux(
    input in,
    input sel,
    output y0, y1
    );    
    
    assign {y0,y1} = sel ? {1'b0,in} : {in,1'b0};
    
endmodule
