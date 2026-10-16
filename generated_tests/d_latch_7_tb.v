`timescale 1ns/1ps

module tb_d_latch;

  reg d;
  wire q, qb;

  // Instantiate the D latch
  d_latch uut (
    .d(d),
    .q(q),
    .qb(qb)
  );

  initial begin
    // Test sequence
    // Test 1: Check initial state
    d = 0; #10;
    if (q !== 0 || qb !== 1) begin
      $display("FAIL: Initial state check failed");
      $finish;
    end

    // Test 2: Set d to 1
    d = 1; #10;
    if (q !== 1 || qb !== 0) begin
      $display("FAIL: Set d to 1 failed");
      $finish;
    end

    // Test 3: Reset d to 0
    d = 0; #10;
    if (q !== 0 || qb !== 1) begin
      $display("FAIL: Reset d to 0 failed");
      $finish;
    end

    // Test 4: Set d to 1 again
    d = 1; #10;
    if (q !== 1 || qb !== 0) begin
      $display("FAIL: Set d to 1 again failed");
      $finish;
    end

    // Test 5: Check stable state
    d = 1; #10;
    if (q !== 1 || qb !== 0) begin
      $display("FAIL: Stable state check failed");
      $finish;
    end

    // Test 6: Change d to 0
    d = 0; #10;
    if (q !== 0 || qb !== 1) begin
      $display("FAIL: Change d to 0 failed");
      $finish;
    end

    // All tests passed
    $display("PASS");
    $finish;
  end

endmodule