`timescale 1ns/1ps

module tb_dff;
  reg clk;
  reg rst;
  reg din;
  wire dout;

  // Instantiate the D flip-flop
  dff uut (
    .clk(clk),
    .rst(rst),
    .din(din),
    .dout(dout)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
  end

  // Test sequence
  initial begin
    // Initialize signals
    rst = 1; // Start with reset
    din = 0;
    #10; // Wait for 10ns

    // Release reset
    rst = 0;
    #10; // Wait for 10ns

    // Test case 1: Check output when din is 0
    din = 0;
    #10; // Wait for 10ns
    if (dout !== 0) begin
      $display("FAIL: Expected dout = 0, got dout = %b", dout);
      $finish;
    end

    // Test case 2: Check output when din is 1
    din = 1;
    #10; // Wait for 10ns
    if (dout !== 1) begin
      $display("FAIL: Expected dout = 1, got dout = %b", dout);
      $finish;
    end

    // Test case 3: Check output after reset
    rst = 1; // Assert reset
    #10; // Wait for 10ns
    if (dout !== 0) begin
      $display("FAIL: Expected dout = 0 after reset, got dout = %b", dout);
      $finish;
    end

    // Test case 4: Check output when din changes after reset
    rst = 0; // Release reset
    din = 1;
    #10; // Wait for 10ns
    if (dout !== 1) begin
      $display("FAIL: Expected dout = 1 after reset release, got dout = %b", dout);
      $finish;
    end

    // Test case 5: Check output when din changes to 0
    din = 0;
    #10; // Wait for 10ns
    if (dout !== 0) begin
      $display("FAIL: Expected dout = 0 after din changes to 0, got dout = %b", dout);
      $finish;
    end

    // End of tests
    $display("PASS");
    $finish;
  end
endmodule