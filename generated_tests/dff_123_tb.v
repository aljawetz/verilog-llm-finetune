`timescale 1ns/1ps

module tb_dff;

  reg clk;
  reg reset;
  reg d;
  wire q;

  // Instantiate the D flip-flop
  dff uut (
    .clk(clk),
    .reset(reset),
    .d(d),
    .q(q)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
  end

  // Test sequence
  initial begin
    // Initialize signals
    reset = 0;
    d = 0;

    // Test 1: Reset the flip-flop
    reset = 1; // Assert reset
    #10; // Wait for a clock edge
    reset = 0; // Deassert reset
    #10; // Wait for a clock edge
    if (q !== 1'b0) begin
      $display("FAIL: Reset did not set q to 0");
      $finish;
    end

    // Test 2: Set d to 1 and check q
    d = 1;
    #10; // Wait for a clock edge
    if (q !== 1'b1) begin
      $display("FAIL: q did not update to d on clock edge");
      $finish;
    end

    // Test 3: Change d to 0 and check q
    d = 0;
    #10; // Wait for a clock edge
    if (q !== 1'b0) begin
      $display("FAIL: q did not update to d on clock edge");
      $finish;
    end

    // Test 4: Assert reset again
    reset = 1; // Assert reset
    #10; // Wait for a clock edge
    if (q !== 1'b0) begin
      $display("FAIL: Reset did not set q to 0");
      $finish;
    end

    // Test 5: Check behavior with reset deasserted
    reset = 0; // Deassert reset
    d = 1;
    #10; // Wait for a clock edge
    if (q !== 1'b1) begin
      $display("FAIL: q did not update to d on clock edge");
      $finish;
    end

    // End of tests
    $display("PASS");
    $finish;
  end

endmodule