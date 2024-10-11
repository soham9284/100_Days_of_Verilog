module jk(
    input J,K,enable,     
    output reg Q 
);

    initial begin
        Q = 0;
    end

    always @(J or K or enable) 
    begin
        if (enable) 
        begin
            case ({J,K})
                2'b00: Q <= Q;    // Hold state
                2'b01: Q <= 0;    // Reset (Q = 0)
                2'b10: Q <= 1;    // Set (Q = 1)
                2'b11: Q <= ~Q;   // Toggle state (Q = ~Q)
            endcase
        end
    end
endmodule