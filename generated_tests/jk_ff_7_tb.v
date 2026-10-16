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
    // Initialize
    reset = 1; j = 0; k = 0;
    #10; // Wait for a clock cycle
    reset = 0;

    // Test case 1: Reset
    if (Q !== 1'b1) begin
        $display("FAIL: Reset did not set Q to 1");
        $finish;
    end

    // Test case 2: Set Q
    j = 1; k = 0; 
    #10; // Wait for a clock cycle
    if (Q !== 1'b1) begin
        $display("FAIL: Q did not set to 1 when j=1, k=0");
        $finish;
    end

    // Test case 3: Clear Q
    j = 0; k = 1; 
    #10; // Wait for a clock cycle
    if (Q !== 1'b0) begin
        $display("FAIL: Q did not clear to 0 when j=0, k=1");
        $finish;
    end

    // Test case 4: Maintain Q
    j = 0; k = 0; 
    #10; // Wait for a clock cycle
    if (Q !== 1'b0) begin
        $display("FAIL: Q changed when j=0, k=0");
        $finish;
    end

    // Test case 5: Toggle Q
    j = 1; k = 1; 
    #10; // Wait for a clock cycle
    if (Q !== 1'b1) begin
        $display("FAIL: Q did not toggle to 1 when j=1, k=1");
        $finish;
    end

    // Test case 6: Toggle Q again
    #10; // Wait for a clock cycle
    if (Q !== 1'b0) begin
        $display("FAIL: Q did not toggle to 0 when j=1, k=1");
        $finish;
    end

    // Final check
    reset = 1; 
    #10; // Wait for a clock cycle
    if (Q !== 1'b1) begin
        $display("FAIL: Reset did not set Q to 1");
        $finish;
    end

    $display("PASS");
    $finish;
end

endmodule