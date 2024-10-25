`timescale 1ns / 1ps

module div(   
    input clk_in,reset,
    output reg clk_out
    );
    // Frequency Divider by a Factor of "8"   
    reg [2:0]count;    
    
    always@(posedge clk_in) begin
        if(reset) begin  
            count <= 0;
            clk_out <= 0;
        end
        else begin
            count <= count + 1;
            if(count == 3'b111) begin
                clk_out <= ~clk_out;     //Toggle at every 8th Cycle
            end
        end
    end
endmodule