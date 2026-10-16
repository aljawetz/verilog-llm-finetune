`timescale 1ns/1ps

module tb_Dff_data;

reg clk;
reg rst;
reg d;
wire q;

// Instantiate the Dff_data module
Dff_data uut (
    .clk(clk),
    .rst(rst),
    .d(d),
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
    rst = 0;
    d = 0;

    // Test 1: Reset functionality
    rst = 1; // Assert reset
    #10; // Wait for one clock cycle
    if (q !== 0) begin
        $display("FAIL: Reset did not set q to 0");
        $finish;
    end

    // Test 2: Check D flip-flop behavior
    rst = 0; // Deassert reset
    d = 1; // Set d to 1
    #10; // Wait for one clock cycle
    if (q !== 1) begin
        $display("FAIL: q did not capture d when d=1");
        $finish;
    end

    // Test 3: Change d to 0
    d = 0; // Set d to 0
    #10; // Wait for one clock cycle
    if (q !== 0) begin
        $display("FAIL: q did not capture d when d=0");
        $finish;
    end

    // Test 4: Assert reset again
    rst = 1; // Assert reset
    #10; // Wait for one clock cycle
    if (q !== 0) begin
        $display("FAIL: Reset did not set q to 0 again");
        $finish;
    end

    // Test 5: Check D flip-flop behavior with multiple changes
    rst = 0; // Deassert reset
    d = 1; #10; // Wait for one clock cycle
    if (q !== 1) begin
        $display("FAIL: q did not capture d when d=1 again");
        $finish;
    end
    d = 0; #10; // Wait for one clock cycle
    if (q !== 0) begin
        $display("FAIL: q did not capture d when d=0 again");
        $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule