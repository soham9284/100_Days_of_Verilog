/* 
Design a Traffic Light Controller using(FSM) to manage the traffic flow at a four-way intersection with traffic lights for the North, South, East, and West. 
The controller has two input signals: clk (clock) and rst_a (asynchronous reset). 
The output signals are n_lights, s_lights, e_lights, and w_lights, each represented as a 3-bit signal. 
The output signals use the following encoding:

"001": Green light
"010": Yellow light
"100": Red light
On asserting the reset (rst_a = 1), the controller should initialize to the North Green state. 
When the reset is de-asserted (rst_a = 0), the controller will start its traffic light sequence.

Traffic Light Sequence and Timing:

In each direction, the traffic light will display:
Green light for 8 clock cycles
Yellow light for 4 clock cycles
The sequence order for the traffic lights is:
North (Green → Yellow → Red)
South (Green → Yellow → Red)
East (Green → Yellow → Red)
West (Green → Yellow → Red)
The controller will continuously cycle through this sequence, starting again with the North Green state after completing the West Yellow state.

Implement the design in Verilog, with the output signals updating based on the current state, 
and verify the operation using a testbench that demonstrates the cycling of green and yellow lights for each direction according to the specified clock cycles.
*/
`timescale 1ns / 1ps
module traffic_control(
    input clk,
    input rst_a,
    input [1:0] traffic_n, traffic_s, traffic_e, traffic_w, // 2-bit traffic density inputs
    output reg [2:0] n_lights, s_lights, e_lights, w_lights  // 3-bit traffic light outputs
);

    // State encoding
    reg [2:0] state;
    parameter [2:0] NORTH = 3'b000, NORTH_Y = 3'b001,
                    SOUTH = 3'b010, SOUTH_Y = 3'b011,
                    EAST  = 3'b100, EAST_Y  = 3'b101,
                    WEST  = 3'b110, WEST_Y  = 3'b111;

    // Counter for timing lights and temporary green duration
    reg [3:0] count;
    reg [3:0] green_duration; // Duration for green light

    // Function to determine green light duration based on traffic density
    function [3:0] calculate_green_duration;
        input [1:0] density;
        begin
            case (density)
                2'b00: calculate_green_duration = 4;  // Low density
                2'b01: calculate_green_duration = 8;  // Medium density
                2'b10: calculate_green_duration = 12; // High density
                2'b11: calculate_green_duration = 16; // Very high density
                default: calculate_green_duration = 4; // Default to low density if undefined
            endcase
        end
    endfunction

    // State machine and counter logic
    always @(posedge clk or posedge rst_a) begin
        if (rst_a) begin
            state <= NORTH;
            count <= 0;
            green_duration <= calculate_green_duration(traffic_n); // Set green duration based on initial state
        end else begin
            case (state)
                NORTH: begin
                    if (count >= green_duration) begin
                        count <= 0;
                        state <= NORTH_Y;
                    end else begin
                        count <= count + 1;
                    end
                end

                NORTH_Y: begin
                    if (count >= 4) begin
                        count <= 0;
                        state <= SOUTH;
                        green_duration <= calculate_green_duration(traffic_s); // Set green duration for South
                    end else begin
                        count <= count + 1;
                    end
                end

                SOUTH: begin
                    if (count >= green_duration) begin
                        count <= 0;
                        state <= SOUTH_Y;
                    end else begin
                        count <= count + 1;
                    end
                end

                SOUTH_Y: begin
                    if (count >= 4) begin
                        count <= 0;
                        state <= EAST;
                        green_duration <= calculate_green_duration(traffic_e); // Set green duration for East
                    end else begin
                        count <= count + 1;
                    end
                end

                EAST: begin
                    if (count >= green_duration) begin
                        count <= 0;
                        state <= EAST_Y;
                    end else begin
                        count <= count + 1;
                    end
                end

                EAST_Y: begin
                    if (count >= 4) begin
                        count <= 0;
                        state <= WEST;
                        green_duration <= calculate_green_duration(traffic_w); // Set green duration for West
                    end else begin
                        count <= count + 1;
                    end
                end

                WEST: begin
                    if (count >= green_duration) begin
                        count <= 0;
                        state <= WEST_Y;
                    end else begin
                        count <= count + 1;
                    end
                end

                WEST_Y: begin
                    if (count >= 4) begin
                        count <= 0;
                        state <= NORTH;
                        green_duration <= calculate_green_duration(traffic_n); // Reset green duration for North
                    end else begin
                        count <= count + 1;
                    end
                end
            endcase
        end
    end

    // Output logic for traffic lights based on state
    always @(state) begin
        case (state)
            NORTH: begin
                n_lights = 3'b001; // North green
                s_lights = 3'b100; // South red
                e_lights = 3'b100; // East red
                w_lights = 3'b100; // West red
            end
            NORTH_Y: begin
                n_lights = 3'b010; // North yellow
                s_lights = 3'b100;
                e_lights = 3'b100;
                w_lights = 3'b100;
            end
            SOUTH: begin
                n_lights = 3'b100;
                s_lights = 3'b001; // South green
                e_lights = 3'b100;
                w_lights = 3'b100;
            end
            SOUTH_Y: begin
                n_lights = 3'b100;
                s_lights = 3'b010; // South yellow
                e_lights = 3'b100;
                w_lights = 3'b100;
            end
            EAST: begin
                n_lights = 3'b100;
                s_lights = 3'b100;
                e_lights = 3'b001; // East green
                w_lights = 3'b100;
            end
            EAST_Y: begin
                n_lights = 3'b100;
                s_lights = 3'b100;
                e_lights = 3'b010; // East yellow
                w_lights = 3'b100;
            end
            WEST: begin
                n_lights = 3'b100;
                s_lights = 3'b100;
                e_lights = 3'b100;
                w_lights = 3'b001; // West green
            end
            WEST_Y: begin
                n_lights = 3'b100;
                s_lights = 3'b100;
                e_lights = 3'b100;
                w_lights = 3'b010; // West yellow
            end
        endcase
    end

endmodule
