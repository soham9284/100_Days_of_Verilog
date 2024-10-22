`timescale 1ns / 1ps
module siso(
    input clk,reset,      
    input serial_in,
    output reg serial_out 
);
    reg [3:0] shift_reg;        // 4-bit shift register

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            shift_reg <= 4'b0000; 
            serial_out <= 0;      
        end 
        else begin
           
            shift_reg <= {shift_reg[2:0], serial_in};
            serial_out <= shift_reg[3];         // Output the leftmost bit
        end
    end
endmodule