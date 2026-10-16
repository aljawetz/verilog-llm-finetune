`timescale 1ns/1ps

module tb_opt_check;

    reg a;
    reg b;
    wire y;

    // Instantiate the module under test
    opt_check uut (
        .a(a),
        .b(b),
        .y(y)
    );

    initial begin
        // Test sequence
        // Test case 1: a = 0, b = 0 -> y should be 0
        a = 0; b = 0; #10;
        if (y !== 0) begin
            $display("FAIL: Test case 1 failed, expected y = 0, got y = %b", y);
            $finish;
        end

        // Test case 2: a = 0, b = 1 -> y should be 0
        a = 0; b = 1; #10;
        if (y !== 0) begin
            $display("FAIL: Test case 2 failed, expected y = 0, got y = %b", y);
            $finish;
        end

        // Test case 3: a = 1, b = 0 -> y should be 0
        a = 1; b = 0; #10;
        if (y !== 0) begin
            $display("FAIL: Test case 3 failed, expected y = 0, got y = %b", y);
            $finish;
        end

        // Test case 4: a = 1, b = 1 -> y should be 1
        a = 1; b = 1; #10;
        if (y !== 1) begin
            $display("FAIL: Test case 4 failed, expected y = 1, got y = %b", y);
            $finish;
        end

        // All tests passed
        $display("PASS");
        $finish;
    end

endmodule