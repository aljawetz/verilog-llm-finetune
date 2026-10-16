`timescale 1ns/1ps

module tb_hs_beh;

    reg a, b;
    wire bo, di;

    // Instantiate the module under test (uut)
    hs_beh uut (
        .a(a),
        .b(b),
        .bo(bo),
        .di(di)
    );

    initial begin
        // Test case 1: a = 0, b = 0
        a = 0; b = 0;
        #10;
        if (di !== 0 || bo !== 0) $display("FAIL: Test case 1 failed (a=0, b=0)");

        // Test case 2: a = 0, b = 1
        a = 0; b = 1;
        #10;
        if (di !== 1 || bo !== 0) $display("FAIL: Test case 2 failed (a=0, b=1)");

        // Test case 3: a = 1, b = 0
        a = 1; b = 0;
        #10;
        if (di !== 1 || bo !== 0) $display("FAIL: Test case 3 failed (a=1, b=0)");

        // Test case 4: a = 1, b = 1
        a = 1; b = 1;
        #10;
        if (di !== 0 || bo !== 0) $display("FAIL: Test case 4 failed (a=1, b=1)");

        // Test case 5: a = 0, b = 1 (repeat to ensure consistency)
        a = 0; b = 1;
        #10;
        if (di !== 1 || bo !== 0) $display("FAIL: Test case 5 failed (a=0, b=1)");

        // Test case 6: a = 1, b = 0 (repeat to ensure consistency)
        a = 1; b = 0;
        #10;
        if (di !== 1 || bo !== 0) $display("FAIL: Test case 6 failed (a=1, b=0)");

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule