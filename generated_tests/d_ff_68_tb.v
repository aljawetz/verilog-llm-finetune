`timescale 1ns/1ps

module tb_d_ff;

reg d;
reg clk;
wire q;
wire qbar;

// Instantiate the D Flip-Flop
d_ff uut (
    .d(d),
    .clk(clk),
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
    d = 0;

    // Wait for the clock to stabilize
    #10;

    // Test case 1: d = 0, clk = 1
    d = 0;
    #10; // Wait for one clock cycle
    if (q !== 0 || qbar !== 1) begin
        $display("FAIL: Test case 1 failed");
        $finish;
    end

    // Test case 2: d = 1, clk = 1
    d = 1;
    #10; // Wait for one clock cycle
    if (q !== 1 || qbar !== 0) begin
        $display("FAIL: Test case 2 failed");
        $finish;
    end

    // Test case 3: d = 0, clk = 1
    d = 0;
    #10; // Wait for one clock cycle
    if (q !== 0 || qbar !== 1) begin
        $display("FAIL: Test case 3 failed");
        $finish;
    end

    // Test case 4: d = 1, clk = 1
    d = 1;
    #10; // Wait for one clock cycle
    if (q !== 1 || qbar !== 0) begin
        $display("FAIL: Test case 4 failed");
        $finish;
    end

    // Test case 5: Check hold time by changing d before the next clock edge
    d = 0;
    #5; // Change d before the clock edge
    #5; // Wait for the clock edge
    if (q !== 0 || qbar !== 1) begin
        $display("FAIL: Test case 5 failed");
        $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule