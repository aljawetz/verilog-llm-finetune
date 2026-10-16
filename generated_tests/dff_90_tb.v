`timescale 1ns/1ps

module tb_dff;
  reg clk;
  reg d;
  reg rst;
  wire q;
  wire qb;

  // Instantiate the D flip-flop module
  dff uut (
    .clk(clk),
    .d(d),
    .rst(rst),
    .q(q),
    .qb(qb)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
  end

  // Test sequence
  initial begin
    // Initialize inputs
    rst = 1; // Start with reset active
    d = 0;

    // Wait for a clock cycle
    #10;
    if (q !== 0 || qb !== 1) begin
      $display("FAIL: Initial reset state incorrect");
      $finish;
    end

    // Release reset
    rst = 0;
    #10;

    // Test D = 0
    d = 0;
    #10;
    if (q !== 0 || qb !== 1) begin
      $display("FAIL: Output incorrect for D=0");
      $finish;
    end

    // Test D = 1
    d = 1;
    #10;
    if (q !== 1 || qb !== 0) begin
      $display("FAIL: Output incorrect for D=1");
      $finish;
    end

    // Test D = 0 again
    d = 0;
    #10;
    if (q !== 0 || qb !== 1) begin
      $display("FAIL: Output incorrect for D=0");
      $finish;
    end

    // Assert reset functionality
    rst = 1; // Activate reset
    #10;
    if (q !== 0 || qb !== 1) begin
      $display("FAIL: Output incorrect after reset");
      $finish;
    end

    // Release reset and test again
    rst = 0;
    #10;
    d = 1; // Set D to 1
    #10;
    if (q !== 1 || qb !== 0) begin
      $display("FAIL: Output incorrect for D=1 after reset");
      $finish;
    end

    // Final check
    d = 0; // Set D to 0
    #10;
    if (q !== 0 || qb !== 1) begin
      $display("FAIL: Output incorrect for D=0 after reset");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end
endmodule