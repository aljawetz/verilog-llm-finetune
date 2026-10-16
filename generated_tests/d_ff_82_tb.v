`timescale 1ns/1ps

module tb_d_ff;

  reg clk;
  reg d;
  reg rst;
  wire q;

  // Instantiate the D Flip-Flop
  d_ff uut (
    .clk(clk),
    .d(d),
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
    // Initialize signals
    rst = 1;
    d = 0;

    // Apply reset
    #10;
    rst = 0; // Release reset

    // Test 1: Check output when D is 0
    #10; // Wait for one clock cycle
    if (q !== 0) begin
      $display("FAIL: Expected q = 0, got q = %b", q);
      $finish;
    end

    // Test 2: Set D to 1
    d = 1;
    #10; // Wait for one clock cycle
    if (q !== 1) begin
      $display("FAIL: Expected q = 1, got q = %b", q);
      $finish;
    end

    // Test 3: Set D back to 0
    d = 0;
    #10; // Wait for one clock cycle
    if (q !== 0) begin
      $display("FAIL: Expected q = 0, got q = %b", q);
      $finish;
    end

    // Test 4: Assert reset
    rst = 1;
    #10; // Wait for one clock cycle
    if (q !== 0) begin
      $display("FAIL: Expected q = 0 after reset, got q = %b", q);
      $finish;
    end

    // Test 5: Release reset and check D = 1
    rst = 0;
    d = 1;
    #10; // Wait for one clock cycle
    if (q !== 1) begin
      $display("FAIL: Expected q = 1 after setting D = 1, got q = %b", q);
      $finish;
    end

    // Test 6: Check D = 0 again
    d = 0;
    #10; // Wait for one clock cycle
    if (q !== 0) begin
      $display("FAIL: Expected q = 0 after setting D = 0, got q = %b", q);
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule