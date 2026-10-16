`timescale 1ns/1ps

module tb_dff;

reg d;
reg rst;
reg clk;
wire Q;

// Instantiate the D Flip-Flop
dff uut (
    .d(d),
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
    d = 0;
    rst = 0;

    // Test 1: Reset the DFF
    rst = 1; // Assert reset
    #10;     // Wait for 10ns
    if (Q !== 1'b0) begin
        $display("FAIL: Q should be 0 after reset");
        $finish;
    end

    // Test 2: Check D input when not reset
    rst = 0; // Deassert reset
    d = 1;   // Set D to 1
    #10;     // Wait for a clock edge
    if (Q !== 1'b1) begin
        $display("FAIL: Q should be 1 when D is 1");
        $finish;
    end

    // Test 3: Change D input
    d = 0;   // Set D to 0
    #10;     // Wait for a clock edge
    if (Q !== 1'b0) begin
        $display("FAIL: Q should be 0 when D is 0");
        $finish;
    end

    // Test 4: Assert reset again
    rst = 1; // Assert reset
    #10;     // Wait for 10ns
    if (Q !== 1'b0) begin
        $display("FAIL: Q should be 0 after reset");
        $finish;
    end

    // Test 5: Check D input after reset
    rst = 0; // Deassert reset
    d = 1;   // Set D to 1
    #10;     // Wait for a clock edge
    if (Q !== 1'b1) begin
        $display("FAIL: Q should be 1 when D is 1 after reset");
        $finish;
    end

    // Test 6: Final state check
    d = 0;   // Set D to 0
    #10;     // Wait for a clock edge
    if (Q !== 1'b0) begin
        $display("FAIL: Q should be 0 when D is 0 after reset");
        $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule