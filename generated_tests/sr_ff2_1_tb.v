`timescale 1ns/1ps

module tb_sr_ff2;

reg s, r, clk, rst;
wire q, qbar;

// Instantiate the SR flip-flop
sr_ff2 uut (
    .s(s),
    .r(r),
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
    rst = 1; s = 0; r = 0;
    #10; // Wait for reset to take effect

    // Check initial state after reset
    if (q !== 1'b1 || qbar !== 1'b0) begin
        $display("FAIL: Initial state after reset is incorrect");
        $finish;
    end

    // Test case 1: Set (s=1, r=0)
    rst = 0; s = 1; r = 0; #10;
    if (q !== 1'b1 || qbar !== 1'b0) begin
        $display("FAIL: State after Set (s=1, r=0) is incorrect");
        $finish;
    end

    // Test case 2: Reset (s=0, r=1)
    s = 0; r = 1; #10;
    if (q !== 1'b0 || qbar !== 1'b1) begin
        $display("FAIL: State after Reset (s=0, r=1) is incorrect");
        $finish;
    end

    // Test case 3: Hold (s=0, r=0)
    s = 0; r = 0; #10;
    if (q !== 1'b0 || qbar !== 1'b1) begin
        $display("FAIL: State after Hold (s=0, r=0) is incorrect");
        $finish;
    end

    // Test case 4: Invalid state (s=1, r=1)
    s = 1; r = 1; #10;
    if (q !== 1'bx || qbar !== 1'bx) begin
        $display("FAIL: State after Invalid (s=1, r=1) is incorrect");
        $finish;
    end

    // Test case 5: Reset again
    rst = 1; #10;
    if (q !== 1'b1 || qbar !== 1'b0) begin
        $display("FAIL: State after reset is incorrect");
        $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule