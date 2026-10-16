`timescale 1ns/1ps

module tb_d_ff;

reg din;
reg clk;
reg rst;
wire q;

// Instantiate the D flip-flop
d_ff uut (
    .q(q),
    .din(din),
    .clk(clk),
    .rst(rst)
);

// Clock generation
initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
end

// Test sequence
initial begin
    // Initialize signals
    din = 0;
    rst = 0;

    // Test 1: Check reset functionality
    rst = 1; // Activate reset
    #10; // Wait for one clock cycle
    if (q !== 0) begin
        $display("FAIL: Reset did not set q to 0");
        $finish;
    end

    // Test 2: Check data capture
    rst = 0; // Deactivate reset
    din = 1; // Set input data
    #10; // Wait for one clock cycle
    if (q !== 1) begin
        $display("FAIL: q did not capture din when rst is low");
        $finish;
    end

    // Test 3: Check data capture with different input
    din = 0; // Change input data
    #10; // Wait for one clock cycle
    if (q !== 0) begin
        $display("FAIL: q did not capture new din value");
        $finish;
    end

    // Test 4: Check reset functionality again
    rst = 1; // Activate reset
    #10; // Wait for one clock cycle
    if (q !== 0) begin
        $display("FAIL: Reset did not set q to 0 on second check");
        $finish;
    end

    // Test 5: Check data capture after reset
    rst = 0; // Deactivate reset
    din = 1; // Set input data
    #10; // Wait for one clock cycle
    if (q !== 1) begin
        $display("FAIL: q did not capture din after reset");
        $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule