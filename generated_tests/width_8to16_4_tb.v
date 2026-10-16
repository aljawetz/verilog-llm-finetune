`timescale 1ns/1ps

module tb_width_8to16;

  reg clk;
  reg rst_n;
  reg valid_in;
  reg [7:0] data_in;
  wire valid_out;
  wire [15:0] data_out;

  // Instantiate the module under test
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
    // Initialize signals
    rst_n = 0;
    valid_in = 0;
    data_in = 8'b0;

    // Apply reset
    #10;
    rst_n = 1;

    // Test case 1: Send first 8-bit data
    #10;
    valid_in = 1;
    data_in = 8'hAA; // 10101010
    #10;
    valid_in = 0; // Deassert valid_in

    // Test case 2: Send second 8-bit data
    #10;
    valid_in = 1;
    data_in = 8'h55; // 01010101
    #10;
    valid_in = 0; // Deassert valid_in

    // Wait for valid_out to be asserted
    #10;
    if (valid_out !== 1'b0) begin
      $display("FAIL: valid_out should be 0 after second input");
      $finish;
    end

    // Check data_out
    #10;
    if (data_out !== 16'hAA55) begin
      $display("FAIL: data_out should be 0xAA55");
      $finish;
    end

    // Test case 3: Send another pair of data
    #10;
    valid_in = 1;
    data_in = 8'hFF; // 11111111
    #10;
    valid_in = 0; // Deassert valid_in

    #10;
    valid_in = 1;
    data_in = 8'h00; // 00000000
    #10;
    valid_in = 0; // Deassert valid_in

    // Wait for valid_out to be asserted
    #10;
    if (valid_out !== 1'b0) begin
      $display("FAIL: valid_out should be 0 after second input");
      $finish;
    end

    // Check data_out
    #10;
    if (data_out !== 16'hFF00) begin
      $display("FAIL: data_out should be 0xFF00");
      $finish;
    end

    // End of tests
    $display("PASS");
    $finish;
  end

endmodule