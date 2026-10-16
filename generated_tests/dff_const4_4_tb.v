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
always begin
    #5 clk = ~clk; // 10ns clock period
end

initial begin
    // Initialize signals
    clk = 0;
    reset = 0;

    // Test sequence
    // Test 1: Reset the DFF
    reset = 1; // Assert reset
    #10; // Wait for 10ns
    if (q !== 1'b1) begin
        $display("FAIL: Reset did not set q to 1");
        $finish;
    end

    // Test 2: Release reset and check q
    reset = 0; // Deassert reset
    #10; // Wait for 10ns
    if (q !== 1'b1) begin
        $display("FAIL: q did not remain 1 after reset release");
        $finish;
    end

    // Test 3: Check q remains constant
    #10; // Wait for 10ns
    if (q !== 1'b1) begin
        $display("FAIL: q changed unexpectedly");
        $finish;
    end

    // Test 4: Assert reset again
    reset = 1; // Assert reset
    #10; // Wait for 10ns
    if (q !== 1'b1) begin
        $display("FAIL: Reset did not set q to 1 again");
        $finish;
    end

    // Test 5: Release reset and check q
    reset = 0; // Deassert reset
    #10; // Wait for 10ns
    if (q !== 1'b1) begin
        $display("FAIL: q did not remain 1 after reset release again");
        $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule