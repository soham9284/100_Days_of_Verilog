`timescale 1ns / 1ps

module sr_latch(
    input s,r,
    output reg q,qn
    );
    
    always@(s,r)
    begin
        case({s,r})
            2'b00: begin     //No Change
                        q<=q;
                        qn<=qn;
                   end
            2'b01: begin     //reset
                        q<=0;
                        qn<=1;
                   end
            2'b10: begin     //set
                        q<=1;
                        qn<=0;   
                   end
            2'b11: begin     //Invalid state
                        q<=1'bx; 
                        qn<=1'bx;
                   end    
        endcase 
    end
endmodule