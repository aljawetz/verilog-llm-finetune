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
    forever #5 clk = ~clk; // 10ns clock period
end

// Test sequence
initial begin
    // Initialize inputs
    rst = 1;
    d = 0;
    #10; // Wait for a clock cycle

    // Release reset
    rst = 0;
    #10;

    // Test case 1: Set d to 1 and check q on rising edge
    d = 1;
    #10; // Wait for a clock cycle
    if (q !== 1) begin
        $display("FAIL: q should be 1 after rising edge with d=1");
        $finish;
    end

    // Test case 2: Check q on falling edge
    #10; // Wait for a falling edge
    if (q !== 1) begin
        $display("FAIL: q should still be 1 after falling edge with d=1");
        $finish;
    end

    // Test case 3: Reset the flip-flop
    rst = 1;
    #10; // Wait for a clock cycle
    if (q !== 0) begin
        $display("FAIL: q should be 0 after reset");
        $finish;
    end

    // Test case 4: Set d to 0 and check q on rising edge
    rst = 0;
    d = 0;
    #10; // Wait for a clock cycle
    if (q !== 0) begin
        $display("FAIL: q should be 0 after rising edge with d=0");
        $finish;
    end

    // Test case 5: Set d to 1 and check q on rising edge
    d = 1;
    #10; // Wait for a clock cycle
    if (q !== 1) begin
        $display("FAIL: q should be 1 after rising edge with d=1");
        $finish;
    end

    // Test case 6: Check q on falling edge
    #10; // Wait for a falling edge
    if (q !== 1) begin
        $display("FAIL: q should still be 1 after falling edge with d=1");
        $finish;
    end

    // Test case 7: Reset again
    rst = 1;
    #10; // Wait for a clock cycle
    if (q !== 0) begin
        $display("FAIL: q should be 0 after reset");
        $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule