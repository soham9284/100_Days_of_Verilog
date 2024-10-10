module tb_sr_latch_case;

    reg s, r;
    wire q, qn;

    sr_latch uut (
        .s(s), 
        .r(r), 
        .q(q), 
        .qn(qn)
    );

    initial begin
        s = 1; r = 0;#10;
        s = 0; r = 1;#10;
        s = 0; r = 0;#10;
        s = 1; r = 1;#10;
        s = 0; r = 0;#10;
        s = 1; r = 0;#10;
        $finish;
    end
    
    always@(*) begin 
        $display("S:%b, R:%b, Q:%b, Qn:%b",s,r,q,qn);
    end
endmodule
