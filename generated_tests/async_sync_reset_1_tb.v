`timescale 1ns/1ps

module tb_async_sync_reset;

reg in;
reg clk;
reg rst;
wire async;
wire sync;

// Instantiate the module under test (uut)
async_sync_reset uut (
    .in(in),
    .clk(clk),
    .rst(rst),
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
    in = 0;
    rst = 0;

    // Test 1: Reset the module
    rst = 1; // Assert reset
    #10; // Wait for a clock edge
    if (async !== 1'b0 || sync !== 1'b0) begin
        $display("FAIL: Reset did not set outputs to 0");
        $finish;
    end

    // Deassert reset
    rst = 0;
    #10; // Wait for a clock edge

    // Test 2: Check sync output
    in = 1; // Set input
    #10; // Wait for a clock edge
    if (sync !== 1'b1) begin
        $display("FAIL: Sync output did not match input");
        $finish;
    end

    // Test 3: Check async output
    #10; // Wait for a clock edge
    if (async !== 1'b1) begin
        $display("FAIL: Async output did not match input");
        $finish;
    end

    // Test 4: Change input and check outputs
    in = 0; // Change input
    #10; // Wait for a clock edge
    if (sync !== 1'b0) begin
        $display("FAIL: Sync output did not match input after change");
        $finish;
    end
    #10; // Wait for a clock edge
    if (async !== 1'b0) begin
        $display("FAIL: Async output did not match input after change");
        $finish;
    end

    // Test 5: Assert reset again
    rst = 1; // Assert reset
    #10; // Wait for a clock edge
    if (async !== 1'b0 || sync !== 1'b0) begin
        $display("FAIL: Reset did not set outputs to 0 again");
        $finish;
    end

    // End of tests
    $display("PASS");
    $finish;
end

endmodule