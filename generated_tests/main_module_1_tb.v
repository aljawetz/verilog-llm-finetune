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
        #10; // Wait for 10ns

        // Test case 1: Check reset functionality
        if (q !== 0) begin
            $display("FAIL: q should be 0 after reset");
            $finish;
        end

        // Test case 2: Toggle q when t is high
        t = 1; // Enable toggling
        #10; // Wait for 10ns
        if (q !== 1) begin
            $display("FAIL: q should be 1 after toggling");
            $finish;
        end

        #10; // Wait for 10ns
        if (q !== 0) begin
            $display("FAIL: q should be 0 after toggling again");
            $finish;
        end

        // Test case 3: Check that q remains unchanged when t is low
        t = 0; // Disable toggling
        #10; // Wait for 10ns
        if (q !== 0) begin
            $display("FAIL: q should remain 0 when t is low");
            $finish;
        end

        // Test case 4: Check reset functionality again
        reset = 1; // Assert reset
        #10; // Wait for 10ns
        reset = 0; // Release reset
        #10; // Wait for 10ns
        if (q !== 0) begin
            $display("FAIL: q should be 0 after reset again");
            $finish;
        end

        // Test case 5: Toggle q again
        t = 1; // Enable toggling
        #10; // Wait for 10ns
        if (q !== 1) begin
            $display("FAIL: q should be 1 after toggling again");
            $finish;
        end

        #10; // Wait for 10ns
        if (q !== 0) begin
            $display("FAIL: q should be 0 after toggling again");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule