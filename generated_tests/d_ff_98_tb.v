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

    // Test case 1: d = 0
    d = 0;
    #10; // Wait for clock edge
    if (q !== 0 || qbar !== 1) begin
        $display("FAIL: Test case 1 failed (d=0)");
        $finish;
    end

    // Test case 2: d = 1
    d = 1;
    #10; // Wait for clock edge
    if (q !== 1 || qbar !== 0) begin
        $display("FAIL: Test case 2 failed (d=1)");
        $finish;
    end

    // Test case 3: Hold state with d = 1
    d = 1;
    #10; // Wait for clock edge
    if (q !== 1 || qbar !== 0) begin
        $display("FAIL: Test case 3 failed (hold d=1)");
        $finish;
    end

    // Test case 4: Change d to 0
    d = 0;
    #10; // Wait for clock edge
    if (q !== 0 || qbar !== 1) begin
        $display("FAIL: Test case 4 failed (d=0 after d=1)");
        $finish;
    end

    // Test case 5: Hold state with d = 0
    d = 0;
    #10; // Wait for clock edge
    if (q !== 0 || qbar !== 1) begin
        $display("FAIL: Test case 5 failed (hold d=0)");
        $finish;
    end

    // End simulation
    $display("PASS");
    $finish;
end

endmodule