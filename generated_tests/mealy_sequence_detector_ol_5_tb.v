`timescale 1ns/1ps

module tb_mealy_sequence_detector_ol;
  reg clk;
  reg rst_n;
  reg x;
  wire z;

  // Instantiate the module under test (uut)
  mealy_sequence_detector_ol uut (
    .clk(clk),
    .rst_n(rst_n),
    .x(x),
    .z(z)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
  end

  // Test sequence
  initial begin
    // Initialize signals
    rst_n = 0;
    x = 0;
    #10; // Wait for reset to take effect

    // Release reset
    rst_n = 1;
    #10;

    // Test sequence: 1, 0, 1, 1, 0 (should detect the sequence)
    x = 1; #10; // State B
    if (uut.state !== 4'h2) $display("FAIL: Expected state B after input 1");
    
    x = 0; #10; // State C
    if (uut.state !== 4'h3) $display("FAIL: Expected state C after input 0");
    
    x = 1; #10; // State D
    if (uut.state !== 4'h4) $display("FAIL: Expected state D after input 1");
    
    x = 0; #10; // Back to State C
    if (uut.state !== 4'h3) $display("FAIL: Expected state C after input 0");
    
    // Check output z
    if (uut.z !== 1) $display("FAIL: Expected output z to be 1 in state D");
    
    // Continue with overlapping sequence
    x = 1; #10; // State B
    if (uut.state !== 4'h2) $display("FAIL: Expected state B after input 1");
    
    x = 1; #10; // Stay in State B
    if (uut.state !== 4'h2) $display("FAIL: Expected state B after input 1");
    
    x = 0; #10; // State C
    if (uut.state !== 4'h3) $display("FAIL: Expected state C after input 0");
    
    x = 1; #10; // State D
    if (uut.state !== 4'h4) $display("FAIL: Expected state D after input 1");
    
    // Final check for output z
    if (uut.z !== 1) $display("FAIL: Expected output z to be 1 in state D");

    // If all checks pass
    $display("PASS");
    $finish;
  end
endmodule