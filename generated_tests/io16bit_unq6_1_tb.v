`timescale 1ns/1ps

module tb_io16bit_unq6;

  reg [15:0] p2f_in;
  wire [15:0] p2f_out;
  reg [15:0] f2p_in;
  wire [15:0] f2p_out;

  // Instantiate the module under test
  io16bit_unq6 uut (
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
    // Test case 1: Check pass-through for p2f_in
    p2f_in = 16'hA5A5; // Arbitrary test value
    #10;
    if (p2f_out !== 16'hA5A5) begin
      $display("FAIL: p2f_out did not match p2f_in");
      $finish;
    end

    // Test case 2: Check pass-through for f2p_in
    f2p_in = 16'h5A5A; // Arbitrary test value
    #10;
    if (f2p_out !== 16'h5A5A) begin
      $display("FAIL: f2p_out did not match f2p_in");
      $finish;
    end

    // Test case 3: Check another value for p2f_in
    p2f_in = 16'hFFFF; // Maximum value
    #10;
    if (p2f_out !== 16'hFFFF) begin
      $display("FAIL: p2f_out did not match p2f_in for maximum value");
      $finish;
    end

    // Test case 4: Check another value for f2p_in
    f2p_in = 16'h0001; // Minimum non-zero value
    #10;
    if (f2p_out !== 16'h0001) begin
      $display("FAIL: f2p_out did not match f2p_in for minimum non-zero value");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule