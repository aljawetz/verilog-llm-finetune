`timescale 1ns/1ps

module tb_d_ff;

reg clk;
reg d;
reg rst;
wire q;

// Instantiate the D flip-flop
d_ff uut (
    .clk(clk),
    .d(d),
    .rst(rst),
    .q(q)
);

// Clock generation
always begin
    #5 clk = ~clk; // 10ns clock period
end

initial begin
    // Initialize signals
    clk = 0;
    rst = 0;
    d = 0;

    // Test sequence
    // Test 1: Reset functionality
    rst = 1; // Assert reset
    #10; // Wait for one clock cycle
    if (q !== 1'b0) begin
        $display("FAIL: Reset did not set q to 0");
        $finish;
    end

    // Test 2: D flip-flop functionality
    rst = 0; // Deassert reset
    d = 1; // Set d to 1
    #10; // Wait for one clock cycle
    if (q !== 1'b1) begin
        $display("FAIL: q did not capture d when rst is low");
        $finish;
    end

    // Test 3: Change d input
    d = 0; // Change d to 0
    #10; // Wait for one clock cycle
    if (q !== 1'b0) begin
        $display("FAIL: q did not capture new d value");
        $finish;
    end

    // Test 4: Assert reset again
    rst = 1; // Assert reset
    #10; // Wait for one clock cycle
    if (q !== 1'b0) begin
        $display("FAIL: Reset did not set q to 0 again");
        $finish;
    end

    // Test 5: Check with multiple d values
    rst = 0; // Deassert reset
    d = 1; #10; // Wait for one clock cycle
    d = 0; #10; // Wait for one clock cycle
    if (q !== 1'b0) begin
        $display("FAIL: q did not capture the last d value correctly");
        $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule