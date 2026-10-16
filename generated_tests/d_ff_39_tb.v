`timescale 1ns/1ps

module tb_d_ff;

reg rst;
reg d;
reg clk;
wire q;

// Instantiate the D flip-flop
d_ff uut (
    .rst(rst),
    .d(d),
    .q(q),
    .clk(clk)
);

// Clock generation
initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
end

// Test sequence
initial begin
    // Initialize signals
    rst = 1; // Start with reset
    d = 0;

    // Wait for a clock cycle
    #10;
    if (q !== 1'b0) begin
        $display("FAIL: q should be 0 after reset");
        $finish;
    end

    // Release reset
    rst = 0;
    #10; // Wait for a clock cycle

    // Test case 1: Set d to 1
    d = 1;
    #10; // Wait for a clock cycle
    if (q !== 1'b1) begin
        $display("FAIL: q should be 1 when d is 1");
        $finish;
    end

    // Test case 2: Set d to 0
    d = 0;
    #10; // Wait for a clock cycle
    if (q !== 1'b0) begin
        $display("FAIL: q should be 0 when d is 0");
        $finish;
    end

    // Test case 3: Assert reset again
    rst = 1;
    #10; // Wait for a clock cycle
    if (q !== 1'b0) begin
        $display("FAIL: q should be 0 after reset");
        $finish;
    end

    // Test case 4: Release reset and set d to 1
    rst = 0;
    d = 1;
    #10; // Wait for a clock cycle
    if (q !== 1'b1) begin
        $display("FAIL: q should be 1 when d is 1 after reset");
        $finish;
    end

    // Test case 5: Change d to 0
    d = 0;
    #10; // Wait for a clock cycle
    if (q !== 1'b0) begin
        $display("FAIL: q should be 0 when d is 0 after reset");
        $finish;
    end

    // End of tests
    $display("PASS");
    $finish;
end

endmodule