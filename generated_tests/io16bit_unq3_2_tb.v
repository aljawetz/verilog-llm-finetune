`timescale 1ns/1ps

module tb_io16bit_unq3;

  reg [15:0] p2f_in;
  wire [15:0] p2f_out;
  reg [15:0] f2p_in;
  wire [15:0] f2p_out;

  // Instantiate the module under test (uut)
  io16bit_unq3 uut (
    .p2f_in(p2f_in),
    .p2f_out(p2f_out),
    .f2p_in(f2p_in),
    .f2p_out(f2p_out)
  );

  initial begin
    // Test sequence
    // Test case 1: Check initial values
    p2f_in = 16'h0000;
    f2p_in = 16'h0000;
    #10;
    if (p2f_out !== 16'h0000) begin
      $display("FAIL: p2f_out should be 0 initially");
      $finish;
    end
    if (f2p_out !== 16'h0000) begin
      $display("FAIL: f2p_out should be 0 initially");
      $finish;
    end

    // Test case 2: Check passing of p2f_in
    p2f_in = 16'hA5A5;
    #10;
    if (p2f_out !== 16'hA5A5) begin
      $display("FAIL: p2f_out should be A5A5");
      $finish;
    end

    // Test case 3: Check passing of f2p_in
    f2p_in = 16'h5A5A;
    #10;
    if (f2p_out !== 16'h5A5A) begin
      $display("FAIL: f2p_out should be 5A5A");
      $finish;
    end

    // Test case 4: Check with random values
    p2f_in = 16'hFFFF;
    f2p_in = 16'h1234;
    #10;
    if (p2f_out !== 16'hFFFF) begin
      $display("FAIL: p2f_out should be FFFF");
      $finish;
    end
    if (f2p_out !== 16'h1234) begin
      $display("FAIL: f2p_out should be 1234");
      $finish;
    end

    // Test case 5: Check with zero values
    p2f_in = 16'h0000;
    f2p_in = 16'h0000;
    #10;
    if (p2f_out !== 16'h0000) begin
      $display("FAIL: p2f_out should be 0");
      $finish;
    end
    if (f2p_out !== 16'h0000) begin
      $display("FAIL: f2p_out should be 0");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule