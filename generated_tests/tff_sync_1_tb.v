`timescale 1ns/1ps

module tb_tff_sync;

  // Inputs
  reg t;
  reg clk;
  reg rst;

  // Outputs
  wire q;
  wire qb;

  // Instantiate the Unit Under Test (UUT)
  tff_sync uut (
    .t(t),
    .clk(clk),
    .rst(rst),
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
    rst = 1; t = 0;
    #10; // Wait for a clock cycle
    rst = 0; // Release reset

    // Test 1: Check reset functionality
    #10;
    if (q !== 0 || qb !== 1) begin
      $display("FAIL: Reset did not set q to 0 and qb to 1");
      $finish;
    end

    // Test 2: Toggle q when t is high
    t = 1; // Set t high
    #10; // Wait for a clock cycle
    if (q !== 1 || qb !== 0) begin
      $display("FAIL: q did not toggle to 1 when t is high");
      $finish;
    end

    #10; // Wait for another clock cycle
    if (q !== 0 || qb !== 1) begin
      $display("FAIL: q did not toggle back to 0");
      $finish;
    end

    // Test 3: No toggle when t is low
    t = 0; // Set t low
    #10; // Wait for a clock cycle
    if (q !== 0 || qb !== 1) begin
      $display("FAIL: q toggled when t is low");
      $finish;
    end

    #10; // Wait for another clock cycle
    if (q !== 0 || qb !== 1) begin
      $display("FAIL: q did not remain 0 when t is low");
      $finish;
    end

    // Test 4: Toggle again with t high
    t = 1; // Set t high
    #10; // Wait for a clock cycle
    if (q !== 1 || qb !== 0) begin
      $display("FAIL: q did not toggle to 1 again when t is high");
      $finish;
    end

    // Final check
    #10; // Wait for another clock cycle
    if (q !== 0 || qb !== 1) begin
      $display("FAIL: q did not toggle back to 0 again");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule