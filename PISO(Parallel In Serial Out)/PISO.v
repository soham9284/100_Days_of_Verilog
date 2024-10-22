`timescale 1ns / 1ps
module PISO(
    input clk, reset, load, 
    input [3:0] parallel_in,    
    output reg serial_out 
);
    reg [3:0] shift_reg;     

    always @(posedge clk) begin
        if (reset) begin
            shift_reg <= 4'b0000;  
            serial_out <= 1'b0;     
        end 
        else if (load) begin
            shift_reg <= parallel_in;
        end
        else begin
            serial_out <= shift_reg[3];  
            shift_reg <= {shift_reg[2:0], 1'b0}; // Shift left and fill with 0
        end
    end
endmodule