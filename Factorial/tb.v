`timescale 1ns / 1ps

module tb;
    reg [3:0] n;
    wire [31:0] result;
    integer x;
    
    factorial uut(
    .n(n), 
    .result(result)
    );

always 
begin
    for(x=0; x<9; x=x+1)
        begin 
            n=x;#10;
        end
    $finish;
end

initial 
begin
    $monitor("Factorial of %d is %0d", n,result);
end

endmodule