`timescale 1ns/1ps

module tb_jk_ff;

reg j, k, clk, reset;
wire Q;

// Instantiate the module under test
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
    // Initialize signals
    reset = 1; j = 0; k = 0;
    #10; // Wait for 10ns
    reset = 0;

    // Test case 1: Reset
    #10; // Wait for 10ns
    if (Q !== 1'b0) begin
        $display("FAIL: Q should be 0 after reset");
        $finish;
    end

    // Test case 2: Set (J=1, K=0)
    j = 1; k = 0;
    #10; // Wait for 10ns
    if (Q !== 1'b1) begin
        $display("FAIL: Q should be 1 when J=1, K=0");
        $finish;
    end

    // Test case 3: Reset (J=0, K=1)
    j = 0; k = 1;
    #10; // Wait for 10ns
    if (Q !== 1'b0) begin
        $display("FAIL: Q should be 0 when J=0, K=1");
        $finish;
    end

    // Test case 4: Hold (J=0, K=0)
    j = 0; k = 0;
    #10; // Wait for 10ns
    if (Q !== 1'b0) begin
        $display("FAIL: Q should remain 0 when J=0, K=0");
        $finish;
    end

    // Test case 5: Toggle (J=1, K=1)
    j = 1; k = 1;
    #10; // Wait for 10ns
    if (Q !== 1'b1) begin
        $display("FAIL: Q should be 1 after toggle when J=1, K=1");
        $finish;
    end

    // Test case 6: Toggle again (J=1, K=1)
    #10; // Wait for 10ns
    if (Q !== 1'b0) begin
        $display("FAIL: Q should be 0 after toggle when J=1, K=1");
        $finish;
    end

    // Test case 7: Set again (J=1, K=0)
    j = 1; k = 0;
    #10; // Wait for 10ns
    if (Q !== 1'b1) begin
        $display("FAIL: Q should be 1 when J=1, K=0");
        $finish;
    end

    // Test case 8: Reset again (J=0, K=1)
    j = 0; k = 1;
    #10; // Wait for 10ns
    if (Q !== 1'b0) begin
        $display("FAIL: Q should be 0 when J=0, K=1");
        $finish;
    end

    // Final check
    $display("PASS");
    $finish;
end

endmodule