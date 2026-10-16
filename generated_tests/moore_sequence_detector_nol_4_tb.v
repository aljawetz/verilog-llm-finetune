`timescale 1ns/1ps

module tb_moore_sequence_detector_nol;
  reg clk;
  reg rst;
  reg x;
  wire y;

  // Instantiate the module under test (uut)
  moore_sequence_detector_nol uut (
    .clk(clk),
    .rst(rst),
    .x(x),
    .y(y)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
  end

  // Test sequence
  initial begin
    // Initialize signals
    rst = 0;
    x = 0;

    // Apply reset
    #3 rst = 1; // Release reset after 3ns
    #10; // Wait for a few clock cycles

    // Test sequence: 1101 (Expect y = 1 when in state E)
    x = 1; #10; // State transition to B
    x = 1; #10; // State remains B
    x = 0; #10; // Transition to C
    x = 0; #10; // Transition to D
    x = 1; #10; // Transition to E, y should be 1
    if (y !== 1) begin
      $display("FAIL: Expected y = 1 in state E");
      $finish;
    end

    // Continue to test with more sequences
    x = 0; #10; // Transition back to A
    if (y !== 0) begin
      $display("FAIL: Expected y = 0 in state A");
      $finish;
    end

    x = 1; #10; // Transition to B
    x = 0; #10; // Transition to C
    x = 0; #10; // Transition to D
    x = 1; #10; // Transition to E, y should be 1
    if (y !== 1) begin
      $display("FAIL: Expected y = 1 in state E");
      $finish;
    end

    // Reset the FSM
    rst = 0; #10; // Assert reset
    rst = 1; #10; // Release reset
    if (y !== 0) begin
      $display("FAIL: Expected y = 0 after reset");
      $finish;
    end

    // Final test sequence: 101 (Should not reach state E)
    x = 1; #10; // Transition to B
    x = 0; #10; // Transition to C
    x = 1; #10; // Transition to B
    if (y !== 0) begin
      $display("FAIL: Expected y = 0, did not reach state E");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end
endmodule