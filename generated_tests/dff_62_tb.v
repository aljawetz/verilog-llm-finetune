`timescale 1ns/1ps

module tb_dff;
  reg d;
  reg clock;
  wire qbar;
  wire q;

  // Instantiate the D flip-flop
  dff uut (
    .qbar(qbar),
    .q(q),
    .d(d),
    .clock(clock)
  );

  // Clock generation
  initial begin
    clock = 0;
    forever #5 clock = ~clock; // 10ns clock period
  end

  // Test sequence
  initial begin
    // Initialize
    d = 0;
    #10; // Wait for the first clock edge

    // Test case 1: Check initial state
    if (q !== 0 || qbar !== 1) begin
      $display("FAIL: Initial state check failed");
      $finish;
    end

    // Test case 2: Set d to 1
    d = 1;
    #10; // Wait for the next clock edge
    if (q !== 1 || qbar !== 0) begin
      $display("FAIL: d=1 check failed");
      $finish;
    end

    // Test case 3: Set d to 0
    d = 0;
    #10; // Wait for the next clock edge
    if (q !== 0 || qbar !== 1) begin
      $display("FAIL: d=0 check failed");
      $finish;
    end

    // Test case 4: Toggle d to 1 again
    d = 1;
    #10; // Wait for the next clock edge
    if (q !== 1 || qbar !== 0) begin
      $display("FAIL: d=1 check after reset failed");
      $finish;
    end

    // Test case 5: Hold d at 1
    #10; // Wait for the next clock edge
    if (q !== 1 || qbar !== 0) begin
      $display("FAIL: Holding d=1 check failed");
      $finish;
    end

    // Test case 6: Set d to 0 again
    d = 0;
    #10; // Wait for the next clock edge
    if (q !== 0 || qbar !== 1) begin
      $display("FAIL: d=0 check after holding failed");
      $finish;
    end

    // End of tests
    $display("PASS");
    $finish;
  end
endmodule