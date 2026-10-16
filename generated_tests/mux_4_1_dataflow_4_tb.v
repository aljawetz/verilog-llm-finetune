`timescale 1ns/1ps

module tb_mux_4_1_dataflow;

    reg a, b, c, d;
    reg s0, s1;
    wire out;

    // Instantiate the module under test (uut)
    mux_4_1_dataflow uut (
        .a(a),
        .b(b),
        .c(c),
        .d(d),
        .s0(s0),
        .s1(s1),
        .out(out)
    );

    initial begin
        // Test case 1: Select input a
        a = 1; b = 0; c = 0; d = 0; s0 = 0; s1 = 0;
        #10;
        if (out !== 1) $display("FAIL: Test case 1 failed, expected out = 1, got out = %b", out);

        // Test case 2: Select input b
        a = 0; b = 1; c = 0; d = 0; s0 = 1; s1 = 0;
        #10;
        if (out !== 1) $display("FAIL: Test case 2 failed, expected out = 1, got out = %b", out);

        // Test case 3: Select input c
        a = 0; b = 0; c = 1; d = 0; s0 = 0; s1 = 1;
        #10;
        if (out !== 1) $display("FAIL: Test case 3 failed, expected out = 1, got out = %b", out);

        // Test case 4: Select input d
        a = 0; b = 0; c = 0; d = 1; s0 = 1; s1 = 1;
        #10;
        if (out !== 1) $display("FAIL: Test case 4 failed, expected out = 1, got out = %b", out);

        // Test case 5: All inputs low, select a
        a = 0; b = 0; c = 0; d = 0; s0 = 0; s1 = 0;
        #10;
        if (out !== 0) $display("FAIL: Test case 5 failed, expected out = 0, got out = %b", out);

        // Test case 6: All inputs low, select b
        a = 0; b = 0; c = 0; d = 0; s0 = 1; s1 = 0;
        #10;
        if (out !== 0) $display("FAIL: Test case 6 failed, expected out = 0, got out = %b", out);

        // Test case 7: All inputs low, select c
        a = 0; b = 0; c = 0; d = 0; s0 = 0; s1 = 1;
        #10;
        if (out !== 0) $display("FAIL: Test case 7 failed, expected out = 0, got out = %b", out);

        // Test case 8: All inputs low, select d
        a = 0; b = 0; c = 0; d = 0; s0 = 1; s1 = 1;
        #10;
        if (out !== 0) $display("FAIL: Test case 8 failed, expected out = 0, got out = %b", out);

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule