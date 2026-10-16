`timescale 1ns/1ps

module tb_d_ff;

reg d;
reg clk;
wire q;
wire qbar;

// Instantiate the D flip-flop
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

    // Wait for the first clock edge
    #10;
    
    // Test case 1: Set d to 0, expect q=0, qbar=1
    d = 0;
    #10; // Wait for clock edge
    if (q !== 0 || qbar !== 1) begin
        $display("FAIL: Test case 1 failed");
        $finish;
    end

    // Test case 2: Set d to 1, expect q=1, qbar=0
    d = 1;
    #10; // Wait for clock edge
    if (q !== 1 || qbar !== 0) begin
        $display("FAIL: Test case 2 failed");
        $finish;
    end

    // Test case 3: Hold d at 1, expect q=1, qbar=0
    #10; // Wait for clock edge
    if (q !== 1 || qbar !== 0) begin
        $display("FAIL: Test case 3 failed");
        $finish;
    end

    // Test case 4: Change d to 0, expect q=0, qbar=1
    d = 0;
    #10; // Wait for clock edge
    if (q !== 0 || qbar !== 1) begin
        $display("FAIL: Test case 4 failed");
        $finish;
    end

    // Test case 5: Hold d at 0, expect q=0, qbar=1
    #10; // Wait for clock edge
    if (q !== 0 || qbar !== 1) begin
        $display("FAIL: Test case 5 failed");
        $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule