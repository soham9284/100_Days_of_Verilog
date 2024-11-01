`timescale 1ns / 1ps

module ram(
    input clk,                  // Clock signal
    input [7:0] addr_a,         // Address for Port A
    input [7:0] addr_b,         // Address for Port B
    input [7:0] data_in_a,      // Data input for Port A
    input [7:0] data_in_b,      // Data input for Port B
    input we_a,                 // Write enable for Port A
    input we_b,                 // Write enable for Port B
    output reg [7:0] data_out_a,// Data output for Port A
    output reg [7:0] data_out_b // Data output for Port B
);

    // Memory array (256 x 8 bits)
    reg [7:0] mem [255:0];

    always @(posedge clk) begin
        if (we_a) begin
            mem[addr_a] <= data_in_a; // Write to memory if write enable is high
        end
        data_out_a <= mem[addr_a];    // Read from memory
    end

    always @(posedge clk) begin
        if (we_b) begin
            mem[addr_b] <= data_in_b; // Write to memory if write enable is high
        end
        data_out_b <= mem[addr_b];    // Read from memory
    end

endmodule