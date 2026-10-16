`timescale 1ns/1ps

module tb_d_flipflop;

  reg d;
  reg clk;
  wire q;
  wire qbar;

  // Instantiate the D flip-flop
  d_flipflop uut (
    .q(q),
    .qbar(qbar),
    .d(d),
    .clk(clk)
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

    // Wait for the first clock edge
    #10;

    // Test case 1: Set d to 1
    d = 1;
    #10; // Wait for clock edge
    if (q !== 1'b1 || qbar !== 1'b0) begin
      $display("FAIL: Test case 1 failed");
      $finish;
    end

    // Test case 2: Set d to 0
    d = 0;
    #10; // Wait for clock edge
    if (q !== 1'b0 || qbar !== 1'b1) begin
      $display("FAIL: Test case 2 failed");
      $finish;
    end

    // Test case 3: Toggle d to 1 again
    d = 1;
    #10; // Wait for clock edge
    if (q !== 1'b1 || qbar !== 1'b0) begin
      $display("FAIL: Test case 3 failed");
      $finish;
    end

    // Test case 4: Toggle d to 0 again
    d = 0;
    #10; // Wait for clock edge
    if (q !== 1'b0 || qbar !== 1'b1) begin
      $display("FAIL: Test case 4 failed");
      $finish;
    end

    // All tests passed
    $display("PASS");
    $finish;
  end

endmodule