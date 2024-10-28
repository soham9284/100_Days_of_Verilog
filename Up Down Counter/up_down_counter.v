module up_down_counter(
    input clk,
    input reset,
    input up_down,          // 1 for up-count, 0 for down-count
    output reg [3:0] count // 4-bit counter
);

    always @(posedge clk) begin
        if (reset)
            count <= 4'b0000; 
        else if (up_down)
            count <= count + 1; // Count up
        else
            count <= count - 1; // Count down
    end
endmodule