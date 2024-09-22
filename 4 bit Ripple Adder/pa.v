`timescale 1ns / 1ps

module pa(X,Y,Ci,S,Co);
    input X,Y,Ci;
    output S,Co;
    wire w1,w2,w3;
    
    xor G1(w1,X,Y);
    xor G2(S,w1,Ci);
    and G3(w2,w1,Ci);
    and G4(w3,X,Y);
    or G5(Co,w2,w3);
endmodule

module ripple_adder(X,Y,S,Co);
    input [3:0]X,Y;
    output [3:0]S;
    output Co;
    wire w1,w2,w3;    
     
    pa u1(X[0],Y[0],1'b0,S[0],w1);
    pa u2(X[1],Y[1],w1,S[1],w2);                    
    pa u3(X[2],Y[2],w2,S[2],w3);                    
    pa u4(X[3],Y[3],w3,S[3],Co);                    

endmodule
    
    
    
    
    
    
    
    
    
    