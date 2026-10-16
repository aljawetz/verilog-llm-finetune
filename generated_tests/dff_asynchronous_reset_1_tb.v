`timescale 1ns/1ps

module tb_dff_asynchronous_reset;

    reg resetn;
    reg clk;
    reg d_in;
    wire q;
    wire qbar;

    // Instantiate the module under test (uut)
    dff_asynchronous_reset uut (
        .resetn(resetn),
        .clk(clk),
        .d_in(d_in),
        .q(q),
        .qbar(qbar)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize
        resetn = 1;
        d_in = 0;

        // Test 1: Check reset functionality
        resetn = 0; // Assert reset
        #10; // Wait for a clock cycle
        if (q !== 0) begin
            $display("FAIL: Reset did not set q to 0");
            $finish;
        end

        // Release reset
        resetn = 1;
        #10;

        // Test 2: Check D flip-flop functionality
        d_in = 1; // Set D input
        #10; // Wait for a clock cycle
        if (q !== 1) begin
            $display("FAIL: q did not update to 1");
            $finish;
        end

        // Test 3: Check complement output
        if (qbar !== 0) begin
            $display("FAIL: qbar did not match complement of q");
            $finish;
        end

        // Test 4: Change D input and check output
        d_in = 0; // Change D input
        #10; // Wait for a clock cycle
        if (q !== 0) begin
            $display("FAIL: q did not update to 0");
            $finish;
        end

        // Test 5: Check reset again
        resetn = 0; // Assert reset
        #10; // Wait for a clock cycle
        if (q !== 0) begin
            $display("FAIL: Reset did not set q to 0 again");
            $finish;
        end

        // Test 6: Final state check
        resetn = 1; // Release reset
        d_in = 1; // Set D input
        #10; // Wait for a clock cycle
        if (q !== 1) begin
            $display("FAIL: Final check failed, q should be 1");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule