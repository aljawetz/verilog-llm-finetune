`timescale 1ns/1ps

module tb_sync_async_reset;

    reg clk;
    reg rst;
    reg a;
    wire sync;
    wire async;

    // Instantiate the module under test (uut)
    sync_async_reset uut (
        .sync(sync),
        .async(async),
        .clk(clk),
        .rst(rst),
        .a(a)
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
        a = 0;
        #10; // Wait for 10ns

        // Test asynchronous reset
        if (sync !== 1'b0 || async !== 1'b0) begin
            $display("FAIL: Initial state after reset is incorrect");
            $finish;
        end

        // Release reset
        rst = 0;
        #10; // Wait for 10ns

        // Test synchronous behavior
        a = 1;
        #10; // Wait for 10ns
        if (sync !== 1'b1 || async !== 1'b1) begin
            $display("FAIL: Output incorrect after setting a to 1");
            $finish;
        end

        // Test reset again
        rst = 1;
        #10; // Wait for 10ns
        if (sync !== 1'b0 || async !== 1'b0) begin
            $display("FAIL: Output incorrect after reset");
            $finish;
        end

        // Test with a = 0
        rst = 0;
        a = 0;
        #10; // Wait for 10ns
        if (sync !== 1'b0 || async !== 1'b0) begin
            $display("FAIL: Output incorrect after setting a to 0");
            $finish;
        end

        // Final check with a = 1
        a = 1;
        #10; // Wait for 10ns
        if (sync !== 1'b1 || async !== 1'b1) begin
            $display("FAIL: Output incorrect after setting a to 1 again");
            $finish;
        end

        // End of tests
        $display("PASS");
        $finish;
    end

endmodule