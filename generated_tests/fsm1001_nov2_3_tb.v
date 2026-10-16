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
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
  end

  // Test sequence
  initial begin
    // Initialize signals
    rst = 1;
    in = 0;
    #10; // Wait for a clock cycle
    rst = 0;

    // Test case 1: Check initial state and output
    if (uut.out !== 0) begin
      $display("FAIL: Initial output should be 0");
      $finish;
    end

    // Test case 2: Transition to S1
    in = 1; #10; // S0 -> S1
    if (uut.out !== 0) begin
      $display("FAIL: Output should be 0 in S1");
      $finish;
    end

    // Test case 3: Transition to S2
    in = 0; #10; // S1 -> S2
    if (uut.out !== 0) begin
      $display("FAIL: Output should be 0 in S2");
      $finish;
    end

    // Test case 4: Transition to S3
    in = 0; #10; // S2 -> S3
    if (uut.out !== 1) begin
      $display("FAIL: Output should be 1 in S3 when in is 0");
      $finish;
    end

    // Test case 5: Transition back to S0
    in = 1; #10; // S3 -> S0
    if (uut.out !== 0) begin
      $display("FAIL: Output should be 0 in S0");
      $finish;
    end

    // Test case 6: Check S1 again
    in = 1; #10; // S0 -> S1
    if (uut.out !== 0) begin
      $display("FAIL: Output should be 0 in S1");
      $finish;
    end

    // Test case 7: Check S2 again
    in = 0; #10; // S1 -> S2
    if (uut.out !== 0) begin
      $display("FAIL: Output should be 0 in S2");
      $finish;
    end

    // Test case 8: Check S3 again
    in = 0; #10; // S2 -> S3
    if (uut.out !== 1) begin
      $display("FAIL: Output should be 1 in S3 when in is 0");
      $finish;
    end

    // Finish simulation
    $display("PASS");
    $finish;
  end
endmodule