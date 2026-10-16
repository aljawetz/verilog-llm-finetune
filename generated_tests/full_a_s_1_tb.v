`timescale 1ns/1ps

module tb_full_a_s;

    reg in1;
    reg in2;
    reg mode;
    reg carryin;
    wire sum_diff;
    wire carry_borr;

    // Instantiate the module under test (uut)
    full_a_s uut (
        .in1(in1),
        .in2(in2),
        .mode(mode),
        .carryin(carryin),
        .sum_diff(sum_diff),
        .carry_borr(carry_borr)
    );

    initial begin
        // Test case 1: Full Adder (mode = 0)
        in1 = 0; in2 = 0; mode = 0; carryin = 0; #10;
        if (sum_diff !== 0 || carry_borr !== 0) $display("FAIL: Test case 1 failed");

        in1 = 0; in2 = 1; mode = 0; carryin = 0; #10;
        if (sum_diff !== 1 || carry_borr !== 0) $display("FAIL: Test case 2 failed");

        in1 = 1; in2 = 0; mode = 0; carryin = 0; #10;
        if (sum_diff !== 1 || carry_borr !== 0) $display("FAIL: Test case 3 failed");

        in1 = 1; in2 = 1; mode = 0; carryin = 0; #10;
        if (sum_diff !== 0 || carry_borr !== 1) $display("FAIL: Test case 4 failed");

        // Test case 2: Full Subtractor (mode = 1)
        in1 = 0; in2 = 0; mode = 1; carryin = 0; #10;
        if (sum_diff !== 0 || carry_borr !== 0) $display("FAIL: Test case 5 failed");

        in1 = 0; in2 = 1; mode = 1; carryin = 0; #10;
        if (sum_diff !== 1 || carry_borr !== 1) $display("FAIL: Test case 6 failed");

        in1 = 1; in2 = 0; mode = 1; carryin = 0; #10;
        if (sum_diff !== 1 || carry_borr !== 0) $display("FAIL: Test case 7 failed");

        in1 = 1; in2 = 1; mode = 1; carryin = 0; #10;
        if (sum_diff !== 0 || carry_borr !== 0) $display("FAIL: Test case 8 failed");

        // Test case 3: Full Adder with carryin
        in1 = 1; in2 = 1; mode = 0; carryin = 1; #10;
        if (sum_diff !== 1 || carry_borr !== 1) $display("FAIL: Test case 9 failed");

        // Test case 4: Full Subtractor with carryin
        in1 = 0; in2 = 1; mode = 1; carryin = 1; #10;
        if (sum_diff !== 0 || carry_borr !== 1) $display("FAIL: Test case 10 failed");

        $display("PASS");
        $finish;
    end

endmodule