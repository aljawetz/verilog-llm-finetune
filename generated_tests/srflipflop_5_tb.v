`timescale 1ns/1ps

module tb_srflipflop;

reg s, r, clk, rst;
wire q, qbar;

// Instantiate the SR Flip-Flop
srflipflop uut (
    .s(s),
    .r(r),
    .clk(clk),
    .rst(rst),
    .q(q),
    .qbar(qbar)
);

// Clock generation
initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
end

// Test sequence
initial begin
    // Initialize signals
    s = 0; r = 0; rst = 1; // Start with reset
    #10; // Wait for reset to take effect

    // Check reset functionality
    if (q !== 0 || qbar !== 1) begin
        $display("FAIL: Reset did not set q to 0 and qbar to 1");
        $finish;
    end

    // Release reset
    rst = 0;
    #10;

    // Test Set condition
    s = 1; r = 0; // Set condition
    #10;
    if (q !== 1 || qbar !== 0) begin
        $display("FAIL: Set condition failed");
        $finish;
    end

    // Test Reset condition
    s = 0; r = 1; // Reset condition
    #10;
    if (q !== 0 || qbar !== 1) begin
        $display("FAIL: Reset condition failed");
        $finish;
    end

    // Test Hold condition
    s = 0; r = 0; // Hold condition
    #10;
    if (q !== 0 || qbar !== 1) begin
        $display("FAIL: Hold condition failed");
        $finish;
    end

    // Test Set again
    s = 1; r = 0; // Set condition
    #10;
    if (q !== 1 || qbar !== 0) begin
        $display("FAIL: Set condition failed on second test");
        $finish;
    end

    // Test Reset again
    s = 0; r = 1; // Reset condition
    #10;
    if (q !== 0 || qbar !== 1) begin
        $display("FAIL: Reset condition failed on second test");
        $finish;
    end

    // Final check for Hold condition
    s = 0; r = 0; // Hold condition
    #10;
    if (q !== 0 || qbar !== 1) begin
        $display("FAIL: Hold condition failed on final test");
        $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule