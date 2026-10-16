`timescale 1ns/1ps

module tb_d_ff;

reg clk;
reg d;
wire q;

// Instantiate the D flip-flop
d_ff uut (
    .clk(clk),
    .d(d),
    .q(q)
);

// Clock generation
always begin
    #5 clk = ~clk; // 10ns clock period
end

initial begin
    // Initialize signals
    clk = 0;
    d = 0;

    // Test sequence
    // Test 1: Check initial state
    #10;
    if (q !== 0) begin
        $display("FAIL: Initial state is incorrect");
        $finish;
    end

    // Test 2: Set d to 1 and check q on falling edge
    d = 1;
    #10; // Wait for falling edge
    if (q !== 1) begin
        $display("FAIL: q did not update to 1 when d was 1");
        $finish;
    end

    // Test 3: Set d to 0 and check q on falling edge
    d = 0;
    #10; // Wait for falling edge
    if (q !== 0) begin
        $display("FAIL: q did not update to 0 when d was 0");
        $finish;
    end

    // Test 4: Toggle d and check q
    d = 1;
    #10; // Wait for falling edge
    if (q !== 1) begin
        $display("FAIL: q did not update to 1 when d was toggled to 1");
        $finish;
    end

    d = 0;
    #10; // Wait for falling edge
    if (q !== 0) begin
        $display("FAIL: q did not update to 0 when d was toggled to 0");
        $finish;
    end

    // All tests passed
    $display("PASS");
    $finish;
end

endmodule