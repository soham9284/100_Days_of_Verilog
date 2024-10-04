`timescale 1ns / 1ps

module moore(
    input x, clk, reset,
    output reg detect, out
);
    reg [1:0] ps, ns;  
    
    parameter s0 = 2'b00;  
    parameter s1 = 2'b01;  
    parameter s2 = 2'b10;  
    parameter s3 = 2'b11;  

    always @(posedge clk or posedge reset) begin
        if (reset) 
            ps <= s0;  
        else 
            ps <= ns; 
    end

    always @(*) 
    begin
        case (ps)
            s0: if(x) ns = s1; else ns = s0;  
            s1: if(~x) ns = s2; else ns = s1; 
            s2: if(x) ns = s3; else ns = s0; 
            s3: ns = s0; 
            
            default: ns = s0;
        endcase
    end

    always @(*)  out = (ps == s3);  
    always @(*)  detect = (ps == s3); 
endmodule
