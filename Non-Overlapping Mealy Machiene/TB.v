module TB;

reg clk,reset,x;
wire detect;

mealy uut (
    .x(x),
    .clk(clk),
    .reset(reset),
    .detect(detect)
);

initial begin
    clk= 1'b0;
    forever #5 clk = ~clk; 
end

initial begin
    reset = 1; 
    x = 0;
    
    #10 reset = 0;  
    #10 x = 1;  
    #10 x = 0;  
    #10 x = 1;  
    #10 x = 1; 
    #10 x = 1;
    #10 x = 0; 
    #10 x = 1; 
    #10 x = 1; 
    #10 x = 0;  
    #10 x = 1; 
    #10 x = 0;  
    #10 x = 1;  
    #10 $finish;
end

initial 
begin
    $monitor("Clock: %b, x: %b, detect: %b, ps: %b", clk, x, detect, uut.ps);
end
endmodule
