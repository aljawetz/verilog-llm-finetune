`timescale 1ns/1ps

module tb_Day15_DFF_Async_Reset;

  reg clk;
  reg rst;
  reg [3:0] d;
  wire [3:0] out;

  // Instantiate the module under test (uut)
  Day15_DFF_Async_Reset uut (
    .clk(clk),
    .rst(rst),
    .d(d),
    .out(out)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
  end

  // Test sequence
  initial begin
    // Initialize
    rst = 1; // Assert reset
    d = 4'b1010; // Test data
    #10; // Wait for 10ns

    // Check reset functionality
    if (out !== 4'b0000) begin
      $display("FAIL: Reset did not set output to 0000");
      $finish;
    end

    // Release reset
    rst = 0;
    #10; // Wait for 10ns

    // Check output after releasing reset
    if (out !== 4'b1010) begin
      $display("FAIL: Output did not match input data after reset release");
      $finish;
    end

    // Change input data
    d = 4'b1100;
    #10; // Wait for 10ns

    // Check output after clock edge
    if (out !== 4'b1100) begin
      $display("FAIL: Output did not match new input data after clock edge");
      $finish;
    end

    // Assert reset again
    rst = 1;
    #10; // Wait for 10ns

    // Check output after asserting reset again
    if (out !== 4'b0000) begin
      $display("FAIL: Reset did not set output to 0000 again");
      $finish;
    end

    // Release reset and check again
    rst = 0;
    #10; // Wait for 10ns

    // Check output after releasing reset again
    if (out !== 4'b1100) begin
      $display("FAIL: Output did not match input data after reset release again");
      $finish;
    end

    // If all checks pass
    $display("PASS");
    $finish;
  end

endmodule