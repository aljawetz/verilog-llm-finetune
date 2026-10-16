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
        // Test Case 1: 0 + 0 with carryin = 0, mode = 0
        in1 = 0; in2 = 0; carryin = 0; mode = 0;
        #10;
        if (sum_diff !== 0 || carry_borr !== 0) begin
            $display("FAIL: Test Case 1 failed");
            $finish;
        end

        // Test Case 2: 0 + 1 with carryin = 0, mode = 0
        in1 = 0; in2 = 1; carryin = 0; mode = 0;
        #10;
        if (sum_diff !== 1 || carry_borr !== 0) begin
            $display("FAIL: Test Case 2 failed");
            $finish;
        end

        // Test Case 3: 1 + 1 with carryin = 0, mode = 0
        in1 = 1; in2 = 1; carryin = 0; mode = 0;
        #10;
        if (sum_diff !== 0 || carry_borr !== 1) begin
            $display("FAIL: Test Case 3 failed");
            $finish;
        end

        // Test Case 4: 1 + 0 with carryin = 0, mode = 0
        in1 = 1; in2 = 0; carryin = 0; mode = 0;
        #10;
        if (sum_diff !== 1 || carry_borr !== 0) begin
            $display("FAIL: Test Case 4 failed");
            $finish;
        end

        // Test Case 5: 0 - 1 with carryin = 0, mode = 1 (subtract)
        in1 = 0; in2 = 1; carryin = 0; mode = 1;
        #10;
        if (sum_diff !== 1 || carry_borr !== 1) begin
            $display("FAIL: Test Case 5 failed");
            $finish;
        end

        // Test Case 6: 1 - 0 with carryin = 0, mode = 1 (subtract)
        in1 = 1; in2 = 0; carryin = 0; mode = 1;
        #10;
        if (sum_diff !== 1 || carry_borr !== 0) begin
            $display("FAIL: Test Case 6 failed");
            $finish;
        end

        // Test Case 7: 1 - 1 with carryin = 0, mode = 1 (subtract)
        in1 = 1; in2 = 1; carryin = 0; mode = 1;
        #10;
        if (sum_diff !== 0 || carry_borr !== 0) begin
            $display("FAIL: Test Case 7 failed");
            $finish;
        end

        // Test Case 8: 0 - 0 with carryin = 1, mode = 1 (subtract)
        in1 = 0; in2 = 0; carryin = 1; mode = 1;
        #10;
        if (sum_diff !== 1 || carry_borr !== 1) begin
            $display("FAIL: Test Case 8 failed");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule