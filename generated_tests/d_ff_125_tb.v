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
        // Initialize inputs
        d = 0;
        reset = 0;

        // Test 1: Reset the flip-flop
        reset = 1; // Assert reset
        #10; // Wait for one clock cycle
        if (q !== 0) begin
            $display("FAIL: Reset did not set q to 0");
            $finish;
        end

        // Test 2: Set d and clock
        reset = 0; // Deassert reset
        d = 1; // Set d to 1
        #10; // Wait for one clock cycle
        if (q !== 1) begin
            $display("FAIL: q did not update to d when reset is low");
            $finish;
        end

        // Test 3: Change d and clock again
        d = 0; // Change d to 0
        #10; // Wait for one clock cycle
        if (q !== 0) begin
            $display("FAIL: q did not update to d when reset is low");
            $finish;
        end

        // Test 4: Assert reset again
        reset = 1; // Assert reset
        #10; // Wait for one clock cycle
        if (q !== 0) begin
            $display("FAIL: Reset did not set q to 0");
            $finish;
        end

        // Test 5: Deassert reset and set d to 1
        reset = 0; // Deassert reset
        d = 1; // Set d to 1
        #10; // Wait for one clock cycle
        if (q !== 1) begin
            $display("FAIL: q did not update to d when reset is low");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule