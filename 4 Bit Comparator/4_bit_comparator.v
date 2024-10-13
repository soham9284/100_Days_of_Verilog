`timescale 1ns / 1ps

module comparator(
    input [3:0] a,b,
    output reg greater,lesser,equal 
    );

    always @(a,b)
    begin
            greater=1'b0;
            lesser=1'b0;
            equal=1'b0;       
            if(a>b)
                greater=1'b1;
            else if(a<b)
                lesser=1'b1;
            else if(a==b)
                equal=1'b1;
    end
endmodule