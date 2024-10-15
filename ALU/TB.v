`timescale 1ns / 1ps

module TB;
 reg[7:0] A,B;
 reg[3:0] select;
 wire[7:0] out;
 wire [15:0] mul;
 wire carry;
 integer i;
 
 alu uut(
       .A(A),
       .B(B),                  
       .select(select),
       .out(out), 
       .mul(mul),
       .carry(carry) 
     );
     
    initial begin
      A = 8'h58;
      B = 4'h06;
      select = 4'b0000;#25;
      
      for (i=0;i<=15;i=i+1)
      begin
        select = select + 4'b0001;#25;       
      end
      $finish;     
    end
endmodule