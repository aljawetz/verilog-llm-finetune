`timescale 1ns/1ps

module tb_fa_str;

    reg a, b, c_in;
    wire sum, c_out;

    // Instantiate the full adder module
    fa_str uut (
        .sum(sum),
        .c_out(c_out),
        .a(a),
        .b(b),
        .c_in(c_in)
    );

    initial begin
        // Test case 1: 0 + 0 + 0 = 0, c_out = 0
        a = 0; b = 0; c_in = 0;
        #10;
        if (sum !== 0 || c_out !== 0) $display("FAIL: Test case 1 failed");

        // Test case 2: 0 + 0 + 1 = 1, c_out = 0
        a = 0; b = 0; c_in = 1;
        #10;
        if (sum !== 1 || c_out !== 0) $display("FAIL: Test case 2 failed");

        // Test case 3: 0 + 1 + 0 = 1, c_out = 0
        a = 0; b = 1; c_in = 0;
        #10;
        if (sum !== 1 || c_out !== 0) $display("FAIL: Test case 3 failed");

        // Test case 4: 0 + 1 + 1 = 0, c_out = 1
        a = 0; b = 1; c_in = 1;
        #10;
        if (sum !== 0 || c_out !== 1) $display("FAIL: Test case 4 failed");

        // Test case 5: 1 + 0 + 0 = 1, c_out = 0
        a = 1; b = 0; c_in = 0;
        #10;
        if (sum !== 1 || c_out !== 0) $display("FAIL: Test case 5 failed");

        // Test case 6: 1 + 0 + 1 = 0, c_out = 1
        a = 1; b = 0; c_in = 1;
        #10;
        if (sum !== 0 || c_out !== 1) $display("FAIL: Test case 6 failed");

        // Test case 7: 1 + 1 + 0 = 0, c_out = 1
        a = 1; b = 1; c_in = 0;
        #10;
        if (sum !== 0 || c_out !== 1) $display("FAIL: Test case 7 failed");

        // Test case 8: 1 + 1 + 1 = 1, c_out = 1
        a = 1; b = 1; c_in = 1;
        #10;
        if (sum !== 1 || c_out !== 1) $display("FAIL: Test case 8 failed");

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule