`timescale 1ns/1ps

module tb_io16bit_unq3;

  // Inputs
  reg [15:0] p2f_in;
  reg [15:0] f2p_in;

  // Outputs
  wire [15:0] p2f_out;
  wire [15:0] f2p_out;

  // Instantiate the Unit Under Test (UUT)
  io16bit_unq3 uut (
    .p2f_in(p2f_in),
    .p2f_out(p2f_out),
    .f2p_in(f2p_in),
    .f2p_out(f2p_out)
  );

  // Clock and reset generation
  reg clk;
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 100MHz clock
  end

  initial begin
    // Initialize inputs
    p2f_in = 16'h0000;
    f2p_in = 16'h0000;

    // Test sequence
    #10;
    p2f_in = 16'hA5A5; // Test case 1
    f2p_in = 16'h5A5A; // Test case 1
    #10;
    if (p2f_out !== 16'hA5A5) begin
      $display("FAIL: p2f_out did not match p2f_in");
      $finish;
    end
    if (f2p_out !== 16'h5A5A) begin
      $display("FAIL: f2p_out did not match f2p_in");
      $finish;
    end

    #10;
    p2f_in = 16'hFFFF; // Test case 2
    f2p_in = 16'h0000; // Test case 2
    #10;
    if (p2f_out !== 16'hFFFF) begin
      $display("FAIL: p2f_out did not match p2f_in");
      $finish;
    end
    if (f2p_out !== 16'h0000) begin
      $display("FAIL: f2p_out did not match f2p_in");
      $finish;
    end

    #10;
    p2f_in = 16'h1234; // Test case 3
    f2p_in = 16'h5678; // Test case 3
    #10;
    if (p2f_out !== 16'h1234) begin
      $display("FAIL: p2f_out did not match p2f_in");
      $finish;
    end
    if (f2p_out !== 16'h5678) begin
      $display("FAIL: f2p_out did not match f2p_in");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule