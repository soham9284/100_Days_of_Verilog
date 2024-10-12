`timescale 1ns / 1ps


module jk(
    input clk,j,k,reset,
    output reg q,qn
    );
    
    always@(posedge clk or j or k or reset)
    begin
        if(reset)
        begin
            q<=1'b0;
            qn<=1'b1;
        end
        else
        begin
            case({j,k})
                2'b00:begin           //No Change
                        q<=q;   
                        qn<=qn;
                      end       
                2'b01:begin           //Reset
                        q<=1'b0;
                        qn<=1'b1;
                      end    
                2'b10:begin           //Set
                        q<=1'b1;    
                        qn<=1'b0;
                      end    
                2'b11:begin           //Toggle
                        q<=~q;  
                        qn<=~qn;  
                        end    
            endcase
        end
    end
endmodule
