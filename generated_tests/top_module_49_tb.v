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
        // Test case 1: a=1, b=0, c=0, d=0 -> out should be 1
        a = 1; b = 0; c = 0; d = 0;
        #10;
        if (out !== 1) $display("FAIL: Test case 1 failed, expected out=1, got out=%b", out);

        // Test case 2: a=0, b=0, c=1, d=0 -> out should be 1
        a = 0; b = 0; c = 1; d = 0;
        #10;
        if (out !== 1) $display("FAIL: Test case 2 failed, expected out=1, got out=%b", out);

        // Test case 3: a=0, b=1, c=1, d=0 -> out should be 0
        a = 0; b = 1; c = 1; d = 0;
        #10;
        if (out !== 0) $display("FAIL: Test case 3 failed, expected out=0, got out=%b", out);

        // Test case 4: a=0, b=0, c=0, d=0 -> out should be 0
        a = 0; b = 0; c = 0; d = 0;
        #10;
        if (out !== 0) $display("FAIL: Test case 4 failed, expected out=0, got out=%b", out);

        // Test case 5: a=0, b=1, c=0, d=0 -> out should be 0
        a = 0; b = 1; c = 0; d = 0;
        #10;
        if (out !== 0) $display("FAIL: Test case 5 failed, expected out=0, got out=%b", out);

        // Test case 6: a=1, b=1, c=0, d=0 -> out should be 1
        a = 1; b = 1; c = 0; d = 0;
        #10;
        if (out !== 1) $display("FAIL: Test case 6 failed, expected out=1, got out=%b", out);

        // Test case 7: a=0, b=0, c=1, d=1 -> out should be 1
        a = 0; b = 0; c = 1; d = 1;
        #10;
        if (out !== 1) $display("FAIL: Test case 7 failed, expected out=1, got out=%b", out);

        // Test case 8: a=1, b=0, c=1, d=1 -> out should be 1
        a = 1; b = 0; c = 1; d = 1;
        #10;
        if (out !== 1) $display("FAIL: Test case 8 failed, expected out=1, got out=%b", out);

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule