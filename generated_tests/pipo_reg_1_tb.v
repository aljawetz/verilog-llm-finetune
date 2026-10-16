`timescale 1ns/1ps

module tb_pipo_reg;

  reg clk;
  reg clear;
  reg [3:0] d;
  wire [3:0] q;

  // Instantiate the module under test (uut)
  pipo_reg uut (
    .clk(clk),
    .clear(clear),
    .d(d),
    .q(q)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
  end

  // Test sequence
  initial begin
    // Initialize signals
    clear = 0;
    d = 4'b0000;

    // Test 1: Check reset functionality
    clear = 1; // Assert clear
    #10; // Wait for one clock cycle
    if (q !== 4'b0000) begin
      $display("FAIL: Reset did not set q to 0000");
      $finish;
    end

    // Test 2: Load data when clear is low
    clear = 0; // Deassert clear
    d = 4'b1010; // Load data
    #10; // Wait for one clock cycle
    if (q !== 4'b1010) begin
      $display("FAIL: q did not load the input data 1010");
      $finish;
    end

    // Test 3: Check reset functionality again
    clear = 1; // Assert clear
    #10; // Wait for one clock cycle
    if (q !== 4'b0000) begin
      $display("FAIL: Reset did not set q to 0000");
      $finish;
    end

    // Test 4: Load another data value
    clear = 0; // Deassert clear
    d = 4'b1111; // Load new data
    #10; // Wait for one clock cycle
    if (q !== 4'b1111) begin
      $display("FAIL: q did not load the input data 1111");
      $finish;
    end

    // Test 5: Check reset functionality once more
    clear = 1; // Assert clear
    #10; // Wait for one clock cycle
    if (q !== 4'b0000) begin
      $display("FAIL: Reset did not set q to 0000");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule