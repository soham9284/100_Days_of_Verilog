`timescale 1ns / 1ps

module demux(
  input sel,
  input i,
  output y0, y1
  );
  
  assign {y0,y1} = sel ? {1'b0,i} : {i,1'b0};

endmodule

module dmux_1x8(
    input [2:0]sel,
    input  i,
    output y0, y1, y2, y3, y4, y5, y6, y7
    );
    
    wire [5:0]z;
    
    demux dm1(sel[2], i, z[0], z[1]);

    demux dm2(sel[1], z[0], z[2], z[3]);
    demux dm3(sel[1], z[1], z[4], z[5]);

    demux dm4(sel[0], z[2], y0, y1);
    demux dm5(sel[0], z[3], y2, y3);
    demux dm6(sel[0], z[4], y4, y5);  
    demux dm7(sel[0], z[5], y6, y7);
endmodule
