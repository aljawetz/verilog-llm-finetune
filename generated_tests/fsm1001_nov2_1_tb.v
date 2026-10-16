`timescale 1ns/1ps

module tb_fsm1001_nov2;

reg clk;
reg rst;
reg in;
wire out;

// Instantiate the module under test
fsm1001_nov2 uut (
    .clk(clk),
    .rst(rst),
    .in(in),
    .out(out)
);

// Clock generation
always begin
    #5 clk = ~clk; // 10 ns clock period
end

initial begin
    // Initialize signals
    clk = 0;
    rst = 1;
    in = 0;

    // Apply reset
    #10;
    rst = 0;

    // Test sequence
    // Test case 1: Check initial state
    #10;
    if (uut.state !== 4'b0000) $display("FAIL: Initial state is not S0");

    // Test case 2: Transition from S0 to S1
    in = 1; // Input 1
    #10;
    if (uut.state !== 4'b0001) $display("FAIL: State did not transition to S1");

    // Test case 3: Stay in S1
    #10;
    if (uut.state !== 4'b0001) $display("FAIL: State should remain in S1");

    // Test case 4: Transition from S1 to S2
    in = 0; // Input 0
    #10;
    if (uut.state !== 4'b0010) $display("FAIL: State did not transition to S2");

    // Test case 5: Transition from S2 to S3
    in = 0; // Input 0
    #10;
    if (uut.state !== 4'b0011) $display("FAIL: State did not transition to S3");

    // Test case 6: Check output in S3
    if (uut.out !== 1) $display("FAIL: Output should be 1 when in S3 and in is 0");

    // Test case 7: Transition from S3 to S0
    in = 1; // Input 1
    #10;
    if (uut.state !== 4'b0000) $display("FAIL: State did not transition to S0");

    // Test case 8: Check output in S0
    if (uut.out !== 0) $display("FAIL: Output should be 0 when in S0");

    // If all checks pass
    $display("PASS");
    $finish;
end

endmodule