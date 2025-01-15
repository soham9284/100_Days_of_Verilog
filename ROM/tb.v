`timescale 1ns / 1ps

module tb_rom;
    reg clk;
    reg r_en;
    reg [3:0] addr;
    wire [15:0] data;

    rom uut(
        .clk(clk),
        .r_en(r_en),
        .addr(addr),
        .data(data)
    );
    initial clk = 0;
    always #5 clk = ~clk;

    initial begin
        r_en = 0;
        addr = 4'b0000;

        //Initialize memory 
        uut.memory[0] = 16'hAAAA;
        uut.memory[1] = 16'hBBBB;
        uut.memory[2] = 16'hCCCC;
        uut.memory[3] = 16'hDDDD;

        //Test cases
        #10; r_en = 1;addr = 4'b0000;  
        #10; addr = 4'b0001;           
        #10; addr = 4'b0010;
        #10; addr = 4'b0011;    
        #10; r_en = 0;               
        #20; 
        $finish;
    end

    initial begin
        $monitor("clk = %b || r_en = %b || addr = %b || data = %h",
                 clk, r_en, addr, data);
    end
endmodule