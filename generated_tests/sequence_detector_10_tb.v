`timescale 1ns/1ps

module tb_sequence_detector;
  reg sequence_in;
  reg clock;
  reg reset;
  wire detector_out;

  // Instantiate the module under test (uut)
  sequence_detector uut (
    .sequence_in(sequence_in),
    .clock(clock),
    .reset(reset),
    .detector_out(detector_out)
  );

  // Clock generation
  initial begin
    clock = 0;
    forever #5 clock = ~clock; // 10ns clock period
  end

  // Test sequence
  initial begin
    // Initialize inputs
    reset = 1;
    sequence_in = 0;
    #10; // Wait for reset to take effect
    reset = 0;

    // Test sequence: 1011
    // Expected output: detector_out should be 1 after the last '1'
    sequence_in = 1; #10; // State: One
    sequence_in = 0; #10; // State: OneZero
    sequence_in = 1; #10; // State: OneZeroOne
    sequence_in = 1; #10; // State: OneZeroOneOne
    if (detector_out !== 1) begin
      $display("FAIL: Expected detector_out to be 1 after sequence 1011");
      $finish;
    end

    // Reset and test sequence: 110
    reset = 1; #10; // Reset the state
    reset = 0;
    sequence_in = 1; #10; // State: One
    sequence_in = 1; #10; // State: One
    sequence_in = 0; #10; // State: OneZero
    if (detector_out !== 0) begin
      $display("FAIL: Expected detector_out to be 0 after sequence 110");
      $finish;
    end

    // Reset and test sequence: 101
    reset = 1; #10; // Reset the state
    reset = 0;
    sequence_in = 1; #10; // State: One
    sequence_in = 0; #10; // State: OneZero
    sequence_in = 1; #10; // State: OneZeroOne
    if (detector_out !== 0) begin
      $display("FAIL: Expected detector_out to be 0 after sequence 101");
      $finish;
    end

    // Reset and test sequence: 1011 again
    reset = 1; #10; // Reset the state
    reset = 0;
    sequence_in = 1; #10; // State: One
    sequence_in = 0; #10; // State: OneZero
    sequence_in = 1; #10; // State: OneZeroOne
    sequence_in = 1; #10; // State: OneZeroOneOne
    if (detector_out !== 1) begin
      $display("FAIL: Expected detector_out to be 1 after sequence 1011");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end
endmodule