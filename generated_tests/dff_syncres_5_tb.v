`timescale 1ns/1ps

module tb_dff_syncres;

    reg clk;
    reg async_reset;
    reg sync_reset;
    reg d;
    wire q;

    // Instantiate the module under test (uut)
    dff_syncres uut (
        .clk(clk),
        .async_reset(async_reset),
        .sync_reset(sync_reset),
        .d(d),
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
        async_reset = 0;
        sync_reset = 0;
        d = 0;

        // Test 1: Check reset functionality
        sync_reset = 1; // Activate sync_reset
        #10; // Wait for one clock cycle
        if (q !== 1'b0) begin
            $display("FAIL: Sync reset did not set q to 0");
            $finish;
        end

        // Test 2: Check capturing of d
        sync_reset = 0; // Deactivate sync_reset
        d = 1; // Set d to 1
        #10; // Wait for one clock cycle
        if (q !== 1'b1) begin
            $display("FAIL: q did not capture d when sync_reset is low");
            $finish;
        end

        // Test 3: Check reset functionality again
        sync_reset = 1; // Activate sync_reset
        #10; // Wait for one clock cycle
        if (q !== 1'b0) begin
            $display("FAIL: Sync reset did not set q to 0 on second check");
            $finish;
        end

        // Test 4: Check capturing of d again
        sync_reset = 0; // Deactivate sync_reset
        d = 0; // Set d to 0
        #10; // Wait for one clock cycle
        if (q !== 1'b0) begin
            $display("FAIL: q did not capture d when sync_reset is low on second check");
            $finish;
        end

        // Test 5: Check capturing of d with different value
        d = 1; // Set d to 1
        #10; // Wait for one clock cycle
        if (q !== 1'b1) begin
            $display("FAIL: q did not capture d when sync_reset is low with different value");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule