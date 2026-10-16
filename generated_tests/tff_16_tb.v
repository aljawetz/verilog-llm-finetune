`timescale 1ns/1ps

module tb_tff;

  reg clk;
  reg rstn;
  reg t;
  wire q;
  wire qbar;

  // Instantiate the module under test (uut)
  tff uut (
    .clk(clk),
    .rstn(rstn),
    .t(t),
    .q(q),
    .qbar(qbar)
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
    #10;
    rstn = 1; // Release reset

    // Test case 1: Check reset functionality
    #10;
    if (q !== 0 || qbar !== 1) begin
      $display("FAIL: Reset did not set q to 0 and qbar to 1");
      $finish;
    end

    // Test case 2: Toggle q when t is high
    t = 1; // Set t high
    #10;
    if (q !== 1 || qbar !== 0) begin
      $display("FAIL: Expected q=1, qbar=0 after toggle");
      $finish;
    end

    #10; // Wait for next clock edge
    if (q !== 0 || qbar !== 1) begin
      $display("FAIL: Expected q=0, qbar=1 after toggle");
      $finish;
    end

    // Test case 3: No toggle when t is low
    t = 0; // Set t low
    #10;
    if (q !== 0 || qbar !== 1) begin
      $display("FAIL: Expected q=0, qbar=1 with t low");
      $finish;
    end

    // Test case 4: Toggle q again when t is high
    t = 1; // Set t high
    #10;
    if (q !== 1 || qbar !== 0) begin
      $display("FAIL: Expected q=1, qbar=0 after toggle");
      $finish;
    end

    // Final check
    #10;
    if (q !== 0 || qbar !== 1) begin
      $display("FAIL: Expected q=0, qbar=1 after toggle");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule