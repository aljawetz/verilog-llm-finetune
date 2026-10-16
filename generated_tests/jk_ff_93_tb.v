`timescale 1ns/1ps

module tb_jk_ff;

reg clk;
reg J;
reg K;
wire q;

// Instantiate the module under test
jk_ff uut (
    .clk(clk),
    .J(J),
    .K(K),
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
    J = 0;
    K = 0;
    #10; // Wait for the initial state

    // Check initial state
    if (q !== 1'b1) begin
        $display("FAIL: Initial state is not 1");
        $finish;
    end

    // Test J = 0, K = 0 (hold state)
    J = 0; K = 0;
    #10;
    if (q !== 1'b1) begin
        $display("FAIL: Expected q = 1, got q = %b", q);
        $finish;
    end

    // Test J = 0, K = 1 (reset)
    J = 0; K = 1;
    #10;
    if (q !== 1'b0) begin
        $display("FAIL: Expected q = 0, got q = %b", q);
        $finish;
    end

    // Test J = 1, K = 0 (set)
    J = 1; K = 0;
    #10;
    if (q !== 1'b1) begin
        $display("FAIL: Expected q = 1, got q = %b", q);
        $finish;
    end

    // Test J = 1, K = 1 (toggle)
    J = 1; K = 1;
    #10;
    if (q !== 1'b0) begin
        $display("FAIL: Expected q = 0, got q = %b", q);
        $finish;
    end

    #10; // Wait for next clock edge
    if (q !== 1'b1) begin
        $display("FAIL: Expected q = 1, got q = %b", q);
        $finish;
    end

    #10; // Wait for next clock edge
    if (q !== 0) begin
        $display("FAIL: Expected q = 0, got q = %b", q);
        $finish;
    end

    // Final toggle check
    #10; // Wait for next clock edge
    if (q !== 1'b1) begin
        $display("FAIL: Expected q = 1, got q = %b", q);
        $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule