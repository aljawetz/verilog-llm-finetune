`timescale 1ns/1ps

module tb_jk_ff;

reg j, k, clk, reset;
wire Q;

// Instantiate the jk_ff module
jk_ff uut (
    .j(j),
    .k(k),
    .clk(clk),
    .reset(reset),
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
    j = 0; k = 0; reset = 0;
    
    // Test 1: Reset the flip-flop
    reset = 1; #10; // Assert reset
    if (Q !== 1'b1) begin
        $display("FAIL: Reset did not set Q to 1");
        $finish;
    end
    reset = 0; #10; // Deassert reset

    // Test 2: Set condition (j=1, k=0)
    j = 1; k = 0; #10;
    if (Q !== 1'b1) begin
        $display("FAIL: Q did not set to 1 when j=1, k=0");
        $finish;
    end

    // Test 3: Reset condition (j=0, k=1)
    j = 0; k = 1; #10;
    if (Q !== 1'b0) begin
        $display("FAIL: Q did not reset to 0 when j=0, k=1");
        $finish;
    end

    // Test 4: Hold condition (j=0, k=0)
    j = 0; k = 0; #10;
    if (Q !== 1'b0) begin
        $display("FAIL: Q changed when j=0, k=0");
        $finish;
    end

    // Test 5: Toggle condition (j=1, k=1)
    j = 1; k = 1; #10;
    if (Q !== 1'b1) begin
        $display("FAIL: Q did not toggle correctly when j=1, k=1");
        $finish;
    end

    // Test 6: Toggle again (j=1, k=1)
    #10;
    if (Q !== 1'b0) begin
        $display("FAIL: Q did not toggle correctly on second toggle when j=1, k=1");
        $finish;
    end

    // Final check: Ensure Q holds state with j=0, k=0
    j = 0; k = 0; #10;
    if (Q !== 1'b0) begin
        $display("FAIL: Q changed when j=0, k=0");
        $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule