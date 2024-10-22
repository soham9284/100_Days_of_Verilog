`timescale 1ns / 1ps
module sipo(
    input clk,reset, 
    input serial_in,      
    output reg [3:0] parallel_out  // 4-bit parallel output
);
    reg [3:0] shift_reg;    // 4-bit shift register to store intermediate values

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            shift_reg <= 4'b0000;    
            parallel_out <= 4'b0000; 
        end 
        else begin
            shift_reg <= {shift_reg[2:0], serial_in};  // Shift the register left and input serial bit
            parallel_out <= shift_reg;                 // Assign the shift register value to parallel output
        end
    end
endmodule