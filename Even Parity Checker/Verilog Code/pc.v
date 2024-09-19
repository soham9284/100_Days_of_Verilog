`timescale 1ns / 1ps

module pc(
    input a,b,c,p,
    output pc
    );
    
    assign pc=(a^b)^(c^p);
endmodule
