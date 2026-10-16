`timescale 1ns/1ps

module tb_dff;
  reg CK;
  reg d;
  wire q;

  // Instantiate the D flip-flop
  dff uut (
    .CK(CK),
    .d(d),
    .q(q)
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
    #10; // Wait for the first clock edge

    // Test case 1: Check initial state
    if (q !== 0) begin
      $display("FAIL: Initial state is incorrect");
      $finish;
    end

    // Test case 2: Set d to 1 and check q
    d = 1;
    #10; // Wait for falling edge
    if (q !== 1) begin
      $display("FAIL: q should be 1 after d is set to 1");
      $finish;
    end

    // Test case 3: Set d to 0 and check q
    d = 0;
    #10; // Wait for falling edge
    if (q !== 0) begin
      $display("FAIL: q should be 0 after d is set to 0");
      $finish;
    end

    // Test case 4: Toggle d and check q
    d = 1;
    #10; // Wait for falling edge
    if (q !== 1) begin
      $display("FAIL: q should be 1 after d is toggled to 1");
      $finish;
    end

    d = 0;
    #10; // Wait for falling edge
    if (q !== 0) begin
      $display("FAIL: q should be 0 after d is toggled to 0");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end
endmodule