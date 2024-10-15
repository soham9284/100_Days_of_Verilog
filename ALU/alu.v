`timescale 1ns / 1ps

module alu(
    input [7:0]A,B,
    input [3:0]select,
    output [7:0]out,
    output reg [15:0]mul,
    output reg carry
    );
    
    reg [7:0] Result;
    reg [8:0] temp;
    assign out = Result;                            
    
    always @(*) begin
        case(select)
            4'b0000:begin                                           // Addition
                        temp = {1'b0,A} + {1'b0,B};
                        carry = temp[8];                            // Carryout Flag
                    end 
            4'b0001:                                                // Subtraction
                Result = A-B ;
            4'b0010:begin
                        mul = A*B;
                        Result = mul[7:0];                              // Store the lower 8 bits in Result
                        carry = (mul[15:8]!=0) ? 1'b1 : 1'b0;        // Set carry if upper 8 bits are non-zero
                    end
            4'b0011:                    // Division
                Result = A/B;
            4'b0100:                    // Logical Shift Left
                Result = A<<1;
            4'b0101:                    // Logical Shift Right
                Result = A>>1;
            4'b0110:                    // Rotate Left
                Result = {A[6:0],A[7]};
            4'b0111:                    // Rotate Right
                Result = {A[0],A[7:1]};
            4'b1000:                    //  Logical And 
                Result = A&B;
            4'b1001:                    //  Logical Or
                Result = A|B;
            4'b1010:                    //  Logical Xor 
                Result = A^B;
            4'b1011:                    //  Logical Nor
                Result = ~(A|B);
            4'b1100:                    // Logical Nand 
                Result = ~(A&B);
            4'b1101:                    // Logical Xnor
                Result = ~(A^B);
            4'b1110:                    // Greater Comparison
                Result = (A>B) ? 8'd1 : 8'd0;
            4'b1111:                    // Equal Comparison   
                Result = (A==B) ? 8'd1 : 8'd0;    
            default: Result = 8'bxxxx_xxxx;                 // don't Care(default case)
        endcase                   
    end   
endmodule