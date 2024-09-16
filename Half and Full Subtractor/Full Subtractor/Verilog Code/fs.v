`timescale 1ns / 1ps

module fs(
    input a,b,bin,
    output diff,bout
    );
    
    assign diff=a^b^bin;
    assign bout=(~a & (b^bin)) | (b & bin) ;
endmodule
