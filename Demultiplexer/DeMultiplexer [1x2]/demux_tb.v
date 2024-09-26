`timescale 1ns / 1ps

module demux_tb;
    reg sel, in;
    wire y0,y1;
    
    demux uut(
        .in(in),
        .sel(sel),
        .y0(y0),
        .y1(y1)
        );
        
    always 
    begin
        sel=0; in=0; 
        #10;
        sel=0; in=1; 
        #10;
        sel=1; in=0; 
        #10;
        sel=1; in=1; 
        #10;
        $finish;
    end
    
    initial 
    begin  
            $monitor("sel: %b  in: %b  y[0]: %b  y[1]: %b", sel, in, y0, y1);
            
    end
endmodule
