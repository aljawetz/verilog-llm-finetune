`timescale 1ns/1ps

module tb_fulladder_subtractor;

    reg a, b, c, ctrl;
    wire sum, carry, diff, borrow;

    // Instantiate the module under test (uut)
    fulladder_subtractor uut (
        .a(a),
        .b(b),
        .c(c),
        .ctrl(ctrl),
        .sum(sum),
        .carry(carry),
        .diff(diff),
        .borrow(borrow)
    );

    initial begin
        // Test case 1: Full Adder (ctrl = 0)
        a = 0; b = 0; c = 0; ctrl = 0; #10;
        if (sum !== 0 || carry !== 0) $display("FAIL: Test case 1 failed");

        a = 0; b = 0; c = 1; ctrl = 0; #10;
        if (sum !== 1 || carry !== 0) $display("FAIL: Test case 2 failed");

        a = 0; b = 1; c = 0; ctrl = 0; #10;
        if (sum !== 1 || carry !== 0) $display("FAIL: Test case 3 failed");

        a = 0; b = 1; c = 1; ctrl = 0; #10;
        if (sum !== 0 || carry !== 1) $display("FAIL: Test case 4 failed");

        a = 1; b = 0; c = 0; ctrl = 0; #10;
        if (sum !== 1 || carry !== 0) $display("FAIL: Test case 5 failed");

        a = 1; b = 0; c = 1; ctrl = 0; #10;
        if (sum !== 0 || carry !== 1) $display("FAIL: Test case 6 failed");

        a = 1; b = 1; c = 0; ctrl = 0; #10;
        if (sum !== 0 || carry !== 1) $display("FAIL: Test case 7 failed");

        a = 1; b = 1; c = 1; ctrl = 0; #10;
        if (sum !== 1 || carry !== 1) $display("FAIL: Test case 8 failed");

        // Test case 2: Full Subtractor (ctrl = 1)
        a = 0; b = 0; c = 0; ctrl = 1; #10;
        if (diff !== 0 || borrow !== 0) $display("FAIL: Test case 9 failed");

        a = 0; b = 0; c = 1; ctrl = 1; #10;
        if (diff !== 1 || borrow !== 1) $display("FAIL: Test case 10 failed");

        a = 0; b = 1; c = 0; ctrl = 1; #10;
        if (diff !== 1 || borrow !== 1) $display("FAIL: Test case 11 failed");

        a = 0; b = 1; c = 1; ctrl = 1; #10;
        if (diff !== 0 || borrow !== 0) $display("FAIL: Test case 12 failed");

        a = 1; b = 0; c = 0; ctrl = 1; #10;
        if (diff !== 1 || borrow !== 0) $display("FAIL: Test case 13 failed");

        a = 1; b = 0; c = 1; ctrl = 1; #10;
        if (diff !== 0 || borrow !== 0) $display("FAIL: Test case 14 failed");

        a = 1; b = 1; c = 0; ctrl = 1; #10;
        if (diff !== 0 || borrow !== 1) $display("FAIL: Test case 15 failed");

        a = 1; b = 1; c = 1; ctrl = 1; #10;
        if (diff !== 1 || borrow !== 0) $display("FAIL: Test case 16 failed");

        $display("PASS");
        $finish;
    end

endmodule