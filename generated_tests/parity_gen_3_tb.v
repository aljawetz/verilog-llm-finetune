`timescale 1ns/1ps

module tb_parity_gen;

    reg x;
    reg y;
    reg z;
    wire result;

    // Instantiate the module under test (uut)
    parity_gen uut (
        .x(x),
        .y(y),
        .z(z),
        .result(result)
    );

    initial begin
        // Test case 1: 0, 0, 0 -> result should be 0 (even)
        x = 0; y = 0; z = 0;
        #10;
        if (result !== 0) $display("FAIL: Test case 1 failed (0, 0, 0)");

        // Test case 2: 0, 0, 1 -> result should be 1 (odd)
        x = 0; y = 0; z = 1;
        #10;
        if (result !== 1) $display("FAIL: Test case 2 failed (0, 0, 1)");

        // Test case 3: 0, 1, 0 -> result should be 1 (odd)
        x = 0; y = 1; z = 0;
        #10;
        if (result !== 1) $display("FAIL: Test case 3 failed (0, 1, 0)");

        // Test case 4: 1, 0, 0 -> result should be 1 (odd)
        x = 1; y = 0; z = 0;
        #10;
        if (result !== 1) $display("FAIL: Test case 4 failed (1, 0, 0)");

        // Test case 5: 1, 1, 0 -> result should be 0 (even)
        x = 1; y = 1; z = 0;
        #10;
        if (result !== 0) $display("FAIL: Test case 5 failed (1, 1, 0)");

        // Test case 6: 1, 0, 1 -> result should be 0 (even)
        x = 1; y = 0; z = 1;
        #10;
        if (result !== 0) $display("FAIL: Test case 6 failed (1, 0, 1)");

        // Test case 7: 0, 1, 1 -> result should be 0 (even)
        x = 0; y = 1; z = 1;
        #10;
        if (result !== 0) $display("FAIL: Test case 7 failed (0, 1, 1)");

        // Test case 8: 1, 1, 1 -> result should be 1 (odd)
        x = 1; y = 1; z = 1;
        #10;
        if (result !== 1) $display("FAIL: Test case 8 failed (1, 1, 1)");

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule