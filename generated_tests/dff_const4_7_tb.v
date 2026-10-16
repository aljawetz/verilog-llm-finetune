`timescale 1ns/1ps

module tb_dff_const4;

reg clk;
reg reset;
wire q;

// Instantiate the module under test
dff_const4 uut (
    .clk(clk),
    .reset(reset),
    .q(q)
);

// Clock generation
initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
end

// Test sequence
initial begin
    // Initialize reset
    reset = 1;
    #10; // Wait for 10ns
    reset = 0;

    // Check initial state
    if (q !== 1'b1) begin
        $display("FAIL: Initial state is not high");
        $finish;
    end

    // Apply clock and check behavior
    #10; // Wait for one clock cycle
    if (q !== 1'b1) begin
        $display("FAIL: q is not high after first clock cycle");
        $finish;
    end

    // Apply reset again
    reset = 1;
    #10; // Wait for reset to take effect
    reset = 0;

    // Check state after reset
    if (q !== 1'b1) begin
        $display("FAIL: q is not high after reset");
        $finish;
    end

    // Continue to check behavior over multiple clock cycles
    #10; // Wait for another clock cycle
    if (q !== 1'b1) begin
        $display("FAIL: q is not high after second clock cycle");
        $finish;
    end

    #10; // Wait for another clock cycle
    if (q !== 1'b1) begin
        $display("FAIL: q is not high after third clock cycle");
        $finish;
    end

    // If all checks pass
    $display("PASS");
    $finish;
end

endmodule