`timescale 1ns / 1ps
module tb;
    reg clk;
    reg rst_a;
    reg [1:0] traffic_n, traffic_s, traffic_e, traffic_w; // Traffic density inputs
    wire [2:0] n_lights, s_lights, e_lights, w_lights; // Traffic light outputs
    traffic_control uut (
        .clk(clk),
        .rst_a(rst_a),
        .traffic_n(traffic_n),
        .traffic_s(traffic_s),
        .traffic_e(traffic_e),
        .traffic_w(traffic_w),
        .n_lights(n_lights),
        .s_lights(s_lights),
        .e_lights(e_lights),
        .w_lights(w_lights)
    );
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10 time units clock period
    end
    initial begin
        $display("Starting test with reset...");
        rst_a = 1; 
        traffic_n = 2'b00; // Low traffic density
        traffic_s = 2'b00; // Low traffic density
        traffic_e = 2'b00; // Low traffic density
        traffic_w = 2'b00; // Low traffic density
        #10; rst_a = 0; 
       // North: High traffic
        traffic_n = 2'b10; // High density
        #160; // Expect 12 cycles for green, 4 cycles for yellow
        // South: Medium traffic
        traffic_s = 2'b01; // Medium density
        #120; // Expect 8 cycles for green, 4 cycles for yellow

        // East: Very high traffic
        traffic_e = 2'b11; // Very high density
        #200; // Expect 16 cycles for green, 4 cycles for yellow

        // West: Low traffic
        traffic_w = 2'b00; // Low density
        #80; // Expect 4 cycles for green, 4 cycles for yellow

        // Repeat the cycle with different densities to observe adaptive behavior
        $display("Testing adaptive behavior with varying traffic densities...");
        traffic_n = 2'b01; // Medium traffic for North
        traffic_s = 2'b10; // High traffic for South
        traffic_e = 2'b00; // Low traffic for East
        traffic_w = 2'b11; // Very high traffic for West
        #600; // Observe the full cycle with new densities
        $display("Test complete.");
        $finish;
    end
    initial begin
        $monitor("Time=%0t || State: N_Lights=%b S_Lights=%b E_Lights=%b W_Lights=%b || Density N=%b S=%b E=%b W=%b",
                 $time, n_lights, s_lights, e_lights, w_lights, traffic_n, traffic_s, traffic_e, traffic_w);
    end
endmodule