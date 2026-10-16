`timescale 1ns/1ps

module tb_jk_ff;

reg clk;
reg M;
reg J;
reg K;
wire q;
wire q_bar;

// Instantiate the module under test
jk_ff uut (
    .clk(clk),
    .M(M),
    .J(J),
    .K(K),
    .q(q),
    .q_bar(q_bar)
);

// Clock generation
initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
end

// Test sequence
initial begin
    // Initialize inputs
    M = 1'b0;
    J = 1'b0;
    K = 1'b0;

    // Wait for a clock edge
    @(negedge clk);
    
    // Test case 1: Maintain state (J=0, K=0)
    #10;
    if (q !== 1'b1) begin
        $display("FAIL: Test case 1 failed, expected q=1, got q=%b", q);
        $finish;
    end

    // Test case 2: Reset (J=0, K=1)
    J = 1'b0; K = 1'b1;
    @(negedge clk);
    #10;
    if (q !== 1'b0) begin
        $display("FAIL: Test case 2 failed, expected q=0, got q=%b", q);
        $finish;
    end

    // Test case 3: Set (J=1, K=0)
    J = 1'b1; K = 1'b0;
    @(negedge clk);
    #10;
    if (q !== 1'b1) begin
        $display("FAIL: Test case 3 failed, expected q=1, got q=%b", q);
        $finish;
    end

    // Test case 4: Toggle (J=1, K=1)
    J = 1'b1; K = 1'b1;
    @(negedge clk);
    #10;
    if (q !== 1'b0) begin
        $display("FAIL: Test case 4 failed, expected q=0, got q=%b", q);
        $finish;
    end

    // Toggle again
    @(negedge clk);
    #10;
    if (q !== 1'b1) begin
        $display("FAIL: Test case 4 toggle failed, expected q=1, got q=%b", q);
        $finish;
    end

    // Final check for q_bar
    if (q_bar !== ~q) begin
        $display("FAIL: q_bar mismatch, expected q_bar=%b, got q_bar=%b", ~q, q_bar);
        $finish;
    end

    $display("PASS");
    $finish;
end

endmodule