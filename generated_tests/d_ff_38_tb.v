`timescale 1ns/1ps

module tb_d_ff;

reg din;
reg clk;
reg rst;
wire q;
wire qbar;

// Instantiate the D flip-flop
d_ff uut (
    .din(din),
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
    din = 0;
    rst = 0;

    // Test reset functionality
    rst = 1; // Assert reset
    #10; // Wait for a clock edge
    if (q !== 0 || qbar !== 1) begin
        $display("FAIL: Reset did not set q to 0 and qbar to 1");
        $finish;
    end

    rst = 0; // Deassert reset
    #10; // Wait for a clock edge

    // Test D flip-flop functionality
    din = 1; // Set din to 1
    #10; // Wait for a clock edge
    if (q !== 1 || qbar !== 0) begin
        $display("FAIL: After setting din to 1, q should be 1 and qbar should be 0");
        $finish;
    end

    din = 0; // Set din to 0
    #10; // Wait for a clock edge
    if (q !== 0 || qbar !== 1) begin
        $display("FAIL: After setting din to 0, q should be 0 and qbar should be 1");
        $finish;
    end

    // Test reset again
    rst = 1; // Assert reset
    #10; // Wait for a clock edge
    if (q !== 0 || qbar !== 1) begin
        $display("FAIL: Reset did not set q to 0 and qbar to 1 on second check");
        $finish;
    end

    // End of tests
    $display("PASS");
    $finish;
end

endmodule