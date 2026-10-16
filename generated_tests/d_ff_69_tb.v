`timescale 1ns/1ps

module tb_d_ff;

reg d;
reg clk;
reg rst;
wire q;

// Instantiate the D Flip-Flop
d_ff uut (
    .d(d),
    .clk(clk),
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
    // Test 1: Reset the D Flip-Flop
    rst = 1; // Assert reset
    #10; // Wait for one clock cycle
    if (q !== 1'b0) begin
        $display("FAIL: Reset did not set q to 0");
        $finish;
    end

    // Test 2: Check D input propagation
    rst = 0; // Deassert reset
    d = 1; // Set D to 1
    #10; // Wait for one clock cycle
    if (q !== 1'b1) begin
        $display("FAIL: q did not follow D input (expected 1)");
        $finish;
    end

    // Test 3: Change D input
    d = 0; // Set D to 0
    #10; // Wait for one clock cycle
    if (q !== 1'b0) begin
        $display("FAIL: q did not follow D input (expected 0)");
        $finish;
    end

    // Test 4: Check reset functionality again
    rst = 1; // Assert reset
    #10; // Wait for one clock cycle
    if (q !== 1'b0) begin
        $display("FAIL: Reset did not set q to 0");
        $finish;
    end

    // Test 5: Check D input propagation after reset
    rst = 0; // Deassert reset
    d = 1; // Set D to 1
    #10; // Wait for one clock cycle
    if (q !== 1'b1) begin
        $display("FAIL: q did not follow D input (expected 1)");
        $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule