`timescale 1ns/1ps

module tb_sr_flipflop_sync;

reg clk;
reg rst;
reg s;
reg r;
wire q;
wire q_bar;

// Instantiate the module under test (uut)
sr_flipflop_sync uut (
    .clk(clk),
    .rst(rst),
    .s(s),
    .r(r),
    .q(q),
    .q_bar(q_bar)
);

// Clock generation
initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
end

// Test sequence
initial begin
    // Initialize signals
    rst = 0;
    s = 0;
    r = 0;

    // Test 1: Reset the flip-flop
    rst = 1; #10; // Apply reset
    if (q !== 0 || q_bar !== 1) begin
        $display("FAIL: Reset did not set q to 0 and q_bar to 1");
        $finish;
    end

    // Test 2: Set the flip-flop
    rst = 0; s = 1; r = 0; #10; // Set
    if (q !== 1 || q_bar !== 0) begin
        $display("FAIL: Set did not set q to 1 and q_bar to 0");
        $finish;
    end

    // Test 3: Clear the flip-flop
    s = 0; r = 1; #10; // Clear
    if (q !== 0 || q_bar !== 1) begin
        $display("FAIL: Clear did not set q to 0 and q_bar to 1");
        $finish;
    end

    // Test 4: Hold state
    s = 0; r = 0; #10; // Hold
    if (q !== 0 || q_bar !== 1) begin
        $display("FAIL: Hold did not maintain q as 0 and q_bar as 1");
        $finish;
    end

    // Test 5: Set again
    s = 1; r = 0; #10; // Set
    if (q !== 1 || q_bar !== 0) begin
        $display("FAIL: Set did not set q to 1 and q_bar to 0");
        $finish;
    end

    // Test 6: Invalid state (both set and reset)
    s = 1; r = 1; #10; // Invalid state
    if (q !== 1'bx || q_bar !== 1'bx) begin
        $display("FAIL: Invalid state did not set q and q_bar to x");
        $finish;
    end

    // Final state check
    rst = 1; #10; // Reset again
    if (q !== 0 || q_bar !== 1) begin
        $display("FAIL: Final reset did not set q to 0 and q_bar to 1");
        $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule