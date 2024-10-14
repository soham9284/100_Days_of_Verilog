`timescale 1ns / 1ps

module sr(
    input clk, s, r, reset,
    output reg q, qn
    );

    always @(posedge clk or posedge reset)
    begin
        if (reset)
        begin
            q <= 1'b0;
            qn <= 1'b1;
        end
        else
        begin
            case ({s,r})
                2'b00: begin  // No Change
                        q <= q;
                        qn <= qn;
                      end
                2'b01: begin  // Reset
                        q <= 1'b0;
                        qn <= 1'b1;
                      end
                2'b10: begin  // Set
                        q <= 1'b1;
                        qn <= 1'b0;
                      end
                2'b11: begin  // Invalid state 
                        q <= 1'bx;
                        qn <= 1'bx;
                      end
            endcase
        end
    end
endmodule
