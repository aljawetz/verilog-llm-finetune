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
    // Initialize
    d = 0;
    #10; // Wait for a clock cycle

    // Test 1: Check initial state
    if (q !== 0 || qb !== 1) begin
      $display("FAIL: Initial state check failed");
      $finish;
    end

    // Test 2: Set d to 1 and check q
    d = 1;
    #10; // Wait for a clock cycle
    if (q !== 1 || qb !== 0) begin
      $display("FAIL: d=1 check failed");
      $finish;
    end

    // Test 3: Clock low, check q remains the same
    clk = 0; // Ensure clock is low
    #10; // Wait for a clock cycle
    if (q !== 1 || qb !== 0) begin
      $display("FAIL: q should remain 1 when clk is low");
      $finish;
    end

    // Test 4: Set d to 0 and check q
    d = 0;
    clk = 1; // Set clock high
    #10; // Wait for a clock cycle
    if (q !== 0 || qb !== 1) begin
      $display("FAIL: d=0 check failed");
      $finish;
    end

    // Test 5: Clock low, check q remains the same
    clk = 0; // Ensure clock is low
    #10; // Wait for a clock cycle
    if (q !== 0 || qb !== 1) begin
      $display("FAIL: q should remain 0 when clk is low");
      $finish;
    end

    // Test 6: Set d to 1 again and check q
    d = 1;
    clk = 1; // Set clock high
    #10; // Wait for a clock cycle
    if (q !== 1 || qb !== 0) begin
      $display("FAIL: d=1 check failed after reset");
      $finish;
    end

    // End of tests
    $display("PASS");
    $finish;
  end

endmodule