`timescale 1ns / 1ps

module tsd(
    input wire x,           
    input wire clk,         
    input wire reset,     
    output reg detect      
);

    reg [3:0] ps, ns;
    
    // State definitions for detecting sequences 1011 and 10010
    parameter S0 = 4'b0000; // Initial state
    parameter S1 = 4'b0001; // First '1' detected
    parameter S2 = 4'b0010; // '10' detected
    parameter S3 = 4'b0011; // '101' detected (for 1011)
    parameter S4 = 4'b0100; // '1011' detected (complete)
    parameter S5 = 4'b0101; // '100' detected (for 10010)
    parameter S6 = 4'b0110; // '1001' detected
    parameter S7 = 4'b0111; // '10010' detected (complete)

    always @(posedge clk) begin
        if (reset) 
            ps <= S0;  
        else 
            ps <= ns;
    end

    always @(*) begin
        case (ps)
            S0: if (x) ns = S1;         // Start of either sequence
                else ns = S0;
            S1: if (x) ns = S1;         // Still waiting for '10' or '100'
                else ns = S2;
            S2: if (x) ns = S3;         // Detect '101' for 1011 or start of 10010
                else ns = S5;
            S3: if (x) ns = S4;         // Detect '1011' complete
                else ns = S0;           // Reset after detecting sequence '1011'
            S4: ns = S0;                // Reset after detecting 1011
            S5: if (x) ns = S6;         // Continue detecting '1001'
                else ns = S0;
            S6: if (x) ns = S1;         // Restart on another '1' after 1001
                else ns = S7;           // Complete '10010'
            S7: ns = S0;                // Reset after detecting 10010
            default: ns = S0;
        endcase
    end

    always @(*) begin
        detect = (ps == S4) || (ps == S7);  // Detects either 1011 or 10010
    end
endmodule