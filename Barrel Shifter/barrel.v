`timescale 1ns / 1ps
module barrel(
    input [7:0] data_in,            // 8-bit input
    input [2:0] shift_amt,          // 3-bit shift amount (0-7)
    input shift,                    // Shift direction (0 for left, 1 for right)
    input rotate,                   // Rotate enable (1 for rotate, 0 for logical shift)
    output reg [7:0] data_out       // 8-bit output
    );
    always @(*) begin
        if (shift == 1'b0) begin // Left shift
            if (rotate) begin
                // Rotate left
                data_out = (data_in << shift_amt) | (data_in >> (8 - shift_amt));
            end 
            else begin
                // Logical left shift
                data_out = data_in << shift_amt;
            end
        end 
        else begin // Right shift
            if (rotate) begin
                // Rotate right
                data_out = (data_in >> shift_amt) | (data_in << (8 - shift_amt));
            end 
            else begin
                // Logical right shift
                data_out = data_in >> shift_amt;
            end
        end
    end
endmodule