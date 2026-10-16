`timescale 1ns/1ps

module tb_dual_edge_ff;

reg clk;
reg rst;
reg d;
wire q;

// Instantiate the module under test (uut)
dual_edge_ff uut (
    .clk(clk),
    .rst(rst),
    .d(d),
    .q(q)
);

// Clock generation
initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns period
end

// Test sequence
initial begin
    // Initialize signals
    rst = 1;
    d = 0;
    #10; // Wait for a clock cycle

    // Release reset
    rst = 0;
    #10;

    // Test 1: Set d = 1, check q after posedge and negedge
    d = 1;
    #10; // Wait for one posedge and one negedge
    if (q !== 1) begin
        $display("FAIL: Test 1 failed, expected q = 1, got q = %b", q);
        $finish;
    end

    // Test 2: Set d = 0, check q after posedge and negedge
    d = 0;
    #10; // Wait for one posedge and one negedge
    if (q !== 0) begin
        $display("FAIL: Test 2 failed, expected q = 0, got q = %b", q);
        $finish;
    end

    // Test 3: Assert reset, check q
    rst = 1;
    #10; // Wait for a clock cycle
    if (q !== 0) begin
        $display("FAIL: Test 3 failed, expected q = 0 after reset, got q = %b", q);
        $finish;
    end

    // Test 4: Release reset, set d = 1, check q after posedge and negedge
    rst = 0;
    d = 1;
    #10; // Wait for one posedge and one negedge
    if (q !== 1) begin
        $display("FAIL: Test 4 failed, expected q = 1, got q = %b", q);
        $finish;
    end

    // Test 5: Set d = 0, check q after posedge and negedge
    d = 0;
    #10; // Wait for one posedge and one negedge
    if (q !== 0) begin
        $display("FAIL: Test 5 failed, expected q = 0, got q = %b", q);
        $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule