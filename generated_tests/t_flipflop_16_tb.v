`timescale 1ns/1ps

module tb_t_flipflop;

reg t;
reg clk;
reg rst;
wire q;
wire qb;

// Instantiate the T flip-flop module
t_flipflop uut (
    .t(t),
    .clk(clk),
    .rst(rst),
    .q(q),
    .qb(qb)
);

// Clock generation
initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
end

// Test sequence
initial begin
    // Initialize signals
    rst = 1;
    t = 0;

    // Test 1: Reset the flip-flop
    #10;
    rst = 0; // Assert reset
    #10;
    if (q !== 1'b0) begin
        $display("FAIL: Reset failed, q should be 0");
        $finish;
    end

    // Test 2: Release reset and hold state
    rst = 1; // Release reset
    #10;
    t = 0; // Hold state
    #10;
    if (q !== 1'b0) begin
        $display("FAIL: Hold state failed, q should be 0");
        $finish;
    end

    // Test 3: Toggle state
    t = 1; // Set t high to toggle
    #10;
    if (q !== 1'b1) begin
        $display("FAIL: Toggle failed, q should be 1");
        $finish;
    end

    // Test 4: Toggle back
    #10;
    if (q !== 1'b0) begin
        $display("FAIL: Toggle failed, q should be 0");
        $finish;
    end

    // Test 5: Check qb output
    #10;
    if (qb !== ~q) begin
        $display("FAIL: qb output incorrect, qb should be %b", ~q);
        $finish;
    end

    // Test 6: Continuous toggling
    #10;
    t = 1; // Toggle again
    #10;
    if (q !== 1'b1) begin
        $display("FAIL: Toggle failed, q should be 1");
        $finish;
    end

    // Final check for qb
    #10;
    if (qb !== ~q) begin
        $display("FAIL: qb output incorrect, qb should be %b", ~q);
        $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule