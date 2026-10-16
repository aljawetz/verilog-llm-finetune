`timescale 1ns/1ps

module tb_clock_divide_by_2;

reg clk;
reg reset;
wire Q;

// Instantiate the module under test (uut)
clock_divide_by_2 uut (
    .clk(clk),
    .reset(reset),
    .Q(Q)
);

// Clock generation
always begin
    #5 clk = ~clk; // 10ns period
end

initial begin
    // Initialize signals
    clk = 0;
    reset = 0;

    // Test sequence
    // Test 1: Reset the module
    reset = 1; // Assert reset
    #10; // Wait for 10ns
    if (Q !== 1'b0) begin
        $display("FAIL: Q should be 0 after reset");
        $finish;
    end

    // Test 2: Release reset and check Q toggling
    reset = 0; // Deassert reset
    #10; // Wait for 10ns
    if (Q !== 1'b1) begin
        $display("FAIL: Q should be 1 after first clock cycle");
        $finish;
    end

    #10; // Wait for next clock cycle
    if (Q !== 1'b0) begin
        $display("FAIL: Q should be 0 after second clock cycle");
        $finish;
    end

    #10; // Wait for next clock cycle
    if (Q !== 1'b1) begin
        $display("FAIL: Q should be 1 after third clock cycle");
        $finish;
    end

    // Additional toggles
    #10; // Wait for next clock cycle
    if (Q !== 1'b0) begin
        $display("FAIL: Q should be 0 after fourth clock cycle");
        $finish;
    end

    // Final check
    #10; // Wait for next clock cycle
    if (Q !== 1'b1) begin
        $display("FAIL: Q should be 1 after fifth clock cycle");
        $finish;
    end

    // If all checks pass
    $display("PASS");
    $finish;
end

endmodule