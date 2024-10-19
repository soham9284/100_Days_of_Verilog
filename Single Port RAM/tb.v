`timescale 1ns / 1ps

module test_bench;

reg [7:0] data,address;
reg wr, clk;
wire [7:0] q;

single_port_ram uut(data, address, wr, clk, q);

initial begin
    clk=1'b1;
    forever #5 clk=~clk;
end

initial begin
    data= 8'h4A;address= 8'd70;wr= 1'b1;#10;        //write data              
    data= 8'hC0;address= 8'd64;#10;    
    data= 8'h6F; address= 8'd127;#10;
    data= 8'hz;     
     //read operation
    address= 8'd64; wr= 1'b0;#10;    
    address= 8'd70;#10;
    address= 8'd127;#10;
    $finish;
end

initial begin
    $monitor("write enable: %b  address: %b  data: %b  output: %b", wr, address, data, q);
end
endmodule