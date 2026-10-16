`timescale 1ns/1ps

module tb_fsm1001_ov1;

reg clk;
reg rst;
reg in;
wire out;

// Instantiate the module under test
fsm1001_ov1 uut (
    .clk(clk),
    .rst(rst),
    .in(in),
    .out(out)
);

// Clock generation
always begin
    #5 clk = ~clk; // 10ns clock period
end

initial begin
    // Initialize signals
    clk = 0;
    rst = 1;
    in = 0;

    // Apply reset
    #10 rst = 0;

    // Test sequence
    // Test case 1: Check initial state
    #10;
    if (uut.out !== 0) begin
        $display("FAIL: Initial output should be 0");
        $finish;
    end

    // Test case 2: Transition to S1
    in = 1; // S0 -> S1
    #10;
    if (uut.out !== 0) begin
        $display("FAIL: Output should be 0 in state S1");
        $finish;
    end

    // Test case 3: Transition to S2
    in = 0; // S1 -> S2
    #10;
    if (uut.out !== 0) begin
        $display("FAIL: Output should be 0 in state S2");
        $finish;
    end

    // Test case 4: Transition to S3
    in = 0; // S2 -> S3
    #10;
    if (uut.out !== 0) begin
        $display("FAIL: Output should be 0 in state S3");
        $finish;
    end

    // Test case 5: Transition to S4
    in = 1; // S3 -> S4
    #10;
    if (uut.out !== 1) begin
        $display("FAIL: Output should be 1 in state S4");
        $finish;
    end

    // Test case 6: Back to S1
    in = 1; // S4 -> S1
    #10;
    if (uut.out !== 0) begin
        $display("FAIL: Output should be 0 in state S1");
        $finish;
    end

    // Test case 7: Back to S2
    in = 0; // S1 -> S2
    #10;
    if (uut.out !== 0) begin
        $display("FAIL: Output should be 0 in state S2");
        $finish;
    end

    // Test case 8: Back to S3
    in = 0; // S2 -> S3
    #10;
    if (uut.out !== 0) begin
        $display("FAIL: Output should be 0 in state S3");
        $finish;
    end

    // Test case 9: Back to S4
    in = 1; // S3 -> S4
    #10;
    if (uut.out !== 1) begin
        $display("FAIL: Output should be 1 in state S4");
        $finish;
    end

    // Test case 10: Reset the FSM
    rst = 1; // Assert reset
    #10;
    rst = 0; // De-assert reset
    #10;
    if (uut.out !== 0) begin
        $display("FAIL: Output should be 0 after reset");
        $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule