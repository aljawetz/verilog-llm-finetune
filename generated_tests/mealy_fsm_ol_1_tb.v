`timescale 1ns/1ps

module tb_mealy_fsm_ol;

reg din;
reg clk;
reg rst;
wire dout;

// Instantiate the module under test (uut)
mealy_fsm_ol uut (
    .din(din),
    .clk(clk),
    .rst(rst),
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
    din = 0;
    rst = 1; // Assert reset
    #10;
    
    rst = 0; // Deassert reset
    #10;

    // Test sequence to check state transitions and output
    // s0 -> s1 (din=1)
    din = 1; 
    #10;
    if (uut.dout !== 1'b0) $display("FAIL: dout should be 0 in state s0 to s1 transition");

    // s1 -> s2 (din=0)
    din = 0; 
    #10;
    if (uut.dout !== 1'b0) $display("FAIL: dout should be 0 in state s1 to s2 transition");

    // s2 -> s3 (din=1)
    din = 1; 
    #10;
    if (uut.dout !== 1'b0) $display("FAIL: dout should be 0 in state s2 to s3 transition");

    // s3 -> s2 (din=0)
    din = 0; 
    #10;
    if (uut.dout !== 1'b1) $display("FAIL: dout should be 1 in state s3 to s2 transition with din=0");

    // s2 -> s0 (din=0)
    din = 0; 
    #10;
    if (uut.dout !== 1'b0) $display("FAIL: dout should be 0 in state s2 to s0 transition");

    // s0 -> s1 (din=1)
    din = 1; 
    #10;
    if (uut.dout !== 1'b0) $display("FAIL: dout should be 0 in state s0 to s1 transition");

    // s1 -> s2 (din=0)
    din = 0; 
    #10;
    if (uut.dout !== 1'b0) $display("FAIL: dout should be 0 in state s1 to s2 transition");

    // s2 -> s3 (din=1)
    din = 1; 
    #10;
    if (uut.dout !== 1'b0) $display("FAIL: dout should be 0 in state s2 to s3 transition");

    // s3 -> s1 (din=1)
    din = 1; 
    #10;
    if (uut.dout !== 1'b0) $display("FAIL: dout should be 0 in state s3 to s1 transition");

    // Final check
    $display("PASS");
    $finish;
end

endmodule