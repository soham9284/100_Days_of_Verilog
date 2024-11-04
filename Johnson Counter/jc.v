`timescale 1ns / 1ps
module jc(        //4-bit Johnson Counter
    input clk,
    input reset,
    output reg [3:0] q
);

    always @(posedge clk) begin
        if (reset) begin
            q <= 4'b0;  // Reset the counter to 0
        end else begin
            q <= {~q[0],q[3:1]};  // Shift and feed the complement of q[0] back
        end
    end
endmodule