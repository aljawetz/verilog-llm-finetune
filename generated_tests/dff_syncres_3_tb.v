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
        // Initialize signals
        async_reset = 0;
        sync_reset = 0;
        d = 0;

        // Test 1: Check reset behavior
        async_reset = 1; // Activate async reset
        #10;
        async_reset = 0; // Deactivate async reset
        #10;

        // Test 2: Check synchronous reset
        sync_reset = 1; // Activate sync reset
        #10;
        if (uut.q !== 1'b0) begin
            $display("FAIL: Synchronous reset did not set q to 0");
            $finish;
        end
        sync_reset = 0; // Deactivate sync reset
        #10;

        // Test 3: Check D flip-flop behavior
        d = 1; // Set D to 1
        #10;
        if (uut.q !== 1'b1) begin
            $display("FAIL: q did not follow d when sync_reset is not active");
            $finish;
        end

        // Test 4: Check D flip-flop behavior with sync reset
        d = 0; // Set D to 0
        #10;
        if (uut.q !== 1'b0) begin
            $display("FAIL: q did not follow d when sync_reset is not active");
            $finish;
        end

        // Test 5: Check behavior after sync reset
        sync_reset = 1; // Activate sync reset
        #10;
        if (uut.q !== 1'b0) begin
            $display("FAIL: q did not reset to 0 after sync reset");
            $finish;
        end
        sync_reset = 0; // Deactivate sync reset
        #10;

        // Final check
        d = 1; // Set D to 1
        #10;
        if (uut.q !== 1'b1) begin
            $display("FAIL: q did not follow d after sync reset");
            $finish;
        end

        $display("PASS");
        $finish;
    end

endmodule