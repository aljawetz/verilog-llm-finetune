`timescale 1ns/1ps

module tb_clk_dvd;
  reg clk;
  reg rst;
  wire q;

  // Instantiate the module under test (uut)
  clk_dvd uut (
    .clk(clk),
    .rst(rst),
    .q(q)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns period
  end

  // Test sequence
  initial begin
    // Initialize reset
    rst = 1;
    #10; // Wait for 10ns
    rst = 0;

    // Check initial output after reset
    if (q !== 0) begin
      $display("FAIL: Initial output should be 0 after reset");
      $finish;
    end

    // Toggle output and check
    #10; // Wait for one clock cycle
    if (q !== 1) begin
      $display("FAIL: Output should be 1 after first clock cycle");
      $finish;
    end

    #10; // Wait for second clock cycle
    if (q !== 0) begin
      $display("FAIL: Output should be 0 after second clock cycle");
      $finish;
    end

    #10; // Wait for third clock cycle
    if (q !== 1) begin
      $display("FAIL: Output should be 1 after third clock cycle");
      $finish;
    end

    // Assert reset functionality
    rst = 1; // Assert reset
    #10; // Wait for reset to take effect
    if (q !== 0) begin
      $display("FAIL: Output should be 0 when reset is asserted");
      $finish;
    end

    rst = 0; // Deassert reset
    #10; // Wait for one clock cycle
    if (q !== 1) begin
      $display("FAIL: Output should be 1 after deasserting reset");
      $finish;
    end

    // Final checks
    #10; // Wait for another clock cycle
    if (q !== 0) begin
      $display("FAIL: Output should be 0 after final clock cycle");
      $finish;
    end

    $display("PASS");
    $finish;
  end
endmodule