`timescale 1ns/1ps

module tb_tff;

  // Inputs
  reg t;
  reg clk;
  reg rst;

  // Outputs
  wire q;

  // Instantiate the Unit Under Test (UUT)
  tff uut (
    .t(t),
    .clk(clk),
    .rst(rst),
    .q(q)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
  end

  // Test sequence
  initial begin
    // Initialize inputs
    rst = 1; t = 0;
    #10; // Wait for a clock cycle
    rst = 0; // Release reset

    // Test case 1: Check reset functionality
    #10;
    if (q !== 0) begin
      $display("FAIL: Reset did not set q to 0");
      $finish;
    end

    // Test case 2: Test toggle functionality with t = 1
    t = 1; 
    #10; // Wait for a clock cycle
    if (q !== 1) begin
      $display("FAIL: q did not toggle to 1 when t = 1");
      $finish;
    end

    #10; // Wait for a clock cycle
    if (q !== 0) begin
      $display("FAIL: q did not toggle to 0 on next clock with t = 1");
      $finish;
    end

    // Test case 3: Test hold functionality with t = 0
    t = 0; 
    #10; // Wait for a clock cycle
    if (q !== 0) begin
      $display("FAIL: q changed when t = 0");
      $finish;
    end

    #10; // Wait for a clock cycle
    if (q !== 0) begin
      $display("FAIL: q changed when t = 0");
      $finish;
    end

    // Test case 4: Test toggle functionality again with t = 1
    t = 1; 
    #10; // Wait for a clock cycle
    if (q !== 1) begin
      $display("FAIL: q did not toggle to 1 when t = 1 again");
      $finish;
    end

    #10; // Wait for a clock cycle
    if (q !== 0) begin
      $display("FAIL: q did not toggle to 0 on next clock with t = 1 again");
      $finish;
    end

    // All tests passed
    $display("PASS");
    $finish;
  end

endmodule