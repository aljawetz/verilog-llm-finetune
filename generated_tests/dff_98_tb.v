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
    // Initialize inputs
    d = 0;

    // Wait for the first falling edge
    @(negedge CK);
    #1; // Small delay to ensure q is updated
    if (q !== 0) begin
      $display("FAIL: Initial output q is not 0");
      $finish;
    end

    // Test case 1: Set d to 1
    d = 1;
    @(negedge CK);
    #1;
    if (q !== 1) begin
      $display("FAIL: Output q is not 1 after d is set to 1");
      $finish;
    end

    // Test case 2: Set d to 0
    d = 0;
    @(negedge CK);
    #1;
    if (q !== 0) begin
      $display("FAIL: Output q is not 0 after d is set to 0");
      $finish;
    end

    // Test case 3: Toggle d to 1 again
    d = 1;
    @(negedge CK);
    #1;
    if (q !== 1) begin
      $display("FAIL: Output q is not 1 after d is set to 1 again");
      $finish;
    end

    // Test case 4: Toggle d to 0 again
    d = 0;
    @(negedge CK);
    #1;
    if (q !== 0) begin
      $display("FAIL: Output q is not 0 after d is set to 0 again");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end
endmodule