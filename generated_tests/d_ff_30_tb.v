`timescale 1ns/1ps

module tb_d_ff;

reg clk;
reg d;
reg rst;
wire q;

// Instantiate the D flip-flop
d_ff uut (
    .clk(clk),
    .d(d),
    .rst(rst),
    .q(q)
);

// Clock generation
always begin
    #5 clk = ~clk; // 10ns clock period
end

initial begin
    // Initialize signals
    clk = 0;
    rst = 0;
    d = 0;

    // Test sequence
    // Test 1: Reset functionality
    rst = 1; // Assert reset
    #10; // Wait for a clock edge
    if (q !== 1'b0) begin
        $display("FAIL: Reset did not set q to 0");
        $finish;
    end

    // Test 2: Check D input propagation
    rst = 0; // Deassert reset
    d = 1; // Set D to 1
    #10; // Wait for a clock edge
    if (q !== 1'b1) begin
        $display("FAIL: q did not update to D value (expected 1)");
        $finish;
    end

    // Test 3: Check D input propagation with 0
    d = 0; // Set D to 0
    #10; // Wait for a clock edge
    if (q !== 1'b0) begin
        $display("FAIL: q did not update to D value (expected 0)");
        $finish;
    end

    // Test 4: Check reset during operation
    d = 1; // Set D to 1
    #10; // Wait for a clock edge
    rst = 1; // Assert reset
    #10; // Wait for a clock edge
    if (q !== 1'b0) begin
        $display("FAIL: Reset did not set q to 0 during operation");
        $finish;
    end

    // Test 5: Check D input after reset
    rst = 0; // Deassert reset
    d = 1; // Set D to 1
    #10; // Wait for a clock edge
    if (q !== 1'b1) begin
        $display("FAIL: q did not update to D value after reset (expected 1)");
        $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule