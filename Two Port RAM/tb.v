`timescale 1ns / 1ps

module tb;
    reg clk;
    reg [7:0] addr_a, addr_b;
    reg [7:0] data_in_a, data_in_b;
    reg we_a, we_b;
    wire [7:0] data_out_a, data_out_b;

    ram uut (
        .clk(clk),
        .addr_a(addr_a),
        .addr_b(addr_b),
        .data_in_a(data_in_a),
        .data_in_b(data_in_b),
        .we_a(we_a),
        .we_b(we_b),
        .data_out_a(data_out_a),
        .data_out_b(data_out_b)
    );

    always #5 clk = ~clk;

    initial begin

        clk = 0;
        we_a = 0; we_b = 0;
        addr_a = 8'h00; addr_b = 8'h00;
        data_in_a = 8'h00; data_in_b = 8'h00;

        // Write to Port A and read from Port B simultaneously
        #10 we_a = 1; addr_a = 8'h01; data_in_a = 8'hAA;  // Write AA to address 01 on Port A
        #10 we_a = 0; we_b = 1; addr_b = 8'h01; data_in_b = 8'hBB; // Write BB to address 01 on Port B
        #10 we_b = 0;  // Stop write

        // Read from both ports
        #10 addr_a = 8'h01; addr_b = 8'h01;  // Read from address 01 on both ports

        #10 addr_a = 8'h02; data_in_a = 8'h55; we_a = 1; // Write 55 to address 02 on Port A
        #10 we_a = 0; addr_a = 8'h02;          // Read from address 02 on Port A
        #20;
        $finish;
    end

    initial begin
        $monitor("Time = %0t || we_a = %b, addr_a = %h, data_in_a = %h, data_out_a = %h || we_b = %b, addr_b = %h, data_in_b = %h, data_out_b = %h", 
                  $time, we_a, addr_a, data_in_a, data_out_a, we_b, addr_b, data_in_b, data_out_b);
    end

endmodule