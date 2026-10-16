`timescale 1ns/1ps

module tb_jk_ff;

reg clk;
reg clr;
reg J;
reg K;
wire q;

// Instantiate the module under test (uut)
jk_ff uut (
    .clk(clk),
    .clr(clr),
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
    // Initialize
    clr = 1; J = 0; K = 0; // Clear should not affect output since clr is high
    #10;
    
    // Test 1: Check initial state
    if (q !== 1'b1) begin
        $display("FAIL: Initial state is not 1");
        $finish;
    end

    // Test 2: Test clear functionality
    clr = 0; // Clear should set q to 0
    #10;
    if (q !== 1'b0) begin
        $display("FAIL: Clear did not set output to 0");
        $finish;
    end

    // Test 3: Test J = 1, K = 0 (Set)
    clr = 1; J = 1; K = 0; // Set output to 1
    #10;
    if (q !== 1'b1) begin
        $display("FAIL: J=1, K=0 did not set output to 1");
        $finish;
    end

    // Test 4: Test J = 0, K = 1 (Reset)
    J = 0; K = 1; // Reset output to 0
    #10;
    if (q !== 1'b0) begin
        $display("FAIL: J=0, K=1 did not reset output to 0");
        $finish;
    end

    // Test 5: Test J = 1, K = 1 (Toggle)
    J = 1; K = 1; // Toggle output
    #10;
    if (q !== 1'b1) begin
        $display("FAIL: J=1, K=1 did not toggle output to 1");
        $finish;
    end

    // Test 6: Toggle again
    #10;
    if (q !== 1'b0) begin
        $display("FAIL: J=1, K=1 did not toggle output to 0");
        $finish;
    end

    // Test 7: Check no change with J=0, K=0
    J = 0; K = 0; // No change
    #10;
    if (q !== 1'b0) begin
        $display("FAIL: J=0, K=0 changed output unexpectedly");
        $finish;
    end

    // Final state check
    $display("PASS");
    $finish;
end

endmodule