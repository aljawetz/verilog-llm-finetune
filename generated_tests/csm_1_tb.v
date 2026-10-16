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
        a = 0; b = 0; bi = 0; os = 0; #10;
        if (d !== 0 || bo !== 0) $display("FAIL: Test case 1 failed");

        // Test case 2: Basic subtraction without borrow
        a = 0; b = 1; bi = 0; os = 0; #10;
        if (d !== 1 || bo !== 1) $display("FAIL: Test case 2 failed");

        // Test case 3: Basic subtraction with borrow
        a = 1; b = 0; bi = 1; os = 0; #10;
        if (d !== 0 || bo !== 0) $display("FAIL: Test case 3 failed");

        // Test case 4: Output select high
        a = 1; b = 1; bi = 0; os = 1; #10;
        if (d !== 1 || bo !== 0) $display("FAIL: Test case 4 failed");

        // Test case 5: Borrow in with output select high
        a = 0; b = 1; bi = 1; os = 1; #10;
        if (d !== 0 || bo !== 1) $display("FAIL: Test case 5 failed");

        // Test case 6: All inputs high
        a = 1; b = 1; bi = 1; os = 0; #10;
        if (d !== 1 || bo !== 1) $display("FAIL: Test case 6 failed");

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule