`timescale 1ns/1ps

module tb_io16bit_unq4;

  // Inputs
  reg [15:0] p2f_in;
  reg [15:0] f2p_in;

  // Outputs
  wire [15:0] p2f_out;
  wire [15:0] f2p_out;

  // Instantiate the Unit Under Test (UUT)
  io16bit_unq4 uut (
    .p2f_in(p2f_in),
    .p2f_out(p2f_out),
    .f2p_in(f2p_in),
    .f2p_out(f2p_out)
  );

  initial begin
    // Initialize Inputs
    p2f_in = 16'h0000;
    f2p_in = 16'h0000;

    // Test Case 1: Check pass-through for p2f_in
    p2f_in = 16'hA5A5; // Test data
    #10; // Wait for output to stabilize
    if (p2f_out !== 16'hA5A5) begin
      $display("FAIL: p2f_out did not match p2f_in");
      $finish;
    end

    // Test Case 2: Check pass-through for f2p_in
    f2p_in = 16'h5A5A; // Test data
    #10; // Wait for output to stabilize
    if (f2p_out !== 16'h5A5A) begin
      $display("FAIL: f2p_out did not match f2p_in");
      $finish;
    end

    // Test Case 3: Check with another set of data
    p2f_in = 16'hFFFF; // Test data
    f2p_in = 16'h1234; // Test data
    #10; // Wait for output to stabilize
    if (p2f_out !== 16'hFFFF) begin
      $display("FAIL: p2f_out did not match p2f_in on second test");
      $finish;
    end
    if (f2p_out !== 16'h1234) begin
      $display("FAIL: f2p_out did not match f2p_in on second test");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule