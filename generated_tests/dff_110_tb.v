`timescale 1ns/1ps

module tb_dff;

reg clk;
reg rst;
reg d;
wire q;

// Instantiate the D flip-flop
dff uut (
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
    rst = 1; #10; // Assert reset
    if (q !== 1'b0) begin
        $display("FAIL: Reset did not set q to 0");
        $finish;
    end

    // Test 2: Check D input assignment
    rst = 0; d = 1; #10; // Set d to 1
    if (q !== 1'b1) begin
        $display("FAIL: q did not follow d when rst is low");
        $finish;
    end

    // Test 3: Change D input
    d = 0; #10; // Change d to 0
    if (q !== 1'b0) begin
        $display("FAIL: q did not follow d when d changed to 0");
        $finish;
    end

    // Test 4: Assert reset again
    rst = 1; #10; // Assert reset
    if (q !== 1'b0) begin
        $display("FAIL: Reset did not set q to 0 on second assertion");
        $finish;
    end

    // Test 5: Check D input assignment after reset
    rst = 0; d = 1; #10; // Set d to 1 again
    if (q !== 1'b1) begin
        $display("FAIL: q did not follow d after reset");
        $finish;
    end

    // Test 6: Final state check
    d = 0; #10; // Change d to 0
    if (q !== 1'b0) begin
        $display("FAIL: q did not follow d on final change");
        $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule