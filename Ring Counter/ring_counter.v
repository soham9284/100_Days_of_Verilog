`timescale 1ns / 1ps

module ring_counter(
    input clk,reset,
    output reg [7:0]count
    );
    
    always@(posedge clk) begin
        if(reset)
            count <= 8'b0000_0001;
            
        else
            count <= { count[6:0],count[7] };  //Left Shift
    end
endmodule