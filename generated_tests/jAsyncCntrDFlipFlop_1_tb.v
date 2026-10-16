`timescale 1ns/1ps

module tb_jAsyncCntrDFlipFlop;

  reg clk;
  reg rst;
  reg d;
  wire q;
  wire qbar;

  // Instantiate the module under test (uut)
  jAsyncCntrDFlipFlop uut (
    .q(q),
    .qbar(qbar),
    .clk(clk),
    .rst(rst),
    .d(d)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
  end

  // Test sequence
  initial begin
    // Initialize inputs
    rst = 1; // Assert reset
    d = 0;
    #10; // Wait for 10ns
    rst = 0; // Deassert reset

    // Test 1: Check reset functionality
    if (q !== 0 || qbar !== 1) begin
      $display("FAIL: Reset did not set q to 0 and qbar to 1");
      $finish;
    end

    // Test 2: Check D flip-flop functionality
    d = 1; // Set D to 1
    #10; // Wait for one clock cycle
    if (q !== 1 || qbar !== 0) begin
      $display("FAIL: After setting D to 1, q should be 1 and qbar should be 0");
      $finish;
    end

    d = 0; // Set D to 0
    #10; // Wait for one clock cycle
    if (q !== 0 || qbar !== 1) begin
      $display("FAIL: After setting D to 0, q should be 0 and qbar should be 1");
      $finish;
    end

    // Test 3: Check reset functionality again
    rst = 1; // Assert reset
    #10; // Wait for 10ns
    if (q !== 0 || qbar !== 1) begin
      $display("FAIL: Reset did not set q to 0 and qbar to 1 again");
      $finish;
    end

    // Test 4: Check D flip-flop functionality with multiple transitions
    rst = 0; // Deassert reset
    d = 1; #10; // Set D to 1
    d = 0; #10; // Set D to 0
    d = 1; #10; // Set D to 1
    if (q !== 1 || qbar !== 0) begin
      $display("FAIL: Final state should be q=1 and qbar=0 after multiple transitions");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule