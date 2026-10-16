`timescale 1ns/1ps

module tb_piso;
  reg clk;
  reg enable;
  reg rst;
  reg [3:0] data;
  wire out;

  // Instantiate the module under test
  piso uut (
    .clk(clk),
    .enable(enable),
    .rst(rst),
    .data(data),
    .out(out)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
  end

  // Test sequence
  initial begin
    // Initialize signals
    rst = 1;
    enable = 0;
    data = 4'b1010; // Test data

    // Apply reset
    #10;
    rst = 0;

    // Test case 1: Check output when enable is low
    #10;
    if (out !== 1'b0) begin
      $display("FAIL: Output should be 0 when enable is low");
      $finish;
    end

    // Test case 2: Enable shifting
    enable = 1;

    // Shift data out
    #10;
    if (out !== 1'b0) begin
      $display("FAIL: Output should be 0 (first bit of 1010)");
      $finish;
    end

    #10;
    if (out !== 1'b1) begin
      $display("FAIL: Output should be 1 (second bit of 1010)");
      $finish;
    end

    #10;
    if (out !== 1'b0) begin
      $display("FAIL: Output should be 0 (third bit of 1010)");
      $finish;
    end

    #10;
    if (out !== 1'b1) begin
      $display("FAIL: Output should be 1 (fourth bit of 1010)");
      $finish;
    end

    // Test case 3: Check reset functionality
    #10;
    rst = 1; // Assert reset
    #10;
    rst = 0; // Deassert reset

    // Check output after reset
    if (out !== 1'b0) begin
      $display("FAIL: Output should be 0 after reset");
      $finish;
    end

    // End of test
    $display("PASS");
    $finish;
  end
endmodule