`timescale 1ns/1ps

module tb_sync_r2w;

    parameter ADDRSIZE = 4;
    reg [ADDRSIZE:0] rptr;
    reg wclk;
    reg wrst_n;
    wire [ADDRSIZE:0] wq2_rptr;

    // Instantiate the module under test (uut)
    sync_r2w #(ADDRSIZE) uut (
        .wq2_rptr(wq2_rptr),
        .rptr(rptr),
        .wclk(wclk),
        .wrst_n(wrst_n)
    );

    // Clock generation
    initial begin
        wclk = 0;
        forever #5 wclk = ~wclk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize signals
        wrst_n = 0; // Assert reset
        rptr = 5'b00000; // Initial read pointer

        // Release reset
        #10;
        wrst_n = 1;

        // Test case 1: Check initial state after reset
        #10;
        if (wq2_rptr !== 5'b00000) begin
            $display("FAIL: Initial state after reset is incorrect");
            $finish;
        end

        // Test case 2: Drive rptr and check synchronization
        rptr = 5'b00001; // Change rptr
        #10; // Wait for two clock cycles
        if (wq2_rptr !== 5'b00000) begin
            $display("FAIL: wq2_rptr should be 00000 after first clock cycle");
            $finish;
        end

        #10; // Wait for another clock cycle
        if (wq2_rptr !== 5'b00001) begin
            $display("FAIL: wq2_rptr should be 00001 after second clock cycle");
            $finish;
        end

        // Test case 3: Change rptr again
        rptr = 5'b00010; // Change rptr
        #10; // Wait for two clock cycles
        if (wq2_rptr !== 5'b00001) begin
            $display("FAIL: wq2_rptr should be 00001 after first clock cycle with new rptr");
            $finish;
        end

        #10; // Wait for another clock cycle
        if (wq2_rptr !== 5'b00010) begin
            $display("FAIL: wq2_rptr should be 00010 after second clock cycle with new rptr");
            $finish;
        end

        // Test case 4: Assert reset again
        #10;
        wrst_n = 0; // Assert reset
        #10;
        if (wq2_rptr !== 5'b00000) begin
            $display("FAIL: wq2_rptr should be 00000 after reset");
            $finish;
        end

        // End of test
        $display("PASS");
        $finish;
    end

endmodule