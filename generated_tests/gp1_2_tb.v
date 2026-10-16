`timescale 1ns/1ps

module tb_gp1;
    reg a;
    reg b;
    wire g;
    wire p;

    // Instantiate the module under test (uut)
    gp1 uut (
        .a(a),
        .b(b),
        .g(g),
        .p(p)
    );

    initial begin
        // Test sequence
        // Test case 1: a = 0, b = 0
        a = 0; b = 0; #10;
        if (g !== 0 || p !== 0) begin
            $display("FAIL: Test case 1 failed (a=0, b=0)");
            $finish;
        end

        // Test case 2: a = 0, b = 1
        a = 0; b = 1; #10;
        if (g !== 0 || p !== 1) begin
            $display("FAIL: Test case 2 failed (a=0, b=1)");
            $finish;
        end

        // Test case 3: a = 1, b = 0
        a = 1; b = 0; #10;
        if (g !== 0 || p !== 1) begin
            $display("FAIL: Test case 3 failed (a=1, b=0)");
            $finish;
        end

        // Test case 4: a = 1, b = 1
        a = 1; b = 1; #10;
        if (g !== 1 || p !== 0) begin
            $display("FAIL: Test case 4 failed (a=1, b=1)");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end
endmodule