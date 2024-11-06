`timescale 1ns / 1ps

module tb;
reg [7:0]data;
wire [3:0] b0, b1, b2;
wire [11:0] BCD;

binary_to_bcd uut(data, b0, b1, b2, BCD);

	initial begin
        data=8'b00000101;#10
        data=8'b00001010;#10
        data=8'b10000001;#10
        data=8'b01100101;#10
        data=8'b00110001;#10
        $finish;
	end
	
	always@(*) begin
	   $monitor("data: %d  BCD: %b", data, BCD);
    end
    
endmodule