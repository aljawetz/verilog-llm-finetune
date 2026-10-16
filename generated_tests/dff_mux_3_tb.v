`timescale 1ns/1ps

module tb_dff_mux;

  reg d;
  reg clk;
  wire q;
  wire qb;

  // Instantiate the module under test (uut)
  dff_mux uut (
    .d(d),
    .clk(clk),
    .q(q),
    .qb(qb)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
  end

  // Test sequence
  initial begin
    // Initialize inputs
    d = 0;

    // Wait for the clock to stabilize
    #10;

    // Test case 1: Check initial state
    if (q !== 0 || qb !== 1) begin
      $display("FAIL: Initial state check failed");
      $finish;
    end

    // Test case 2: Set d to 1 and check q after clock edge
    d = 1;
    #10; // Wait for one clock cycle
    if (q !== 1 || qb !== 0) begin
      $display("FAIL: q should be 1 after d is set to 1");
      $finish;
    end

    // Test case 3: Set d to 0 and check q after clock edge
    d = 0;
    #10; // Wait for one clock cycle
    if (q !== 0 || qb !== 1) begin
      $display("FAIL: q should be 0 after d is set to 0");
      $finish;
    end

    // Test case 4: Check that q holds its value when d is changed but clk is low
    d = 1;
    #5; // Wait for half a clock cycle
    if (q !== 0 || qb !== 1) begin
      $display("FAIL: q should still be 0 when d is changed but clk is low");
      $finish;
    end

    // Test case 5: Check that q updates on the next rising edge of clk
    #5; // Wait for the next rising edge
    if (q !== 1 || qb !== 0) begin
      $display("FAIL: q should be 1 after the next rising edge of clk");
      $finish;
    end

    // End of test
    $display("PASS");
    $finish;
  end

endmodule