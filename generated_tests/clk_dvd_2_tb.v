`timescale 1ns/1ps

module tb_clk_dvd;

reg clk;
reg rst;
wire q;

// Instantiate the module under test (uut)
clk_dvd uut (
    .clk(clk),
    .rst(rst),
    .q(q)
);

// Clock generation
always begin
    #5 clk = ~clk; // 10ns period
end

initial begin
    // Initialize signals
    clk = 0;
    rst = 0;

    // Test sequence
    // Test 1: Check reset functionality
    rst = 1; // Assert reset
    #10; // Wait for 10ns
    if (q !== 0) begin
        $display("FAIL: Reset did not set output to 0");
        $finish;
    end

    rst = 0; // Deassert reset
    #10; // Wait for 10ns

    // Test 2: Check toggling behavior
    if (q !== 1) begin
        $display("FAIL: Output did not toggle to 1 after reset deassertion");
        $finish;
    end

    #10; // Wait for 10ns
    if (q !== 0) begin
        $display("FAIL: Output did not toggle to 0");
        $finish;
    end

    #10; // Wait for 10ns
    if (q !== 1) begin
        $display("FAIL: Output did not toggle to 1");
        $finish;
    end

    #10; // Wait for 10ns
    if (q !== 0) begin
        $display("FAIL: Output did not toggle to 0");
        $finish;
    end

    // Test 3: Check reset functionality again
    rst = 1; // Assert reset
    #10; // Wait for 10ns
    if (q !== 0) begin
        $display("FAIL: Reset did not set output to 0 again");
        $finish;
    end

    // End of tests
    $display("PASS");
    $finish;
end

endmodule