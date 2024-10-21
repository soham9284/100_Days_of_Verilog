module tb;
    reg clk,reset,T;
    wire Q;

    t uut(
        .clk(clk),
        .reset(reset),
        .T(T),
        .Q(Q)
    );

    always #10 clk = ~clk;

    initial begin

        clk = 0;
        reset = 0;
        T = 0;

        #5 reset = 1; #20;
        #5 reset = 0;     

        #10 T = 1; #20; 
        #10 T = 0; #20;  
        #10 T = 1; #20;  
        #10 T = 1; #20; 
        #10 T = 0; #20;  
        $finish;  
    end

    initial begin
        $monitor("Clk = %b : reset = %b : T = %b : Q = %b",clk, reset, T, Q);
    end
endmodule