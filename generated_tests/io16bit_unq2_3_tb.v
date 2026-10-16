`timescale 1ns/1ps

module tb_io16bit_unq2;

  reg [15:0] p2f_in;
  wire [15:0] p2f_out;
  reg [15:0] f2p_in;
  wire [15:0] f2p_out;

  // Instantiate the module under test (uut)
  io16bit_unq2 uut (
    .p2f_in(p2f_in),
    .p2f_out(p2f_out),
    .f2p_in(f2p_in),
    .f2p_out(f2p_out)
  );

  initial begin
    // Test sequence
    // Test case 1: Check direct pass from p2f_in to p2f_out
    p2f_in = 16'hA5A5; // Arbitrary test value
    #10; // Wait for propagation
    if (p2f_out !== 16'hA5A5) begin
      $display("FAIL: p2f_out did not match p2f_in");
      $finish;
    end

    // Test case 2: Check direct pass from f2p_in to f2p_out
    f2p_in = 16'h5A5A; // Arbitrary test value
    #10; // Wait for propagation
    if (f2p_out !== 16'h5A5A) begin
      $display("FAIL: f2p_out did not match f2p_in");
      $finish;
    end

    // Test case 3: Check with another set of values
    p2f_in = 16'hFFFF; // Test with all bits high
    #10; // Wait for propagation
    if (p2f_out !== 16'hFFFF) begin
      $display("FAIL: p2f_out did not match p2f_in for all bits high");
      $finish;
    end

    f2p_in = 16'h0000; // Test with all bits low
    #10; // Wait for propagation
    if (f2p_out !== 16'h0000) begin
      $display("FAIL: f2p_out did not match f2p_in for all bits low");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule