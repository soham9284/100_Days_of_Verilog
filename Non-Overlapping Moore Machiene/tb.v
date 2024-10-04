module tb;

reg clk,reset,x;
wire detect,out;

moore uut (
    .x(x),
    .clk(clk),
    .reset(reset),
    .detect(detect),
    .out(out)
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
    $monitor("Clock: %b, x: %b, output: %b", clk, x, out);
end
endmodule
