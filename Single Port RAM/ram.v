`timescale 1ns / 1ps

module single_port_ram(
        input [7:0] data,address, 
        input wr,clk,                 
        output [7:0] q
        );

reg [7:0] ram [127:0];
reg [7:0] addr_reg;

always @(posedge clk)
    begin
        if(wr)
           ram[address] <=data; //Write
        else
           addr_reg <=address;
    end
    
assign q = ram[addr_reg];       //Read

endmodule 