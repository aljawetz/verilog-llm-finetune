`timescale 1ns/1ps

module tb_seq_110;

reg clk;
reg rst;
reg seqin;
wire dout;

// Instantiate the module under test
seq_110 uut (
    .clk(clk),
    .rst(rst),
    .seqin(seqin),
    .dout(dout)
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
    seqin = 0;
    #10; // Wait for a clock cycle
    rst = 0; // Release reset

    // Test sequence to detect "110"
    // Expected output: dout should be 1 when "110" is detected
    // Sequence: 1, 1, 0 -> dout should go high
    seqin = 0; #10; // dout should be 0
    if (dout !== 0) $display("FAIL: dout should be 0 in idle state");

    seqin = 1; #10; // Move to state s0
    if (dout !== 0) $display("FAIL: dout should be 0 in state s0");

    seqin = 1; #10; // Move to state s1
    if (dout !== 0) $display("FAIL: dout should be 0 in state s1");

    seqin = 0; #10; // Move to state s2
    if (dout !== 1) $display("FAIL: dout should be 1 in state s2 after detecting '110'");

    seqin = 1; #10; // Move back to state s0
    if (dout !== 0) $display("FAIL: dout should be 0 in state s0 after '110' detected");

    // Additional tests
    seqin = 1; #10; // Move to state s1
    if (dout !== 0) $display("FAIL: dout should be 0 in state s1");

    seqin = 1; #10; // Move to state s1
    if (dout !== 0) $display("FAIL: dout should be 0 in state s1");

    seqin = 0; #10; // Move to state s2
    if (dout !== 1) $display("FAIL: dout should be 1 in state s2 after detecting '110' again");

    // End of tests
    $display("PASS");
    $finish;
end

endmodule