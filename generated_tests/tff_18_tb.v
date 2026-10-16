`timescale 1ns/1ps

module tb_tff;

  reg clk;
  reg rstn;
  reg t;
  wire q;

  // Instantiate the module under test (uut)
  tff uut (
    .clk(clk),
    .rstn(rstn),
    .t(t),
    .q(q)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
  end

  // Test sequence
  initial begin
    // Initialize inputs
    rstn = 0;
    t = 0;

    // Apply reset
    #3;
    rstn = 1; // Release reset

    // Test case 1: Check reset functionality
    #10;
    if (q !== 0) begin
      $display("FAIL: Reset did not set q to 0");
      $finish;
    end

    // Test case 2: Toggle q when t is high
    t = 1; // Set t high
    #10; // Wait for one clock cycle
    if (q !== 1) begin
      $display("FAIL: q did not toggle to 1 when t is high");
      $finish;
    end

    #10; // Wait for another clock cycle
    if (q !== 0) begin
      $display("FAIL: q did not toggle back to 0 when t is high");
      $finish;
    end

    // Test case 3: No toggle when t is low
    t = 0; // Set t low
    #10; // Wait for one clock cycle
    if (q !== 0) begin
      $display("FAIL: q toggled when t is low");
      $finish;
    end

    #10; // Wait for another clock cycle
    if (q !== 0) begin
      $display("FAIL: q changed when t is low");
      $finish;
    end

    // Test case 4: Toggle again with t high
    t = 1; // Set t high
    #10; // Wait for one clock cycle
    if (q !== 1) begin
      $display("FAIL: q did not toggle to 1 when t is high again");
      $finish;
    end

    #10; // Wait for another clock cycle
    if (q !== 0) begin
      $display("FAIL: q did not toggle back to 0 when t is high again");
      $finish;
    end

    // End of tests
    $display("PASS");
    $finish;
  end

endmodule