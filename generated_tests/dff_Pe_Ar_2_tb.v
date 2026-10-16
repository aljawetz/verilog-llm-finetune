`timescale 1ns/1ps

module tb_dff_Pe_Ar;

  reg d;
  reg clk;
  reg rst;
  wire q;

  // Instantiate the module under test (uut)
  dff_Pe_Ar uut (
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

    // Test 1: Check reset functionality
    rst = 1; // Assert reset
    #10; // Wait for a clock edge
    if (q !== 1'b0) begin
      $display("FAIL: Reset did not set q to 0");
      $finish;
    end

    // Test 2: Check D flip-flop functionality
    rst = 0; // Deassert reset
    d = 1; // Set d to 1
    #10; // Wait for a clock edge
    if (q !== 1'b1) begin
      $display("FAIL: q did not follow d on rising edge of clk");
      $finish;
    end

    // Test 3: Change d and check q
    d = 0; // Change d to 0
    #10; // Wait for a clock edge
    if (q !== 1'b0) begin
      $display("FAIL: q did not follow d on rising edge of clk");
      $finish;
    end

    // Test 4: Assert reset again
    rst = 1; // Assert reset
    #10; // Wait for a clock edge
    if (q !== 1'b0) begin
      $display("FAIL: Reset did not set q to 0");
      $finish;
    end

    // Test 5: Check that q follows d after reset
    rst = 0; // Deassert reset
    d = 1; // Set d to 1
    #10; // Wait for a clock edge
    if (q !== 1'b1) begin
      $display("FAIL: q did not follow d on rising edge of clk");
      $finish;
    end

    // End of tests
    $display("PASS");
    $finish;
  end

endmodule