`timescale 1ns / 1ps
module universal_shift_register(
    input wire clk,rst,                              
    input wire [1:0] control,     
    input wire [7:0] data_in,                    // Parallel data input
    input wire shift_in_left,shift_in_right,     // Shift input for the left shift and Shift input for the right shift
    output reg [7:0] data_out     
);

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            data_out <= 8'b0;
        end 
        else begin
            case (control)
                2'b00: begin
                    // Hold the current value
                    data_out <= data_out;
                end
                2'b01: begin
                    // Shift right by one bit
                    data_out <= {shift_in_right, data_out[7:1]};
                end
                2'b10: begin
                    // Shift left by one bit
                    data_out <= {data_out[6:0], shift_in_left};
                end
                2'b11: begin
                    // Load the parallel input
                    data_out <= data_in;
                end
                default: begin
                    data_out <= data_out; // Hold by default
                end
            endcase
        end
    end
endmodule