`timescale 1ns/1ps

module tb_day14;

  reg clk;
  reg reset;
  reg serial_in;
  wire seq_det_o;

  // Instantiate the module under test (uut)
  day14 uut (
    .clk(clk),
    .reset(reset),
    .serial_in(serial_in),
    .seq_det_o(seq_det_o)
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
    serial_in = 0;

    // Apply reset
    #2 reset = 1; // Activate reset
    #10 reset = 0; // Deactivate reset

    // Test sequence to check for 10100011
    // Send bits one by one
    #10 serial_in = 1; // 1
    #10 serial_in = 0; // 0
    #10 serial_in = 1; // 1
    #10 serial_in = 0; // 0
    #10 serial_in = 0; // 0
    #10 serial_in = 0; // 0
    #10 serial_in = 1; // 1
    #10 serial_in = 1; // 1

    // Check if the sequence is detected
    #10;
    if (seq_det_o !== 1) begin
      $display("FAIL: Sequence 10100011 not detected");
      $finish;
    end

    // Test with a different sequence
    #10 serial_in = 0; // 0
    #10 serial_in = 1; // 1
    #10 serial_in = 0; // 0
    #10 serial_in = 1; // 1
    #10 serial_in = 0; // 0
    #10 serial_in = 1; // 1
    #10 serial_in = 0; // 0
    #10 serial_in = 1; // 1

    // Check if the sequence is still detected
    #10;
    if (seq_det_o !== 0) begin
      $display("FAIL: Incorrect detection after different sequence");
      $finish;
    end

    // Final reset
    #10 reset = 1; // Activate reset
    #10 reset = 0; // Deactivate reset

    // Send the correct sequence again
    #10 serial_in = 1; // 1
    #10 serial_in = 0; // 0
    #10 serial_in = 1; // 1
    #10 serial_in = 0; // 0
    #10 serial_in = 0; // 0
    #10 serial_in = 0; // 0
    #10 serial_in = 1; // 1
    #10 serial_in = 1; // 1

    // Check if the sequence is detected again
    #10;
    if (seq_det_o !== 1) begin
      $display("FAIL: Sequence 10100011 not detected after reset");
      $finish;
    end

    // If all checks pass
    $display("PASS");
    $finish;
  end

endmodule