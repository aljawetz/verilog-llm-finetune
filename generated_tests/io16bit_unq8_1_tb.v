`timescale 1ns/1ps

module tb_io16bit_unq8;

  // Inputs
  reg [15:0] p2f_in;
  reg [15:0] f2p_in;

  // Outputs
  wire [15:0] p2f_out;
  wire [15:0] f2p_out;

  // Instantiate the Unit Under Test (UUT)
  io16bit_unq8 uut (
    .p2f_in(p2f_in),
    .p2f_out(p2f_out),
    .f2p_in(f2p_in),
    .f2p_out(f2p_out)
  );

  initial begin
    // Initialize Inputs
    p2f_in = 16'h0000;
    f2p_in = 16'h0000;

    // Test sequence
    #10;
    p2f_in = 16'hA5A5; // Test case 1
    #10;
    if (p2f_out !== 16'hA5A5) begin
      $display("FAIL: p2f_out did not match p2f_in");
      $finish;
    end

    #10;
    f2p_in = 16'h5A5A; // Test case 2
    #10;
    if (f2p_out !== 16'h5A5A) begin
      $display("FAIL: f2p_out did not match f2p_in");
      $finish;
    end

    #10;
    p2f_in = 16'hFFFF; // Test case 3
    #10;
    if (p2f_out !== 16'hFFFF) begin
      $display("FAIL: p2f_out did not match p2f_in");
      $finish;
    end

    #10;
    f2p_in = 16'h1234; // Test case 4
    #10;
    if (f2p_out !== 16'h1234) begin
      $display("FAIL: f2p_out did not match f2p_in");
      $finish;
    end

    // Final check
    #10;
    p2f_in = 16'h0001; // Test case 5
    f2p_in = 16'h0002; 
    #10;
    if (p2f_out !== 16'h0001) begin
      $display("FAIL: p2f_out did not match p2f_in");
      $finish;
    end
    if (f2p_out !== 16'h0002) begin
      $display("FAIL: f2p_out did not match f2p_in");
      $finish;
    end

    $display("PASS");
    $finish;
  end

endmodule