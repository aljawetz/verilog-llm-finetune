`timescale 1ns/1ps

module tb_T_ff2;

reg T;
reg clk;
reg rst;
wire q;
wire qbar;

// Instantiate the module under test (uut)
T_ff2 uut (
    .T(T),
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
    T = 0;
    rst = 0;

    // Apply reset
    rst = 1;
    #10; // Wait for 10ns
    rst = 0;
    #10; // Wait for 10ns

    // Check reset behavior
    if (q !== 0 || qbar !== 1) begin
        $display("FAIL: Reset did not set q to 0 and qbar to 1");
        $finish;
    end

    // Test T = 1, toggle q
    T = 1;
    #10; // Wait for 10ns
    if (q !== 1 || qbar !== 0) begin
        $display("FAIL: T=1 did not toggle q to 1 and qbar to 0");
        $finish;
    end

    #10; // Wait for 10ns
    if (q !== 0 || qbar !== 1) begin
        $display("FAIL: T=1 did not toggle q to 0 and qbar to 1");
        $finish;
    end

    #10; // Wait for 10ns
    if (q !== 1 || qbar !== 0) begin
        $display("FAIL: T=1 did not toggle q to 1 and qbar to 0");
        $finish;
    end

    // Test T = 0, no toggle
    T = 0;
    #10; // Wait for 10ns
    if (q !== 1 || qbar !== 0) begin
        $display("FAIL: T=0 caused unexpected toggle");
        $finish;
    end

    // Test reset again
    rst = 1;
    #10; // Wait for 10ns
    rst = 0;
    #10; // Wait for 10ns

    if (q !== 0 || qbar !== 1) begin
        $display("FAIL: Reset did not set q to 0 and qbar to 1 on second reset");
        $finish;
    end

    // Finalize the simulation
    $display("PASS");
    $finish;
end

endmodule