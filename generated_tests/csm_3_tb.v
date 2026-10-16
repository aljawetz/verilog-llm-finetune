`timescale 1ns/1ps

module tb_csm;

    reg a;
    reg b;
    reg bi;
    reg os;
    wire d;
    wire bo;

    // Instantiate the module under test (uut)
    csm uut (
        .a(a),
        .b(b),
        .bi(bi),
        .os(os),
        .d(d),
        .bo(bo)
    );

    initial begin
        // Test case 1: Basic subtraction without borrow
        a = 1; b = 0; bi = 0; os = 0; #10;
        if (d !== 1 || bo !== 0) $display("FAIL: Test case 1 failed");

        // Test case 2: Basic subtraction with borrow
        a = 0; b = 1; bi = 0; os = 0; #10;
        if (d !== 1 || bo !== 1) $display("FAIL: Test case 2 failed");

        // Test case 3: Subtraction with borrow in
        a = 0; b = 1; bi = 1; os = 0; #10;
        if (d !== 0 || bo !== 1) $display("FAIL: Test case 3 failed");

        // Test case 4: Multiplexing with os = 1
        a = 1; b = 0; bi = 0; os = 1; #10;
        if (d !== 1 || bo !== 0) $display("FAIL: Test case 4 failed");

        // Test case 5: Check borrow out with os = 1
        a = 0; b = 1; bi = 1; os = 1; #10;
        if (d !== 0 || bo !== 1) $display("FAIL: Test case 5 failed");

        // Test case 6: Edge case with all inputs zero
        a = 0; b = 0; bi = 0; os = 0; #10;
        if (d !== 0 || bo !== 0) $display("FAIL: Test case 6 failed");

        // Test case 7: Edge case with all inputs one
        a = 1; b = 1; bi = 1; os = 0; #10;
        if (d !== 1 || bo !== 1) $display("FAIL: Test case 7 failed");

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule