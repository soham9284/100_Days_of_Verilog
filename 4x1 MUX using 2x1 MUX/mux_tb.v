`timescale 1ns / 1ps

module mux_tb;
    reg [3:0]ip;
    reg [1:0]sel;
    wire out;
    
    mux4x1 uut(
    .ip(ip),
    .out(out),
    .sel(sel)
    );
    
    initial 
    begin
       #10 ip = 4'b0001; sel = 2'b01;
       #10 ip = 4'b1001; sel = 2'b11;
       #10 ip = 4'b0111; sel = 2'b11;
       #10 ip = 4'b0110; sel = 2'b01;
       $finish;
    end 
       
    always@(*) 
    begin
        $display("input data = %b, select line = %b, output = %b", ip, sel, out);
    end
    
endmodule
