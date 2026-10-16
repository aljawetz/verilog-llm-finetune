`timescale 1ns/1ps

module tb_jkff_1;

reg J;
reg K;
reg clk;
wire Q;

// Instantiate the module under test (uut)
jkff_1 uut (
    .J(J),
    .K(K),
    .clk(clk),
    .Q(Q)
);

// Clock generation
initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
end

// Test sequence
initial begin
    // Initialize inputs
    J = 0; K = 0;
    #10; // Wait for a clock edge

    // Test case 1: J=0, K=0 -> Q should remain unchanged
    J = 0; K = 0;
    #10; // Wait for a clock edge
    if (Q !== 0) $display("FAIL: Test case 1 failed, expected Q=0, got Q=%b", Q);

    // Test case 2: J=0, K=1 -> Q should reset to 0
    J = 0; K = 1;
    #10; // Wait for a clock edge
    if (Q !== 0) $display("FAIL: Test case 2 failed, expected Q=0, got Q=%b", Q);

    // Test case 3: J=1, K=0 -> Q should set to 1
    J = 1; K = 0;
    #10; // Wait for a clock edge
    if (Q !== 1) $display("FAIL: Test case 3 failed, expected Q=1, got Q=%b", Q);

    // Test case 4: J=1, K=1 -> Q should toggle
    J = 1; K = 1;
    #10; // Wait for a clock edge
    if (Q !== 0) $display("FAIL: Test case 4 failed, expected Q=0, got Q=%b", Q);
    #10; // Wait for a clock edge
    if (Q !== 1) $display("FAIL: Test case 4 failed, expected Q=1, got Q=%b", Q);

    // Test case 5: J=0, K=0 -> Q should remain unchanged
    J = 0; K = 0;
    #10; // Wait for a clock edge
    if (Q !== 1) $display("FAIL: Test case 5 failed, expected Q=1, got Q=%b", Q);

    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule