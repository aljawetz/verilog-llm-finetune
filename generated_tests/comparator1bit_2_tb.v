`timescale 1ns/1ps

module tb_comparator1bit;

    reg a, b;
    wire e, g, l;

    // Instantiate the module under test (uut)
    comparator1bit uut (
        .a(a),
        .b(b),
        .e(e),
        .g(g),
        .l(l)
    );

    initial begin
        // Test case 1: a = 0, b = 0 (equal)
        a = 0; b = 0;
        #10;
        if (e !== 1 || g !== 0 || l !== 0) begin
            $display("FAIL: Test case 1 failed");
            $finish;
        end

        // Test case 2: a = 0, b = 1 (less)
        a = 0; b = 1;
        #10;
        if (e !== 0 || g !== 0 || l !== 1) begin
            $display("FAIL: Test case 2 failed");
            $finish;
        end

        // Test case 3: a = 1, b = 0 (greater)
        a = 1; b = 0;
        #10;
        if (e !== 0 || g !== 1 || l !== 0) begin
            $display("FAIL: Test case 3 failed");
            $finish;
        end

        // Test case 4: a = 1, b = 1 (equal)
        a = 1; b = 1;
        #10;
        if (e !== 1 || g !== 0 || l !== 0) begin
            $display("FAIL: Test case 4 failed");
            $finish;
        end

        // Test case 5: a = 0, b = 0 (equal)
        a = 0; b = 0;
        #10;
        if (e !== 1 || g !== 0 || l !== 0) begin
            $display("FAIL: Test case 5 failed");
            $finish;
        end

        // Test case 6: a = 1, b = 0 (greater)
        a = 1; b = 0;
        #10;
        if (e !== 0 || g !== 1 || l !== 0) begin
            $display("FAIL: Test case 6 failed");
            $finish;
        end

        // Test case 7: a = 0, b = 1 (less)
        a = 0; b = 1;
        #10;
        if (e !== 0 || g !== 0 || l !== 1) begin
            $display("FAIL: Test case 7 failed");
            $finish;
        end

        $display("PASS");
        $finish;
    end

endmodule