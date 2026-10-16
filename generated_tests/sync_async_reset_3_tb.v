`timescale 1ns/1ps

module tb_sync_async_reset;

    reg clk;
    reg rst;
    reg A;
    wire async;
    wire sync;

    // Instantiate the module under test (uut)
    sync_async_reset uut (
        .clk(clk),
        .rst(rst),
        .A(A),
        .async(async),
        .sync(sync)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize inputs
        rst = 1;
        A = 0;
        #10; // Wait for 10ns

        // Test asynchronous reset
        if (async !== 1'b0) begin
            $display("FAIL: async reset failed");
            $finish;
        end

        // Release reset
        rst = 0;
        #10;

        // Test synchronous behavior
        A = 1;
        #10;
        if (sync !== 1'b1) begin
            $display("FAIL: sync output failed to follow A");
            $finish;
        end

        // Change A and check sync output
        A = 0;
        #10;
        if (sync !== 1'b0) begin
            $display("FAIL: sync output failed to follow A after change");
            $finish;
        end

        // Test asynchronous reset again
        rst = 1;
        #10;
        if (async !== 1'b0) begin
            $display("FAIL: async reset failed again");
            $finish;
        end

        // Release reset and check async output
        rst = 0;
        #10;
        A = 1;
        #10;
        if (async !== 1'b1) begin
            $display("FAIL: async output failed to follow A after reset");
            $finish;
        end

        // Final checks
        A = 0;
        #10;
        if (async !== 1'b0) begin
            $display("FAIL: async output failed to follow A after change");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule