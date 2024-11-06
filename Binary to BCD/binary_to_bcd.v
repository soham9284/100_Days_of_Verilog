`timescale 1ns / 1ps

module binary_to_bcd(
    input [7:0]data,
    output reg [3:0] b0,b1,b2,
    output reg[11:0] BCD    
    );
    
    integer n;

    always@(data)
    begin
        b0=0; b1=0; b2=0;
        
        for(n=0; n<8; n=n+1) begin
            if(b0>4) b0 = b0+3;
            if(b1>4) b1 = b1+3;
            if(b2>4) b2 = b2+3;
            {b2,b1,b0} = {b2,b1,b0,data[7-n]};
        end
        BCD= {b2, b1, b0};
    end
endmodule