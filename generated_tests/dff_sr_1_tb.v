`timescale 1ns/1ps

module tb_dff_sr;
  reg d;
  reg clk;
  reg rst;
  wire q;

  // Instantiate the module under test (uut)
  dff_sr uut (
    .q(q),
    .d(d),
    .clk(clk),
    .rst(rst)
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
    rst = 0;

    // Test case 1: Reset the D flip-flop
    rst = 1; // Assert reset
    #10; // Wait for a clock edge
    if (q !== 1'b1) begin
      $display("FAIL: Reset did not set q to 1");
      $finish;
    end

    // Test case 2: Set d to 0 and check q
    rst = 0; // Deassert reset
    d = 0;
    #10; // Wait for a clock edge
    if (q !== 1'b0) begin
      $display("FAIL: q did not follow d when d is 0");
      $finish;
    end

    // Test case 3: Set d to 1 and check q
    d = 1;
    #10; // Wait for a clock edge
    if (q !== 1'b1) begin
      $display("FAIL: q did not follow d when d is 1");
      $finish;
    end

    // Test case 4: Assert reset again
    rst = 1; // Assert reset
    #10; // Wait for a clock edge
    if (q !== 1'b1) begin
      $display("FAIL: Reset did not set q to 1");
      $finish;
    end

    // Test case 5: Deassert reset and check q remains 1
    rst = 0; // Deassert reset
    #10; // Wait for a clock edge
    if (q !== 1'b1) begin
      $display("FAIL: q changed after reset was deasserted");
      $finish;
    end

    // End of test
    $display("PASS");
    $finish;
  end
endmodule