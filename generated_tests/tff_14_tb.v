`timescale 1ns/1ps

module tb_tff;

  // Inputs
  reg t;
  reg clock;
  reg rst;

  // Outputs
  wire q;
  wire qbar;

  // Instantiate the Unit Under Test (UUT)
  tff uut (
    .q(q),
    .qbar(qbar),
    .t(t),
    .clock(clock),
    .rst(rst)
  );

  // Clock generation
  initial begin
    clock = 0;
    forever #5 clock = ~clock; // 10ns clock period
  end

  // Test sequence
  initial begin
    // Initialize inputs
    rst = 1;
    t = 0;

    // Wait for the clock to stabilize
    #10;

    // Test 1: Reset functionality
    rst = 0; // Active low reset
    #10;
    if (q !== 0 || qbar !== 1) begin
      $display("FAIL: Reset did not set q to 0 and qbar to 1");
      $finish;
    end

    // Test 2: Toggle when t is high
    rst = 1; // Deactivate reset
    t = 1;   // Set t high
    #10;     // Wait for one clock cycle
    if (q !== 1 || qbar !== 0) begin
      $display("FAIL: q did not toggle to 1 when t is high");
      $finish;
    end

    #10;     // Wait for another clock cycle
    if (q !== 0 || qbar !== 1) begin
      $display("FAIL: q did not toggle back to 0");
      $finish;
    end

    // Test 3: No toggle when t is low
    t = 0;   // Set t low
    #10;     // Wait for one clock cycle
    if (q !== 0 || qbar !== 1) begin
      $display("FAIL: q should remain 0 when t is low");
      $finish;
    end

    #10;     // Wait for another clock cycle
    if (q !== 0 || qbar !== 1) begin
      $display("FAIL: q should still remain 0 when t is low");
      $finish;
    end

    // Test 4: Toggle again when t is high
    t = 1;   // Set t high
    #10;     // Wait for one clock cycle
    if (q !== 1 || qbar !== 0) begin
      $display("FAIL: q did not toggle to 1 when t is high again");
      $finish;
    end

    // End of tests
    $display("PASS");
    $finish;
  end

endmodule