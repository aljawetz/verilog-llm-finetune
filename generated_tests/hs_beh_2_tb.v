`timescale 1ns/1ps

module tb_hs_beh;

    // Inputs
    reg a;
    reg b;

    // Outputs
    wire bo;
    wire di;

    // Instantiate the Unit Under Test (UUT)
    hs_beh uut (
        .a(a),
        .b(b),
        .bo(bo),
        .di(di)
    );

    initial begin
        // Test Case 1: a = 0, b = 0
        a = 0; b = 0;
        #10;
        if (bo !== 0 || di !== 0) $display("FAIL: Test Case 1 failed");

        // Test Case 2: a = 0, b = 1
        a = 0; b = 1;
        #10;
        if (bo !== 0 || di !== 1) $display("FAIL: Test Case 2 failed");

        // Test Case 3: a = 1, b = 0
        a = 1; b = 0;
        #10;
        if (bo !== 0 || di !== 1) $display("FAIL: Test Case 3 failed");

        // Test Case 4: a = 1, b = 1
        a = 1; b = 1;
        #10;
        if (bo !== 0 || di !== 0) $display("FAIL: Test Case 4 failed");

        // Test Case 5: a = 0, b = 1 (repeated for consistency)
        a = 0; b = 1;
        #10;
        if (bo !== 0 || di !== 1) $display("FAIL: Test Case 5 failed");

        // Test Case 6: a = 1, b = 0 (repeated for consistency)
        a = 1; b = 0;
        #10;
        if (bo !== 0 || di !== 1) $display("FAIL: Test Case 6 failed");

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule