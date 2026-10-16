`timescale 1ns/1ps

module tb_d_ff;
  reg d;
  reg clk;
  wire q;

  // Instantiate the D flip-flop
  d_ff uut (
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

    // Wait for the first clock edge
    #10;
    if (q !== 0) begin
      $display("FAIL: Initial output q should be 0");
      $finish;
    end

    // Test 1: Set d to 1
    d = 1;
    #10; // Wait for the next clock edge
    if (q !== 1) begin
      $display("FAIL: Output q should be 1 after d is set to 1");
      $finish;
    end

    // Test 2: Set d to 0
    d = 0;
    #10; // Wait for the next clock edge
    if (q !== 0) begin
      $display("FAIL: Output q should be 0 after d is set to 0");
      $finish;
    end

    // Test 3: Toggle d
    d = 1;
    #10; // Wait for the next clock edge
    if (q !== 1) begin
      $display("FAIL: Output q should be 1 after d is set to 1 again");
      $finish;
    end

    d = 0;
    #10; // Wait for the next clock edge
    if (q !== 0) begin
      $display("FAIL: Output q should be 0 after d is set to 0 again");
      $finish;
    end

    // Final check
    d = 1;
    #10; // Wait for the next clock edge
    if (q !== 1) begin
      $display("FAIL: Output q should be 1 after d is set to 1 once more");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end
endmodule