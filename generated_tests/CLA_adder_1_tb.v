`timescale 1ns/1ps

module tb_CLA_adder;

    reg [3:0] a;
    reg [3:0] b;
    wire [3:0] sum;

    // Instantiate the Unit Under Test (UUT)
    CLA_adder uut (
        .a(a),
        .b(b),
        .sum(sum)
    );

    initial begin
        // Test case 1: 0 + 0 = 0
        a = 4'b0000; b = 4'b0000;
        #10;
        if (sum !== 4'b0000) $display("FAIL: Test case 1 failed (0 + 0)");

        // Test case 2: 1 + 1 = 2
        a = 4'b0001; b = 4'b0001;
        #10;
        if (sum !== 4'b0010) $display("FAIL: Test case 2 failed (1 + 1)");

        // Test case 3: 2 + 3 = 5
        a = 4'b0010; b = 4'b0011;
        #10;
        if (sum !== 4'b0101) $display("FAIL: Test case 3 failed (2 + 3)");

        // Test case 4: 7 + 1 = 8
        a = 4'b0111; b = 4'b0001;
        #10;
        if (sum !== 4'b1000) $display("FAIL: Test case 4 failed (7 + 1)");

        // Test case 5: 15 + 1 = 0 (overflow)
        a = 4'b1111; b = 4'b0001;
        #10;
        if (sum !== 4'b0000) $display("FAIL: Test case 5 failed (15 + 1)");

        // Test case 6: 5 + 10 = 15
        a = 4'b0101; b = 4'b1010;
        #10;
        if (sum !== 4'b1111) $display("FAIL: Test case 6 failed (5 + 10)");

        // Test case 7: 3 + 5 = 8
        a = 4'b0011; b = 4'b0101;
        #10;
        if (sum !== 4'b1000) $display("FAIL: Test case 7 failed (3 + 5)");

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule