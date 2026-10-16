`timescale 1ns/1ps

module tb_tff;

reg t;
reg rst;
reg clk;
wire Q;

// Instantiate the T flip-flop module
tff uut (
    .t(t),
    .rst(rst),
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
    // Initialize signals
    rst = 1; // Assert reset
    t = 0;
    #10; // Wait for 10ns
    rst = 0; // Deassert reset

    // Test case 1: Check reset functionality
    if (Q !== 1'b0) begin
        $display("FAIL: Q should be 0 after reset");
        $finish;
    end

    // Test case 2: Toggle Q when T is high
    t = 1; // Set T high
    #10; // Wait for one clock cycle
    if (Q !== 1'b1) begin
        $display("FAIL: Q should be 1 after toggling with T=1");
        $finish;
    end

    #10; // Wait for next clock cycle
    if (Q !== 1'b0) begin
        $display("FAIL: Q should be 0 after toggling again with T=1");
        $finish;
    end

    // Test case 3: No toggle when T is low
    t = 0; // Set T low
    #10; // Wait for one clock cycle
    if (Q !== 1'b0) begin
        $display("FAIL: Q should remain 0 when T=0");
        $finish;
    end

    #10; // Wait for next clock cycle
    if (Q !== 1'b0) begin
        $display("FAIL: Q should remain 0 when T=0");
        $finish;
    end

    // Test case 4: Toggle again with T high
    t = 1; // Set T high
    #10; // Wait for one clock cycle
    if (Q !== 1'b1) begin
        $display("FAIL: Q should be 1 after toggling with T=1");
        $finish;
    end

    // Test case 5: Reset functionality
    rst = 1; // Assert reset
    #10; // Wait for 10ns
    if (Q !== 1'b0) begin
        $display("FAIL: Q should be 0 after reset");
        $finish;
    end

    // End of tests
    $display("PASS");
    $finish;
end

endmodule