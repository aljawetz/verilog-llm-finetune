`timescale 1ns/1ps

module tb_dff_sahr;

  reg d;
  reg clk;
  reg rst;
  wire q;

  // Instantiate the module under test (uut)
  dff_sahr uut (
    .q(q),
    .d(d),
    .clk(clk),
    .rst(rst)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
  end

  // Test sequence
  initial begin
    // Initialize signals
    d = 0;
    rst = 1;

    // Test 1: Check reset functionality
    rst = 0; // Assert reset
    #10; // Wait for a clock edge
    if (q !== 1'b0) begin
      $display("FAIL: Reset did not set q to 0");
      $finish;
    end

    // Test 2: Check normal operation
    rst = 1; // Deassert reset
    d = 1; // Set d to 1
    #10; // Wait for a clock edge
    if (q !== 1'b1) begin
      $display("FAIL: q did not capture d on rising edge");
      $finish;
    end

    // Test 3: Check capturing d = 0
    d = 0; // Set d to 0
    #10; // Wait for a clock edge
    if (q !== 1'b0) begin
      $display("FAIL: q did not capture d = 0 on rising edge");
      $finish;
    end

    // Test 4: Check reset functionality again
    rst = 0; // Assert reset
    #10; // Wait for a clock edge
    if (q !== 1'b0) begin
      $display("FAIL: Reset did not set q to 0");
      $finish;
    end

    // Test 5: Check normal operation after reset
    rst = 1; // Deassert reset
    d = 1; // Set d to 1
    #10; // Wait for a clock edge
    if (q !== 1'b1) begin
      $display("FAIL: q did not capture d on rising edge after reset");
      $finish;
    end

    // End of tests
    $display("PASS");
    $finish;
  end

endmodule