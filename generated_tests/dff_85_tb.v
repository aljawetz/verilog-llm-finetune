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
    rst = 1; // Assert reset
    d = 0;

    // Wait for a clock cycle
    #10;
    if (q !== 1'b0) begin
      $display("FAIL: q should be 0 after reset");
      $finish;
    end

    // Release reset
    rst = 0;
    #10;

    // Test case 1: Set d to 1
    d = 1;
    #10;
    if (q !== 1'b1) begin
      $display("FAIL: q should be 1 when d is 1");
      $finish;
    end

    // Test case 2: Set d to 0
    d = 0;
    #10;
    if (q !== 1'b0) begin
      $display("FAIL: q should be 0 when d is 0");
      $finish;
    end

    // Test case 3: Check reset functionality
    rst = 1; // Assert reset
    #10;
    if (q !== 1'b0) begin
      $display("FAIL: q should be 0 after reset");
      $finish;
    end

    // Test case 4: Check d = 1 after reset
    rst = 0; // Release reset
    d = 1;
    #10;
    if (q !== 1'b1) begin
      $display("FAIL: q should be 1 when d is 1 after reset");
      $finish;
    end

    // Test case 5: Check d = 0 after d = 1
    d = 0;
    #10;
    if (q !== 1'b0) begin
      $display("FAIL: q should be 0 when d is 0 after d was 1");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end
endmodule