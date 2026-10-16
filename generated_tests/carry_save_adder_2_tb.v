`timescale 1ns/1ps

module tb_carry_save_adder;

    reg [3:0] a, b, c, d;
    wire [3:0] sum, carry_out;

    // Instantiate the carry_save_adder module
    carry_save_adder uut (
        .a(a),
        .b(b),
        .c(c),
        .d(d),
        .sum(sum),
        .carry_out(carry_out)
    );

    initial begin
        // Test case 1
        a = 4'b0001; b = 4'b0010; c = 4'b0011; d = 4'b0100; // 1 + 2 + 3 + 4
        #10;
        if (sum !== 4'b0110 || carry_out !== 4'b0000) $display("FAIL: Test case 1 failed");
        
        // Test case 2
        a = 4'b1111; b = 4'b1111; c = 4'b1111; d = 4'b1111; // 15 + 15 + 15 + 15
        #10;
        if (sum !== 4'b1110 || carry_out !== 4'b1111) $display("FAIL: Test case 2 failed");
        
        // Test case 3
        a = 4'b0000; b = 4'b0000; c = 4'b0000; d = 4'b0000; // 0 + 0 + 0 + 0
        #10;
        if (sum !== 4'b0000 || carry_out !== 4'b0000) $display("FAIL: Test case 3 failed");
        
        // Test case 4
        a = 4'b0101; b = 4'b1010; c = 4'b1100; d = 4'b0011; // 5 + 10 + 12 + 3
        #10;
        if (sum !== 4'b1001 || carry_out !== 4'b1110) $display("FAIL: Test case 4 failed");

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule