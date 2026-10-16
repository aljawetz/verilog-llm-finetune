`timescale 1ns/1ps

module tb_srflipflop;

reg s, r, clk, rst;
wire q, qbar;

// Instantiate the SR flip-flop
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
    // Initialize inputs
    s = 0; r = 0; rst = 1; // Reset state
    #10; // Wait for reset to take effect

    // Check reset functionality
    if (q !== 0 || qbar !== 1) begin
        $display("FAIL: Reset did not set q to 0 and qbar to 1");
        $finish;
    end

    // Release reset
    rst = 0;
    #10;

    // Test setting q to 1
    s = 1; r = 0; // Set condition
    #10;
    if (q !== 1 || qbar !== 0) begin
        $display("FAIL: Expected q=1, qbar=0 after setting s=1, r=0");
        $finish;
    end

    // Test holding state
    s = 0; r = 0; // Hold condition
    #10;
    if (q !== 1 || qbar !== 0) begin
        $display("FAIL: Expected q=1, qbar=0 after holding state");
        $finish;
    end

    // Test resetting q to 0
    s = 0; r = 1; // Reset condition
    #10;
    if (q !== 0 || qbar !== 1) begin
        $display("FAIL: Expected q=0, qbar=1 after setting r=1");
        $finish;
    end

    // Test setting q to 1 again
    s = 1; r = 0; // Set condition
    #10;
    if (q !== 1 || qbar !== 0) begin
        $display("FAIL: Expected q=1, qbar=0 after setting s=1, r=0");
        $finish;
    end

    // Test invalid condition (s=1, r=1)
    s = 1; r = 1; // Invalid condition
    #10;
    if (q !== 1 || qbar !== 0) begin
        $display("FAIL: Expected q=1, qbar=0 after setting s=1, r=1 (last state should hold)");
        $finish;
    end

    // Final reset
    rst = 1; // Reset state
    #10;
    if (q !== 0 || qbar !== 1) begin
        $display("FAIL: Reset did not set q to 0 and qbar to 1");
        $finish;
    end

    $display("PASS");
    $finish;
end

endmodule