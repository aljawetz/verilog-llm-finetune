`timescale 1ns/1ps

module tb_width_8to16;

  reg clk;
  reg rst_n;
  reg valid_in;
  reg [7:0] data_in;
  wire valid_out;
  wire [15:0] data_out;

  // Instantiate the module under test (uut)
  width_8to16 uut (
    .clk(clk),
    .rst_n(rst_n),
    .valid_in(valid_in),
    .data_in(data_in),
    .valid_out(valid_out),
    .data_out(data_out)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
  end

  // Test sequence
  initial begin
    // Reset the DUT
    rst_n = 0;
    valid_in = 0;
    data_in = 8'b0;
    #10;
    
    rst_n = 1; // Release reset
    #10;

    // Test case 1: Valid input sequence
    valid_in = 1;
    data_in = 8'hAA; // First 8-bit input
    #10;

    valid_in = 1;
    data_in = 8'h55; // Second 8-bit input
    #10;

    valid_in = 0; // End of valid inputs
    #10;

    // Check output
    if (valid_out !== 1'b1) begin
      $display("FAIL: valid_out should be high after two valid inputs");
      $finish;
    end

    if (data_out !== 16'hAA55) begin
      $display("FAIL: data_out should be 16'hAA55");
      $finish;
    end

    // Reset and check behavior
    rst_n = 0;
    #10;
    rst_n = 1;
    #10;

    // Test case 2: Single valid input
    valid_in = 1;
    data_in = 8'hFF; // First 8-bit input
    #10;

    valid_in = 0; // No second input
    #10;

    // Check output
    if (valid_out !== 1'b0) begin
      $display("FAIL: valid_out should be low when only one input is valid");
      $finish;
    end

    // Test case 3: Valid input followed by reset
    valid_in = 1;
    data_in = 8'h12; // First 8-bit input
    #10;

    rst_n = 0; // Reset
    #10;
    rst_n = 1; // Release reset
    #10;

    valid_in = 1;
    data_in = 8'h34; // Second 8-bit input
    #10;

    // Check output
    if (valid_out !== 1'b1) begin
      $display("FAIL: valid_out should be high after two valid inputs post-reset");
      $finish;
    end

    if (data_out !== 16'h1234) begin
      $display("FAIL: data_out should be 16'h1234 after reset");
      $finish;
    end

    // Final check
    $display("PASS");
    $finish;
  end

endmodule