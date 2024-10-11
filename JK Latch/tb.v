module tb;
    reg J, K, enable;
    wire Q;

    jk uut (
        .J(J), 
        .K(K), 
        .enable(enable), 
        .Q(Q)
    );

    initial begin
        enable = 0; J = 0; K = 0; #10;  // Enable = 0, Hold state
        enable = 1; J = 0; K = 1; #10;  // Reset (Q = 0)
        enable = 1; J = 1; K = 0; #10;  // Set (Q = 1)
        enable = 1; J = 1; K = 1; #10;  // Toggle Q
        enable = 1; J = 0; K = 0; #10;  // Hold state (J = 0, K = 0)
        enable = 1; J = 1; K = 1; #10;  // Toggle Q
        enable = 0; J = 1; K = 0; #10;  // Enable = 0, Hold state
        $finish;
    end
    // Display outputs
    always @(*) begin
        $display("Enable:%b, J:%b, K:%b, Q:%b", enable, J, K, Q);
    end
endmodule