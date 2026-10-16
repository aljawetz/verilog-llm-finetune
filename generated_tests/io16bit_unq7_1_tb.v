`timescale 1ns/1ps

module tb_io16bit_unq7;

  reg [15:0] p2f_in;
  reg [15:0] f2p_in;
  wire [15:0] p2f_out;
  wire [15:0] f2p_out;

  // Instantiate the module under test
  io16bit_unq7 uut (
    .p2f_in(p2f_in),
    .p2f_out(p2f_out),
    .f2p_in(f2p_in),
    .f2p_out(f2p_out)
  );

  initial begin
    // Test sequence
    // Test case 1: Check pass-through from p2f_in to p2f_out
    p2f_in = 16'hA5A5; // Input value
    #10; // Wait for output to settle
    if (p2f_out !== 16'hA5A5) begin
      $display("FAIL: p2f_out did not match p2f_in");
      $finish;
    end

    // Test case 2: Check pass-through from f2p_in to f2p_out
    f2p_in = 16'h5A5A; // Input value
    #10; // Wait for output to settle
    if (f2p_out !== 16'h5A5A) begin
      $display("FAIL: f2p_out did not match f2p_in");
      $finish;
    end

    // Test case 3: Check with zero input
    p2f_in = 16'h0000;
    f2p_in = 16'h0000;
    #10; // Wait for output to settle
    if (p2f_out !== 16'h0000) begin
      $display("FAIL: p2f_out did not match p2f_in for zero input");
      $finish;
    end
    if (f2p_out !== 16'h0000) begin
      $display("FAIL: f2p_out did not match f2p_in for zero input");
      $finish;
    end

    // Test case 4: Check with maximum input
    p2f_in = 16'hFFFF;
    f2p_in = 16'hFFFF;
    #10; // Wait for output to settle
    if (p2f_out !== 16'hFFFF) begin
      $display("FAIL: p2f_out did not match p2f_in for max input");
      $finish;
    end
    if (f2p_out !== 16'hFFFF) begin
      $display("FAIL: f2p_out did not match f2p_in for max input");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule