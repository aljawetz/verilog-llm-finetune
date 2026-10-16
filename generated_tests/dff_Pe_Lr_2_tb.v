`timescale 1ns/1ps

module tb_dff_Pe_Lr;

  reg d;
  reg clk;
  reg rst;
  wire q;

  // Instantiate the module under test (uut)
  dff_Pe_Lr uut (
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
    // Initialize signals
    rst = 1;
    d = 0;

    // Test 1: Reset the flip-flop
    rst = 0; // Assert reset
    #10; // Wait for a clock cycle
    if (q !== 1'b0) begin
      $display("FAIL: Reset did not set q to 0");
      $finish;
    end

    // Test 2: Set d to 1 and clock
    rst = 1; // Deassert reset
    d = 1; // Set input
    #10; // Wait for a clock cycle
    if (q !== 1'b1) begin
      $display("FAIL: q did not update to d on clock edge");
      $finish;
    end

    // Test 3: Change d to 0 and clock
    d = 0; // Change input
    #10; // Wait for a clock cycle
    if (q !== 1'b0) begin
      $display("FAIL: q did not update to d on clock edge");
      $finish;
    end

    // Test 4: Assert reset again
    rst = 0; // Assert reset
    #10; // Wait for a clock cycle
    if (q !== 1'b0) begin
      $display("FAIL: Reset did not set q to 0");
      $finish;
    end

    // Test 5: Deassert reset and set d to 1
    rst = 1; // Deassert reset
    d = 1; // Set input
    #10; // Wait for a clock cycle
    if (q !== 1'b1) begin
      $display("FAIL: q did not update to d on clock edge");
      $finish;
    end

    // Test 6: Final check with d = 0
    d = 0; // Change input
    #10; // Wait for a clock cycle
    if (q !== 1'b0) begin
      $display("FAIL: q did not update to d on clock edge");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule