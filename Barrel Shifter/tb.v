`timescale 1ns / 1ps
module tb;
    reg [7:0] data_in;   
    reg [2:0] shift_amt;        // 3-bit shift amount
    reg shift;                  // Shift direction: 0 for left, 1 for right
    reg rotate;                 // 0 for logical shift, 1 for rotate
    wire [7:0] data_out; 

    barrel uut (
        .data_in(data_in),
        .shift_amt(shift_amt),
        .shift(shift),
        .rotate(rotate),
        .data_out(data_out)
        );

    initial begin
        //Logical left shift by 2
        data_in = 8'b10011101; shift_amt = 3'b010; shift = 0; rotate = 0; #10;
        
        //Logical right shift by 3
        data_in = 8'b10011101; shift_amt = 3'b011; shift= 1; rotate = 0; #10;

        //Rotate left by 4
        data_in = 8'b10011101; shift_amt = 3'b100; shift = 0; rotate = 1; #10;

        //Rotate right by 5
        data_in = 8'b10011101; shift_amt = 3'b101; shift = 1; rotate = 1; #10;

        //Logical left shift by 1
        data_in = 8'b10011101; shift_amt = 3'b001; shift = 0; rotate = 0; #10;

        //Rotate right by 2
        data_in = 8'b10011101; shift_amt = 3'b010; shift = 1; rotate = 1; #10;
        $finish;
    end

    always @(*) begin
        $display("Data_in: %b, Shift_amt: %d, Shift: %b, Rotate: %b, Data_out: %b", data_in, shift_amt, shift, rotate, data_out);
    end
endmodule