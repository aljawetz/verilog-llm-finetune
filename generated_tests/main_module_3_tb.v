`timescale 1ns/1ps

module tb_main_module;

    reg clk;
    reg reset;
    reg t;
    wire q;

    // Instantiate the module under test (uut)
    main_module uut (
        .clk(clk),
        .reset(reset),
        .t(t),
        .q(q)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize signals
        reset = 1;
        t = 0;
        #10; // Wait for 10ns

        // Release reset
        reset = 0;
        #10;

        // Test case 1: T = 0, Q should remain unchanged
        t = 0;
        #10; // Wait for one clock cycle
        if (q !== 0) begin
            $display("FAIL: Q should be 0 when T is 0");
            $finish;
        end

        // Test case 2: T = 1, Q should toggle
        t = 1;
        #10; // Wait for one clock cycle
        if (q !== 1) begin
            $display("FAIL: Q should be 1 when T is 1 and Q was 0");
            $finish;
        end

        #10; // Wait for one clock cycle
        if (q !== 0) begin
            $display("FAIL: Q should be 0 after toggling");
            $finish;
        end

        // Test case 3: Assert reset
        reset = 1;
        #10; // Wait for reset to take effect
        if (q !== 0) begin
            $display("FAIL: Q should be 0 after reset");
            $finish;
        end

        // Test case 4: Release reset and toggle again
        reset = 0;
        t = 1;
        #10; // Wait for one clock cycle
        if (q !== 1) begin
            $display("FAIL: Q should be 1 after toggling with T = 1");
            $finish;
        end

        #10; // Wait for one clock cycle
        if (q !== 0) begin
            $display("FAIL: Q should be 0 after toggling again");
            $finish;
        end

        // Final case: Test with T = 0 again
        t = 0;
        #10; // Wait for one clock cycle
        if (q !== 0) begin
            $display("FAIL: Q should remain 0 when T is 0");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule