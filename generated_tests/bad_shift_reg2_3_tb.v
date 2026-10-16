`timescale 1ns/1ps

module tb_bad_shift_reg2;

  reg clk;
  reg reset;
  reg d;
  wire dout;

  // Instantiate the module under test
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
    #10; // Wait for 10ns

    // Release reset
    reset = 0;
    #10;

    // Test case 1: Check output after first input
    d = 1; 
    #10; // Wait for one clock cycle
    if (dout !== 0) begin
      $display("FAIL: Expected dout = 0, got dout = %b", dout);
      $finish;
    end

    // Test case 2: Check output after second input
    #10; // Wait for one clock cycle
    if (dout !== 1) begin
      $display("FAIL: Expected dout = 1, got dout = %b", dout);
      $finish;
    end

    // Test case 3: Check output after changing input
    d = 0; 
    #10; // Wait for one clock cycle
    if (dout !== 1) begin
      $display("FAIL: Expected dout = 1, got dout = %b", dout);
      $finish;
    end

    // Test case 4: Check output after another clock cycle
    #10; // Wait for one clock cycle
    if (dout !== 0) begin
      $display("FAIL: Expected dout = 0, got dout = %b", dout);
      $finish;
    end

    // Test case 5: Test reset functionality
    reset = 1; 
    #10; // Wait for reset to take effect
    if (dout !== 0) begin
      $display("FAIL: Expected dout = 0 after reset, got dout = %b", dout);
      $finish;
    end

    // Test case 6: Check output after reset and new input
    reset = 0; 
    d = 1; 
    #10; // Wait for one clock cycle
    if (dout !== 0) begin
      $display("FAIL: Expected dout = 0, got dout = %b", dout);
      $finish;
    end

    // Final check after another clock cycle
    #10; // Wait for one clock cycle
    if (dout !== 1) begin
      $display("FAIL: Expected dout = 1, got dout = %b", dout);
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule