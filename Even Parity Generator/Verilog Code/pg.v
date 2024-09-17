`timescale 1ns / 1ps

module pg(
    input a,b,c,
    output p
    );
    
    assign p=a^b^c;
endmodule
