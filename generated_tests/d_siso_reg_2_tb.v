`timescale 1ns/1ps

module tb_d_siso_reg;

  reg d;
  reg clk;
  wire q;

  // Instantiate the module under test (uut)
  d_siso_reg uut (
    .d(d),
    .clk(clk),
    .q(q)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
  end

  // Test sequence
  initial begin
    // Initialize
    d = 0;
    #10; // Wait for the first clock edge

    // Test case 1: Check initial state
    if (q !== 0) begin
      $display("FAIL: Initial state is incorrect");
      $finish;
    end

    // Test case 2: Set d to 1 and check q
    d = 1;
    #10; // Wait for the next clock edge
    if (q !== 1) begin
      $display("FAIL: q should be 1 after d is set to 1");
      $finish;
    end

    // Test case 3: Set d to 0 and check q
    d = 0;
    #10; // Wait for the next clock edge
    if (q !== 0) begin
      $display("FAIL: q should be 0 after d is set to 0");
      $finish;
    end

    // Test case 4: Toggle d and check q
    d = 1;
    #10; // Wait for the next clock edge
    if (q !== 1) begin
      $display("FAIL: q should be 1 after d is set to 1 again");
      $finish;
    end

    // Test case 5: Toggle d again and check q
    d = 0;
    #10; // Wait for the next clock edge
    if (q !== 0) begin
      $display("FAIL: q should be 0 after d is set to 0 again");
      $finish;
    end

    // All tests passed
    $display("PASS");
    $finish;
  end

endmodule