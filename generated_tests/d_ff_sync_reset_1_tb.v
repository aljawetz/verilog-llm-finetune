`timescale 1ns/1ps

module tb_d_ff_sync_reset;

reg clk;
reg rst_n;
reg d;
wire q;

// Instantiate the module under test (uut)
d_ff_sync_reset uut (
    .clk(clk),
    .rst_n(rst_n),
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
    rst_n = 1;
    d = 0;

    // Test 1: Check reset functionality
    rst_n = 0; // Assert reset
    #10; // Wait for one clock cycle
    if (q !== 1'b0) begin
        $display("FAIL: Reset did not set q to 0");
        $finish;
    end

    // Test 2: Check D input functionality
    rst_n = 1; // Deassert reset
    d = 1; // Set D to 1
    #10; // Wait for one clock cycle
    if (q !== 1'b1) begin
        $display("FAIL: q did not follow d when rst_n is high");
        $finish;
    end

    // Test 3: Change D input
    d = 0; // Change D to 0
    #10; // Wait for one clock cycle
    if (q !== 1'b0) begin
        $display("FAIL: q did not follow d when D changed to 0");
        $finish;
    end

    // Test 4: Check reset again
    rst_n = 0; // Assert reset
    #10; // Wait for one clock cycle
    if (q !== 1'b0) begin
        $display("FAIL: Reset did not set q to 0 again");
        $finish;
    end

    // Test 5: Check D input after reset
    rst_n = 1; // Deassert reset
    d = 1; // Set D to 1
    #10; // Wait for one clock cycle
    if (q !== 1'b1) begin
        $display("FAIL: q did not follow d after reset was released");
        $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule