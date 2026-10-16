`timescale 1ns/1ps

module tb_bad_shift_reg2;

  reg clk;
  reg reset;
  reg d;
  wire dout;

  // Instantiate the module under test (uut)
  bad_shift_reg2 uut (
    .clk(clk),
    .reset(reset),
    .d(d),
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
    reset = 1;
    d = 0;

    // Wait for a few clock cycles
    #10;
    
    // Release reset
    reset = 0;
    #10;

    // Test case 1: Check output after setting d
    d = 1; // Set input
    #10;   // Wait one clock cycle
    if (dout !== 0) begin
      $display("FAIL: Expected dout = 0, got dout = %b", dout);
      $finish;
    end

    // Test case 2: Check output after one clock cycle
    #10;   // Wait one clock cycle
    if (dout !== 1) begin
      $display("FAIL: Expected dout = 1, got dout = %b", dout);
      $finish;
    end

    // Test case 3: Change input d
    d = 0; // Change input
    #10;   // Wait one clock cycle
    if (dout !== 1) begin
      $display("FAIL: Expected dout = 1, got dout = %b", dout);
      $finish;
    end

    // Test case 4: Check output after another clock cycle
    #10;   // Wait one clock cycle
    if (dout !== 0) begin
      $display("FAIL: Expected dout = 0, got dout = %b", dout);
      $finish;
    end

    // Test case 5: Assert reset
    reset = 1; // Assert reset
    #10;       // Wait for reset to take effect
    if (dout !== 0) begin
      $display("FAIL: Expected dout = 0 after reset, got dout = %b", dout);
      $finish;
    end

    // Test case 6: Release reset and check output
    reset = 0; // Release reset
    #10;       // Wait for a clock cycle
    if (dout !== 0) begin
      $display("FAIL: Expected dout = 0 after reset release, got dout = %b", dout);
      $finish;
    end

    // End of tests
    $display("PASS");
    $finish;
  end

endmodule