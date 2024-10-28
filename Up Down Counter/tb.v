module tb;
    reg clk;
    reg reset;
    reg up_down;
    wire [3:0] count;

    up_down_counter uut(
        .clk(clk),
        .reset(reset),
        .up_down(up_down),
        .count(count)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk; 
    end

    initial begin
        reset = 1;
        up_down = 1;
        #10 reset = 0; 
        up_down = 1;
        #100;
	up_down = 0;
        #75;
	reset = 1;
        #10 reset = 0;
        up_down = 1;
        #100;
        $finish;
    end

    initial begin
        $monitor("reset=%b || up_down=%b || count=%b",reset, up_down, count);
    end
endmodule