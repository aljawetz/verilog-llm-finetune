`timescale 1ns/1ps

module tb_dff;

reg d;
reg clk;
reg rst;
wire q;
wire qbar;

// Instantiate the D flip-flop module
dff uut (
    .d(d),
    .clk(clk),
    .rst(rst),
    .q(q),
    .qbar(qbar)
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
    rst = 1; // Start with reset active

    // Test 1: Reset state
    #10;
    if (q !== 1'b0 || qbar !== 1'b1) begin
        $display("FAIL: Reset did not clear outputs");
        $finish;
    end

    // Test 2: Capture data on rising edge
    rst = 0; // Deactivate reset
    d = 1;   // Set input to 1
    #10;     // Wait for a clock edge
    if (q !== 1'b1 || qbar !== 1'b0) begin
        $display("FAIL: D flip-flop did not capture input correctly");
        $finish;
    end

    // Test 3: Change input and check output
    d = 0;   // Change input to 0
    #10;     // Wait for a clock edge
    if (q !== 1'b0 || qbar !== 1'b1) begin
        $display("FAIL: D flip-flop did not update output correctly");
        $finish;
    end

    // Test 4: Assert reset again
    rst = 1; // Assert reset
    #10;     // Wait for a clock edge
    if (q !== 1'b0 || qbar !== 1'b1) begin
        $display("FAIL: Reset did not clear outputs after being asserted again");
        $finish;
    end

    // Test 5: Check behavior after reset
    rst = 0; // Deactivate reset
    d = 1;   // Set input to 1
    #10;     // Wait for a clock edge
    if (q !== 1'b1 || qbar !== 1'b0) begin
        $display("FAIL: D flip-flop did not capture input correctly after reset");
        $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule