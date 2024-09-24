`timescale 1ns / 1ps

module gates_tb;
    reg a,b;
    wire nand_out,nor_out;
    
    gates_mux uut(
        .a(a),
        .b(b),
        .nand_out(nand_out),
        .nor_out(nor_out)
        );
    
    initial 
        begin
         a=1'b0;b=1'b0; #10
         a=1'b0;b=1'b1; #10
         a=1'b1;b=1'b0; #10
         a=1'b1;b=1'b1; #10
         $finish;         
        end

    initial begin
        $monitor("a=%b, b=%b, nand output=%b, nor output=%b",a ,b, nand_out, nor_out);          
    end
endmodule
