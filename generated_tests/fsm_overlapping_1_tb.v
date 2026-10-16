`timescale 1ns/1ps

module tb_fsm_overlapping;

reg clk;
reg rst;
reg din;
wire dout;

// Instantiate the module under test
fsm_overlapping uut (
    .clk(clk),
    .rst(rst),
    .din(din),
    .dout(dout)
);

// Clock generation
always begin
    #5 clk = ~clk; // 10ns clock period
end

initial begin
    // Initialize signals
    clk = 0;
    rst = 1;
    din = 0;

    // Apply reset
    #10 rst = 0;

    // Test sequence
    // Test 1: Input sequence that does not contain '101'
    din = 0; #10;
    din = 0; #10;
    din = 0; #10;
    if (dout !== 0) $display("FAIL: Expected dout = 0, got dout = %b", dout);

    // Test 2: Input sequence '101'
    din = 1; #10; // s0 -> s1
    din = 0; #10; // s1 -> s2
    din = 1; #10; // s2 -> s2, dout should be 1
    if (dout !== 1) $display("FAIL: Expected dout = 1, got dout = %b", dout);

    // Test 3: Input sequence '101' again to check overlapping
    din = 1; #10; // s2 -> s2, dout should still be 1
    din = 0; #10; // s2 -> s2, dout should still be 1
    din = 1; #10; // s2 -> s2, dout should still be 1
    if (dout !== 1) $display("FAIL: Expected dout = 1, got dout = %b", dout);

    // Test 4: Input sequence '010'
    din = 0; #10; // s2 -> s0
    din = 1; #10; // s0 -> s1
    din = 0; #10; // s1 -> s2
    if (dout !== 1) $display("FAIL: Expected dout = 1, got dout = %b", dout);

    // Test 5: Input sequence '000'
    din = 0; #10; // s2 -> s0
    din = 0; #10; // s0 -> s0
    din = 0; #10; // s0 -> s0
    if (dout !== 0) $display("FAIL: Expected dout = 0, got dout = %b", dout);

    // Test 6: Input sequence '101' again
    din = 1; #10; // s0 -> s1
    din = 0; #10; // s1 -> s2
    din = 1; #10; // s2 -> s2, dout should be 1
    if (dout !== 1) $display("FAIL: Expected dout = 1, got dout = %b", dout);

    // End simulation
    $display("PASS");
    $finish;
end

endmodule