`timescale 1ns/1ps

module tb_jk_ff;

reg clk;
reg J;
reg K;
wire q;

// Instantiate the jk_ff module
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
    #10; // Wait for the first clock edge

    // Test case 1: Hold state (J=0, K=0)
    if (q !== 1'b1) begin
        $display("FAIL: Expected q=1 after hold state, got q=%b", q);
        $finish;
    end

    // Test case 2: Reset state (J=0, K=1)
    J = 0; K = 1; 
    #10; // Wait for clock edge
    if (q !== 1'b0) begin
        $display("FAIL: Expected q=0 after reset, got q=%b", q);
        $finish;
    end

    // Test case 3: Set state (J=1, K=0)
    J = 1; K = 0; 
    #10; // Wait for clock edge
    if (q !== 1'b1) begin
        $display("FAIL: Expected q=1 after set, got q=%b", q);
        $finish;
    end

    // Test case 4: Toggle state (J=1, K=1)
    J = 1; K = 1; 
    #10; // Wait for clock edge
    if (q !== 1'b0) begin
        $display("FAIL: Expected q=0 after toggle, got q=%b", q);
        $finish;
    end

    // Test case 5: Toggle state again (J=1, K=1)
    #10; // Wait for clock edge
    if (q !== 1'b1) begin
        $display("FAIL: Expected q=1 after toggle, got q=%b", q);
        $finish;
    end

    // Test case 6: Hold state again (J=0, K=0)
    J = 0; K = 0; 
    #10; // Wait for clock edge
    if (q !== 1'b1) begin
        $display("FAIL: Expected q=1 after hold state, got q=%b", q);
        $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule