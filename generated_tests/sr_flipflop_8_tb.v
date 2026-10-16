`timescale 1ns/1ps

module tb_sr_flipflop;

reg s;
reg r;
reg clk;
wire q;
wire qb;

// Instantiate the SR Flip-Flop
sr_flipflop uut (
    .s(s),
    .r(r),
    .clk(clk),
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
    // Initialize inputs
    s = 0; r = 0;
    #10;

    // Test case 1: Set condition
    s = 1; r = 0; // Set
    #10;
    if (q !== 1'b1 || qb !== 1'b0) begin
        $display("FAIL: Test case 1 failed (Set condition)");
        $finish;
    end

    // Test case 2: Reset condition
    s = 0; r = 1; // Reset
    #10;
    if (q !== 1'b0 || qb !== 1'b1) begin
        $display("FAIL: Test case 2 failed (Reset condition)");
        $finish;
    end

    // Test case 3: Hold state (no change)
    s = 0; r = 0; // Hold
    #10;
    if (q !== 1'b0 || qb !== 1'b1) begin
        $display("FAIL: Test case 3 failed (Hold state)");
        $finish;
    end

    // Test case 4: Set again
    s = 1; r = 0; // Set
    #10;
    if (q !== 1'b1 || qb !== 1'b0) begin
        $display("FAIL: Test case 4 failed (Set condition again)");
        $finish;
    end

    // Test case 5: Reset again
    s = 0; r = 1; // Reset
    #10;
    if (q !== 1'b0 || qb !== 1'b1) begin
        $display("FAIL: Test case 5 failed (Reset condition again)");
        $finish;
    end

    // Final hold state
    s = 0; r = 0; // Hold
    #10;
    if (q !== 1'b0 || qb !== 1'b1) begin
        $display("FAIL: Final hold state failed");
        $finish;
    end

    $display("PASS");
    $finish;
end

endmodule