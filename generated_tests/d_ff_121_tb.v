`timescale 1ns/1ps

module tb_d_ff;

    reg d;
    reg clk;
    reg reset;
    wire q;

    // Instantiate the D flip-flop
    d_ff uut (
        .d(d),
        .clk(clk),
        .reset(reset),
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
        d = 0;
        reset = 1; // Start with reset active
        #10; // Wait for 10ns

        // Deactivate reset
        reset = 0;
        #10;

        // Test 1: Check output after reset
        if (q !== 0) begin
            $display("FAIL: Output should be 0 after reset");
            $finish;
        end

        // Test 2: Set d to 1 and check output
        d = 1;
        #10; // Wait for one clock cycle
        if (q !== 1) begin
            $display("FAIL: Output should be 1 when d is 1");
            $finish;
        end

        // Test 3: Set d to 0 and check output
        d = 0;
        #10; // Wait for one clock cycle
        if (q !== 0) begin
            $display("FAIL: Output should be 0 when d is 0");
            $finish;
        end

        // Test 4: Check reset functionality
        reset = 1; // Activate reset
        #10; // Wait for one clock cycle
        if (q !== 0) begin
            $display("FAIL: Output should be 0 after reset is activated");
            $finish;
        end

        // Test 5: Check output after reset deactivation
        reset = 0;
        d = 1;
        #10; // Wait for one clock cycle
        if (q !== 1) begin
            $display("FAIL: Output should be 1 when d is 1 after reset");
            $finish;
        end

        // All tests passed
        $display("PASS");
        $finish;
    end

endmodule