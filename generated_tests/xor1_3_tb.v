`timescale 1ns/1ps

module tb_xor1;

    // Inputs
    reg a;
    reg b;
    reg c;

    // Output
    wire d;

    // Instantiate the Unit Under Test (UUT)
    xor1 uut (
        .a(a),
        .b(b),
        .c(c),
        .d(d)
    );

    initial begin
        // Test case 1: 0 ^ 0 ^ 0 = 0
        a = 0; b = 0; c = 0;
        #10;
        if (d !== 0) $display("FAIL: Test case 1 failed, expected 0, got %b", d);

        // Test case 2: 0 ^ 0 ^ 1 = 1
        a = 0; b = 0; c = 1;
        #10;
        if (d !== 1) $display("FAIL: Test case 2 failed, expected 1, got %b", d);

        // Test case 3: 0 ^ 1 ^ 0 = 1
        a = 0; b = 1; c = 0;
        #10;
        if (d !== 1) $display("FAIL: Test case 3 failed, expected 1, got %b", d);

        // Test case 4: 0 ^ 1 ^ 1 = 0
        a = 0; b = 1; c = 1;
        #10;
        if (d !== 0) $display("FAIL: Test case 4 failed, expected 0, got %b", d);

        // Test case 5: 1 ^ 0 ^ 0 = 1
        a = 1; b = 0; c = 0;
        #10;
        if (d !== 1) $display("FAIL: Test case 5 failed, expected 1, got %b", d);

        // Test case 6: 1 ^ 0 ^ 1 = 0
        a = 1; b = 0; c = 1;
        #10;
        if (d !== 0) $display("FAIL: Test case 6 failed, expected 0, got %b", d);

        // Test case 7: 1 ^ 1 ^ 0 = 0
        a = 1; b = 1; c = 0;
        #10;
        if (d !== 0) $display("FAIL: Test case 7 failed, expected 0, got %b", d);

        // Test case 8: 1 ^ 1 ^ 1 = 1
        a = 1; b = 1; c = 1;
        #10;
        if (d !== 1) $display("FAIL: Test case 8 failed, expected 1, got %b", d);

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule