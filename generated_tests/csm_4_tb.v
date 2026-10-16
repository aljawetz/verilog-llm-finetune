`timescale 1ns/1ps

module tb_csm;

    // Inputs
    reg a;
    reg b;
    reg bi;
    reg os;

    // Outputs
    wire d;
    wire bo;

    // Instantiate the Unit Under Test (UUT)
    csm uut (
        .a(a),
        .b(b),
        .bi(bi),
        .os(os),
        .d(d),
        .bo(bo)
    );

    initial begin
        // Test case 1: a = 0, b = 0, bi = 0, os = 0
        a = 0; b = 0; bi = 0; os = 0;
        #10;
        if (d !== 0 || bo !== 0) $display("FAIL: Test case 1 failed");

        // Test case 2: a = 0, b = 1, bi = 0, os = 0
        a = 0; b = 1; bi = 0; os = 0;
        #10;
        if (d !== 0 || bo !== 1) $display("FAIL: Test case 2 failed");

        // Test case 3: a = 1, b = 0, bi = 0, os = 0
        a = 1; b = 0; bi = 0; os = 0;
        #10;
        if (d !== 1 || bo !== 0) $display("FAIL: Test case 3 failed");

        // Test case 4: a = 1, b = 1, bi = 0, os = 0
        a = 1; b = 1; bi = 0; os = 0;
        #10;
        if (d !== 0 || bo !== 0) $display("FAIL: Test case 4 failed");

        // Test case 5: a = 0, b = 0, bi = 1, os = 0
        a = 0; b = 0; bi = 1; os = 0;
        #10;
        if (d !== 1 || bo !== 0) $display("FAIL: Test case 5 failed");

        // Test case 6: a = 0, b = 1, bi = 1, os = 0
        a = 0; b = 1; bi = 1; os = 0;
        #10;
        if (d !== 1 || bo !== 1) $display("FAIL: Test case 6 failed");

        // Test case 7: a = 1, b = 0, bi = 1, os = 0
        a = 1; b = 0; bi = 1; os = 0;
        #10;
        if (d !== 0 || bo !== 0) $display("FAIL: Test case 7 failed");

        // Test case 8: a = 1, b = 1, bi = 1, os = 0
        a = 1; b = 1; bi = 1; os = 0;
        #10;
        if (d !== 1 || bo !== 1) $display("FAIL: Test case 8 failed");

        // Test case 9: a = 0, b = 0, bi = 0, os = 1
        a = 0; b = 0; bi = 0; os = 1;
        #10;
        if (d !== 0 || bo !== 0) $display("FAIL: Test case 9 failed");

        // Test case 10: a = 1, b = 0, bi = 0, os = 1
        a = 1; b = 0; bi = 0; os = 1;
        #10;
        if (d !== 1 || bo !== 0) $display("FAIL: Test case 10 failed");

        // Test case 11: a = 0, b = 1, bi = 0, os = 1
        a = 0; b = 1; bi = 0; os = 1;
        #10;
        if (d !== 0 || bo !== 1) $display("FAIL: Test case 11 failed");

        // Test case 12: a = 1, b = 1, bi = 0, os = 1
        a = 1; b = 1; bi = 0; os = 1;
        #10;
        if (d !== 1 || bo !== 0) $display("FAIL: Test case 12 failed");

        // Test case 13: a = 0, b = 0, bi = 1, os = 1
        a = 0; b = 0; bi = 1; os = 1;
        #10;
        if (d !== 1 || bo !== 0) $display("FAIL: Test case 13 failed");

        // Test case 14: a = 1, b = 0, bi = 1, os = 1
        a = 1; b = 0; bi = 1; os = 1;
        #10;
        if (d !== 0 || bo !== 0) $display("FAIL: Test case 14 failed");

        // Test case 15: a = 0, b = 1, bi = 1, os = 1
        a = 0; b = 1; bi = 1; os = 1;
        #10;
        if (d !== 1 || bo !== 1) $display("FAIL: Test case 15 failed");

        // Test case 16: a = 1, b = 1, bi = 1, os = 1
        a = 1; b = 1; bi = 1; os = 1;
        #10;
        if (d !== 0 || bo !== 1) $display("FAIL: Test case 16 failed");

        $display("PASS");
        $finish;
    end

endmodule