`timescale 1ns/1ps

module tb_mealy_seq_detector;

  reg clk;
  reg reset;
  reg in;
  wire y;

  // Instantiate the module under test (uut)
  mealy_seq_detector uut (
    .clk(clk),
    .reset(reset),
    .in(in),
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
    reset = 1;
    in = 0;
    #10; // Wait for reset to take effect
    reset = 0;

    // Test sequence to detect pattern "110"
    // Expected output y = 1 when the pattern is detected
    // Input sequence: 1, 1, 0 (should detect)
    in = 1; #10; // S0 -> S1
    if (y !== 0) $display("FAIL: Expected y = 0 at state S1");
    
    in = 1; #10; // S1 -> S2
    if (y !== 0) $display("FAIL: Expected y = 0 at state S2");
    
    in = 0; #10; // S2 -> S3
    if (y !== 0) $display("FAIL: Expected y = 0 at state S3");
    
    in = 1; #10; // S3 -> S4
    if (y !== 0) $display("FAIL: Expected y = 0 at state S4");
    
    in = 1; #10; // S4 -> S2, y should be 1
    if (y !== 1) $display("FAIL: Expected y = 1 at state S2 after detecting pattern");

    // Reset and test another sequence
    reset = 1; #10; reset = 0;
    in = 0; #10; // S0
    if (y !== 0) $display("FAIL: Expected y = 0 at state S0 after reset");

    // Input sequence: 1, 1, 0 (should detect again)
    in = 1; #10; // S0 -> S1
    in = 1; #10; // S1 -> S2
    in = 0; #10; // S2 -> S3
    in = 1; #10; // S3 -> S4
    in = 1; #10; // S4 -> S2, y should be 1
    if (y !== 1) $display("FAIL: Expected y = 1 at state S2 after detecting pattern again");

    // Final reset
    reset = 1; #10; reset = 0;
    in = 0; #10; // S0
    if (y !== 0) $display("FAIL: Expected y = 0 at state S0 after final reset");

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule