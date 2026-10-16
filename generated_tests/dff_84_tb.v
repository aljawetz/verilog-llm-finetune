`timescale 1ns/1ps

module tb_dff;
  reg clk;
  reg rst;
  reg d;
  wire q;

  // Instantiate the D Flip-Flop
  dff uut (
    .clk(clk),
    .rst(rst),
    .d(d),
    .q(q)
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
    d = 0;

    // Apply reset
    #10;
    rst = 0;

    // Test case 1: Check reset functionality
    #10;
    if (q !== 0) begin
      $display("FAIL: q should be 0 after reset");
      $finish;
    end

    // Test case 2: Check data input
    d = 1;
    #10;
    if (q !== 1) begin
      $display("FAIL: q should be 1 after d is set to 1");
      $finish;
    end

    // Test case 3: Change data input
    d = 0;
    #10;
    if (q !== 0) begin
      $display("FAIL: q should be 0 after d is set to 0");
      $finish;
    end

    // Test case 4: Check data input remains stable
    d = 1;
    #10;
    if (q !== 1) begin
      $display("FAIL: q should be 1 after d is set to 1 again");
      $finish;
    end

    // Test case 5: Assert reset functionality again
    rst = 1;
    #10;
    if (q !== 0) begin
      $display("FAIL: q should be 0 after reset again");
      $finish;
    end

    // End of tests
    $display("PASS");
    $finish;
  end
endmodule