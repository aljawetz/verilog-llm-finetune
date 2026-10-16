`timescale 1ns/1ps

module tb_io16bit_unq1;

  reg [15:0] p2f_in;
  reg [15:0] f2p_in;
  wire [15:0] p2f_out;
  wire [15:0] f2p_out;

  // Instantiate the module under test (uut)
  io16bit_unq1 uut (
    .p2f_in(p2f_in),
    .p2f_out(p2f_out),
    .f2p_in(f2p_in),
    .f2p_out(f2p_out)
  );

  initial begin
    // Initialize inputs
    p2f_in = 16'h0000;
    f2p_in = 16'h0000;

    // Test sequence
    // Test case 1: Check direct connection from p2f_in to p2f_out
    p2f_in = 16'hA5A5; // Set input
    #10; // Wait for output to stabilize
    if (p2f_out !== 16'hA5A5) begin
      $display("FAIL: Test case 1 failed, expected p2f_out = 16'hA5A5, got p2f_out = %h", p2f_out);
      $finish;
    end

    // Test case 2: Check direct connection from f2p_in to f2p_out
    f2p_in = 16'h5A5A; // Set input
    #10; // Wait for output to stabilize
    if (f2p_out !== 16'h5A5A) begin
      $display("FAIL: Test case 2 failed, expected f2p_out = 16'h5A5A, got f2p_out = %h", f2p_out);
      $finish;
    end

    // Test case 3: Check with another set of values
    p2f_in = 16'hFFFF; // Set input
    f2p_in = 16'h1234; // Set input
    #10; // Wait for output to stabilize
    if (p2f_out !== 16'hFFFF) begin
      $display("FAIL: Test case 3 failed, expected p2f_out = 16'hFFFF, got p2f_out = %h", p2f_out);
      $finish;
    end
    if (f2p_out !== 16'h1234) begin
      $display("FAIL: Test case 3 failed, expected f2p_out = 16'h1234, got f2p_out = %h", f2p_out);
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule