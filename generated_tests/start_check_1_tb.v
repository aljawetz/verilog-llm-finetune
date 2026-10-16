`timescale 1ns/1ps

module tb_start_check;

    reg start_check_enable;
    reg sampled_data;
    wire start_err;

    // Instantiate the module under test (uut)
    start_check uut (
        .start_check_enable(start_check_enable),
        .sampled_data(sampled_data),
        .start_err(start_err)
    );

    initial begin
        // Test case 1: Check when enabled and sampled_data matches START_BIT
        start_check_enable = 1;
        sampled_data = 0; // START_BIT is 0 by default
        #10;
        if (start_err !== 0) begin
            $display("FAIL: Test case 1 failed, expected start_err = 0");
            $finish;
        end

        // Test case 2: Check when enabled and sampled_data does not match START_BIT
        sampled_data = 1; // Different from START_BIT
        #10;
        if (start_err !== 1) begin
            $display("FAIL: Test case 2 failed, expected start_err = 1");
            $finish;
        end

        // Test case 3: Check when disabled
        start_check_enable = 0;
        #10;
        if (start_err !== 1) begin
            $display("FAIL: Test case 3 failed, expected start_err = 1");
            $finish;
        end

        // Test case 4: Check when disabled with different sampled_data
        sampled_data = 0; // Any value should still result in start_err = 1
        #10;
        if (start_err !== 1) begin
            $display("FAIL: Test case 4 failed, expected start_err = 1");
            $finish;
        end

        // All tests passed
        $display("PASS");
        $finish;
    end

endmodule