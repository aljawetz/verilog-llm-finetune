`timescale 1ns/1ps

module tb_io16bit_unq4;

  reg [15:0] p2f_in;
  reg [15:0] f2p_in;
  wire [15:0] p2f_out;
  wire [15:0] f2p_out;

  // Instantiate the module under test (uut)
  io16bit_unq4 uut (
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
    // Test case 1: Check initial values
    #10;
    if (p2f_out !== 16'h0000 || f2p_out !== 16'h0000) begin
      $display("FAIL: Initial output values are incorrect");
      $finish;
    end

    // Test case 2: Check p2f_in to p2f_out
    p2f_in = 16'hABCD;
    #10;
    if (p2f_out !== 16'hABCD) begin
      $display("FAIL: p2f_out did not match p2f_in");
      $finish;
    end

    // Test case 3: Check f2p_in to f2p_out
    f2p_in = 16'h1234;
    #10;
    if (f2p_out !== 16'h1234) begin
      $display("FAIL: f2p_out did not match f2p_in");
      $finish;
    end

    // Test case 4: Check another set of values
    p2f_in = 16'hFFFF;
    f2p_in = 16'h0001;
    #10;
    if (p2f_out !== 16'hFFFF || f2p_out !== 16'h0001) begin
      $display("FAIL: Outputs did not match expected values");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule