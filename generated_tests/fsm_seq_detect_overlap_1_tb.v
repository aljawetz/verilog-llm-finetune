`timescale 1ns/1ps

module tb_fsm_seq_detect_overlap;

reg ser_in;
reg clk;
reg rst;
wire out;

// Instantiate the module under test (uut)
fsm_seq_detect_overlap uut (
    .ser_in(ser_in),
    .clk(clk),
    .rst(rst),
    .out(out)
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
    ser_in = 0;
    #10; // Wait for reset to take effect
    rst = 0;

    // Test sequence: 1001 (should output high at the end)
    ser_in = 1; #10; // Input 1
    ser_in = 0; #10; // Input 0
    ser_in = 0; #10; // Input 0
    ser_in = 1; #10; // Input 1
    if (out !== 1) begin
        $display("FAIL: Expected output high after detecting 1001");
        $finish;
    end

    // Test overlapping: 001 (should output high again)
    ser_in = 0; #10; // Input 0
    ser_in = 0; #10; // Input 0
    ser_in = 1; #10; // Input 1
    if (out !== 1) begin
        $display("FAIL: Expected output high after detecting 1001 again");
        $finish;
    end

    // Test sequence: 1001 again
    ser_in = 1; #10; // Input 1
    ser_in = 0; #10; // Input 0
    ser_in = 0; #10; // Input 0
    ser_in = 1; #10; // Input 1
    if (out !== 1) begin
        $display("FAIL: Expected output high after detecting 1001 again");
        $finish;
    end

    // Test sequence: 0000 (should not output high)
    ser_in = 0; #10; // Input 0
    ser_in = 0; #10; // Input 0
    ser_in = 0; #10; // Input 0
    ser_in = 0; #10; // Input 0
    if (out !== 0) begin
        $display("FAIL: Expected output low for 0000 input");
        $finish;
    end

    // Final check for no output on non-matching sequence
    ser_in = 1; #10; // Input 1
    ser_in = 1; #10; // Input 1
    ser_in = 1; #10; // Input 1
    if (out !== 0) begin
        $display("FAIL: Expected output low for 1111 input");
        $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule