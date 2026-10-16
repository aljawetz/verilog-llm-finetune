`timescale 1ns/1ps

module tb_repeat5;
  reg clk;
  reg rst;
  wire [1:0] cnt;
  
  // Instantiate the module under test (uut)
  repeat5 uut (
    .clk(clk),
    .rst(rst),
    .cnt(cnt)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
  end

  // Test sequence
  initial begin
    // Initialize reset
    rst = 1;
    #10; // Wait for 10ns
    rst = 0;

    // Test the counter behavior
    // Expect cnt to be 0 initially
    #10;
    if (cnt !== 0) begin
      $display("FAIL: Initial count is not 0");
      $finish;
    end

    // Simulate 5 clock cycles
    #50; // 5 clock cycles
    if (cnt !== 1) begin
      $display("FAIL: Count after 5 cycles is not 1");
      $finish;
    end

    // Simulate another 5 clock cycles
    #50; // 5 more clock cycles
    if (cnt !== 2) begin
      $display("FAIL: Count after 10 cycles is not 2");
      $finish;
    end

    // Reset the counter
    rst = 1;
    #10;
    rst = 0;

    // Expect cnt to be 0 after reset
    #10;
    if (cnt !== 0) begin
      $display("FAIL: Count after reset is not 0");
      $finish;
    end

    // Simulate 5 clock cycles again
    #50; // 5 clock cycles
    if (cnt !== 1) begin
      $display("FAIL: Count after 5 cycles post-reset is not 1");
      $finish;
    end

    // Simulate another 5 clock cycles
    #50; // 5 more clock cycles
    if (cnt !== 2) begin
      $display("FAIL: Count after 10 cycles post-reset is not 2");
      $finish;
    end

    // End of tests
    $display("PASS");
    $finish;
  end
endmodule