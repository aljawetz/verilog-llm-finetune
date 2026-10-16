`timescale 1ns/1ps

module tb_EVEN_PARITY_GEN;

    reg a;
    reg b;
    reg c;
    wire ep;

    // Instantiate the module under test
    EVEN_PARITY_GEN uut (
        .a(a),
        .b(b),
        .c(c),
        .ep(ep)
    );

    initial begin
        // Test case 1: All inputs are low
        a = 0; b = 0; c = 0; #10;
        if (ep !== 1) $display("FAIL: Test case 1 failed (0, 0, 0) => ep = %b", ep);

        // Test case 2: One input is high
        a = 1; b = 0; c = 0; #10;
        if (ep !== 0) $display("FAIL: Test case 2 failed (1, 0, 0) => ep = %b", ep);

        // Test case 3: Two inputs are high
        a = 1; b = 1; c = 0; #10;
        if (ep !== 1) $display("FAIL: Test case 3 failed (1, 1, 0) => ep = %b", ep);

        // Test case 4: All inputs are high
        a = 1; b = 1; c = 1; #10;
        if (ep !== 0) $display("FAIL: Test case 4 failed (1, 1, 1) => ep = %b", ep);

        // Test case 5: Two inputs are high, one low
        a = 0; b = 1; c = 1; #10;
        if (ep !== 1) $display("FAIL: Test case 5 failed (0, 1, 1) => ep = %b", ep);

        // Test case 6: Two inputs are high, one low
        a = 1; b = 0; c = 1; #10;
        if (ep !== 1) $display("FAIL: Test case 6 failed (1, 0, 1) => ep = %b", ep);

        // Test case 7: One input high, two low
        a = 0; b = 0; c = 1; #10;
        if (ep !== 0) $display("FAIL: Test case 7 failed (0, 0, 1) => ep = %b", ep);

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule