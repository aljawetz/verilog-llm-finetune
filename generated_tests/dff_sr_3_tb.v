`timescale 1ns/1ps

module tb_dff_sr;
  reg d;
  reg clk;
  reg rst;
  wire q;

  // Instantiate the module under test (uut)
  dff_sr uut (
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
    // Initialize inputs
    d = 0;
    rst = 0;

    // Test 1: Check reset functionality
    rst = 1; // Assert reset
    #10; // Wait for one clock cycle
    if (q !== 1'b1) begin
      $display("FAIL: Reset did not set q to 1");
      $finish;
    end

    // Test 2: Check normal operation
    rst = 0; // Deassert reset
    d = 0; 
    #10; // Wait for one clock cycle
    if (q !== 1'b0) begin
      $display("FAIL: q did not capture d (expected 0)");
      $finish;
    end

    d = 1; 
    #10; // Wait for one clock cycle
    if (q !== 1'b1) begin
      $display("FAIL: q did not capture d (expected 1)");
      $finish;
    end

    // Test 3: Check reset again
    rst = 1; // Assert reset
    #10; // Wait for one clock cycle
    if (q !== 1'b1) begin
      $display("FAIL: Reset did not set q to 1");
      $finish;
    end

    // Test 4: Check behavior with multiple clock cycles
    rst = 0; // Deassert reset
    d = 0; 
    #10; // Wait for one clock cycle
    if (q !== 1'b0) begin
      $display("FAIL: q did not capture d (expected 0)");
      $finish;
    end

    d = 1; 
    #10; // Wait for one clock cycle
    if (q !== 1'b1) begin
      $display("FAIL: q did not capture d (expected 1)");
      $finish;
    end

    // Final check
    rst = 1; // Assert reset
    #10; // Wait for one clock cycle
    if (q !== 1'b1) begin
      $display("FAIL: Reset did not set q to 1");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end
endmodule