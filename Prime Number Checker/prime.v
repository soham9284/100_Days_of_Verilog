`timescale 1ns / 1ps

module prime(
    input [7:0] num,
    output reg prime    // Output: 1 if prime, 0 otherwise
);
    integer i;
    reg check_prime;

    always@(*)begin
        if (num < 2) begin
            prime = 0; // Numbers less than 2 are not prime
        end 
        else begin
            check_prime = 0;
            for (i = 2; i <= num / 2; i = i + 1) begin
                if (num % i == 0) begin
                    check_prime = 1;
                end
            end
            prime = ~check_prime;
        end
    end

endmodule
