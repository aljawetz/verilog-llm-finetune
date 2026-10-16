`timescale 1ns/1ps

module tb_d_latch;

  reg d;
  wire q;
  wire qb;

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
      $display("FAIL: d=1 check failed");
      $finish;
    end

    // Test 3: Set d to 0
    d = 0; #10;
    if (q !== 0 || qb !== 1) begin
      $display("FAIL: d=0 check failed");
      $finish;
    end

    // Test 4: Hold d at 1
    d = 1; #10;
    if (q !== 1 || qb !== 0) begin
      $display("FAIL: Hold d=1 check failed");
      $finish;
    end

    // Test 5: Hold d at 0
    d = 0; #10;
    if (q !== 0 || qb !== 1) begin
      $display("FAIL: Hold d=0 check failed");
      $finish;
    end

    $display("PASS");
    $finish;
  end

endmodule