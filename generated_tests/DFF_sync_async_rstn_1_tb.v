`timescale 1ns/1ps

module tb_DFF_sync_async_rstn;

    reg clk;
    reg async_rstn;
    reg sync_rstn;
    reg d;
    wire q;

    // Instantiate the DFF_sync_async_rstn module
    DFF_sync_async_rstn uut (
        .clk(clk),
        .async_rstn(async_rstn),
        .sync_rstn(sync_rstn),
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
        async_rstn = 1;
        sync_rstn = 0;
        d = 0;

        // Wait for a clock cycle
        #10;

        // Test 1: Asynchronous reset
        async_rstn = 0; // Release async reset
        #10;
        if (q !== 0) begin
            $display("FAIL: Async reset failed");
            $finish;
        end

        // Test 2: Synchronous reset
        sync_rstn = 1; // Assert sync reset
        #10;
        if (q !== 0) begin
            $display("FAIL: Sync reset failed");
            $finish;
        end
        sync_rstn = 0; // Release sync reset
        #10;

        // Test 3: Capture d value
        d = 1; // Set d to 1
        #10;
        if (q !== 1) begin
            $display("FAIL: D value not captured correctly");
            $finish;
        end

        // Test 4: Change d value
        d = 0; // Change d to 0
        #10;
        if (q !== 0) begin
            $display("FAIL: D value not captured correctly after change");
            $finish;
        end

        // Test 5: Check behavior with sync reset after capturing d
        sync_rstn = 1; // Assert sync reset
        #10;
        if (q !== 0) begin
            $display("FAIL: Sync reset failed after capturing d");
            $finish;
        end

        // Test 6: Check behavior with async reset after capturing d
        async_rstn = 1; // Assert async reset
        #10;
        if (q !== 0) begin
            $display("FAIL: Async reset failed after capturing d");
            $finish;
        end

        // Final check
        $display("PASS");
        $finish;
    end

endmodule