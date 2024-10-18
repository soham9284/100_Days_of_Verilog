module tb_universal_shift_register;

    reg clk,rst;
    reg [1:0] control;
    reg [7:0] data_in;
    reg shift_in_left,shift_in_right;
    wire [7:0] data_out;

    universal_shift_register uut (
        .clk(clk),
        .rst(rst),
        .control(control),
        .data_in(data_in),
        .shift_in_left(shift_in_left),
        .shift_in_right(shift_in_right),
        .data_out(data_out)
    );

    always #5 clk = ~clk;  

    initial begin

        clk = 0;
        rst = 1; 
        control = 2'b00;
        data_in = 8'b00000000;
        shift_in_left = 0;
        shift_in_right = 0;
        #10 rst = 0;  // Disable reset

        control = 2'b11;data_in = 8'b10101010;#10; 
        control = 2'b01;shift_in_right = 1;#10;
        control = 2'b10; shift_in_left = 0; #10;
        control = 2'b00;#10;
        control = 2'b01;shift_in_right = 0;#10;
        $finish;
    end

    initial begin
        $monitor("Control = %b | Data Out = %b",control, data_out);
    end
endmodule