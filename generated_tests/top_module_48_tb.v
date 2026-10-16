`timescale 1ns/1ps

module tb_top_module;

    reg a;
    reg b;
    reg c;
    reg d;
    wire out;

    // Instantiate the module under test (uut)
    top_module uut (
        .a(a),
        .b(b),
        .c(c),
        .d(d),
        .out(out)
    );

    initial begin
        // Test sequence
        // Test case 1: a=0, b=0, c=0, d=0
        a = 0; b = 0; c = 0; d = 0; #10;
        if (out !== 0) $display("FAIL: Test case 1 failed (a=0, b=0, c=0, d=0)");

        // Test case 2: a=0, b=0, c=0, d=1
        a = 0; b = 0; c = 0; d = 1; #10;
        if (out !== 1) $display("FAIL: Test case 2 failed (a=0, b=0, c=0, d=1)");

        // Test case 3: a=0, b=0, c=1, d=0
        a = 0; b = 0; c = 1; d = 0; #10;
        if (out !== 1) $display("FAIL: Test case 3 failed (a=0, b=0, c=1, d=0)");

        // Test case 4: a=0, b=1, c=0, d=0
        a = 0; b = 1; c = 0; d = 0; #10;
        if (out !== 0) $display("FAIL: Test case 4 failed (a=0, b=1, c=0, d=0)");

        // Test case 5: a=1, b=0, c=0, d=0
        a = 1; b = 0; c = 0; d = 0; #10;
        if (out !== 0) $display("FAIL: Test case 5 failed (a=1, b=0, c=0, d=0)");

        // Test case 6: a=1, b=1, c=1, d=1
        a = 1; b = 1; c = 1; d = 1; #10;
        if (out !== 1) $display("FAIL: Test case 6 failed (a=1, b=1, c=1, d=1)");

        // Test case 7: a=1, b=1, c=0, d=0
        a = 1; b = 1; c = 0; d = 0; #10;
        if (out !== 0) $display("FAIL: Test case 7 failed (a=1, b=1, c=0, d=0)");

        // Test case 8: a=1, b=0, c=1, d=1
        a = 1; b = 0; c = 1; d = 1; #10;
        if (out !== 1) $display("FAIL: Test case 8 failed (a=1, b=0, c=1, d=1)");

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule