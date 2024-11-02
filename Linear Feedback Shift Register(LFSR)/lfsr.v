`timescale 1ns / 1ps

module lfsr(clk,reset,data);
input clk;
input reset;
output reg [7:0]data;
wire feedback;

assign feedback = data[7]^data[5]^data[4]^data[3];

always@(posedge clk) begin
    if(reset) begin
        data <= 8'hff;
    end
    else begin
        data <= {data[6:0],feedback};
    end
end
endmodule