`timescale 1ns/1ps

module tb_dff;
  reg CK;
  reg d;
  wire q;

  // Instantiate the D Flip-Flop
  dff uut (
    .CK(CK),
    .q(q),
    .d(d)
  );

  // Clock generation
  initial begin
    CK = 0;
    forever #5 CK = ~CK; // 10ns clock period
  end

  // Test sequence
  initial begin
    // Initialize
    d = 0;
    #10; // Wait for one clock cycle

    // Test case 1: Set d = 1, expect q = 1 after clock
    d = 1;
    #10; // Wait for one clock cycle
    if (q !== 1) begin
      $display("FAIL: Test case 1 failed, expected q = 1, got q = %b", q);
      $finish;
    end

    // Test case 2: Set d = 0, expect q = 0 after clock
    d = 0;
    #10; // Wait for one clock cycle
    if (q !== 0) begin
      $display("FAIL: Test case 2 failed, expected q = 0, got q = %b", q);
      $finish;
    end

    // Test case 3: Toggle d = 1, expect q = 1 after clock
    d = 1;
    #10; // Wait for one clock cycle
    if (q !== 1) begin
      $display("FAIL: Test case 3 failed, expected q = 1, got q = %b", q);
      $finish;
    end

    // Test case 4: Toggle d = 0, expect q = 0 after clock
    d = 0;
    #10; // Wait for one clock cycle
    if (q !== 0) begin
      $display("FAIL: Test case 4 failed, expected q = 0, got q = %b", q);
      $finish;
    end

    // Test case 5: Set d = 1 again, expect q = 1 after clock
    d = 1;
    #10; // Wait for one clock cycle
    if (q !== 1) begin
      $display("FAIL: Test case 5 failed, expected q = 1, got q = %b", q);
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end
endmodule