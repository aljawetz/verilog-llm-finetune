`timescale 1ns/1ps

module tb_t_ff;

reg t;
reg clk;
reg rst;
wire q;
wire qbar;

// Instantiate the module under test (uut)
t_ff uut (
    .t(t),
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
    rst = 1; t = 0;
    #10; // Wait for a clock edge

    // Release reset
    rst = 0;
    #10; // Wait for a clock edge

    // Test case 1: T = 0, Q should remain 0
    t = 0;
    #10; // Wait for a clock edge
    if (q !== 0 || qbar !== 1) begin
        $display("FAIL: Test case 1 failed");
        $finish;
    end

    // Test case 2: T = 1, Q should toggle to 1
    t = 1;
    #10; // Wait for a clock edge
    if (q !== 1 || qbar !== 0) begin
        $display("FAIL: Test case 2 failed");
        $finish;
    end

    // Test case 3: T = 0, Q should remain 1
    t = 0;
    #10; // Wait for a clock edge
    if (q !== 1 || qbar !== 0) begin
        $display("FAIL: Test case 3 failed");
        $finish;
    end

    // Test case 4: T = 1, Q should toggle to 0
    t = 1;
    #10; // Wait for a clock edge
    if (q !== 0 || qbar !== 1) begin
        $display("FAIL: Test case 4 failed");
        $finish;
    end

    // Test case 5: Assert reset
    rst = 1;
    #10; // Wait for a clock edge
    if (q !== 0 || qbar !== 1) begin
        $display("FAIL: Test case 5 failed");
        $finish;
    end

    // Test case 6: Release reset and toggle
    rst = 0;
    t = 1;
    #10; // Wait for a clock edge
    if (q !== 1 || qbar !== 0) begin
        $display("FAIL: Test case 6 failed");
        $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule