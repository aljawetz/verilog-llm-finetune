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

    // Wait for a clock edge
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
      $display("FAIL: D=0 state incorrect");
      $finish;
    end

    // Test D = 1
    d = 1;
    #10;
    if (q !== 1 || qb !== 0) begin
      $display("FAIL: D=1 state incorrect");
      $finish;
    end

    // Test reset again
    rst = 1;
    #10;
    if (q !== 0 || qb !== 1) begin
      $display("FAIL: Reset state incorrect after D=1");
      $finish;
    end

    // Release reset and test D = 1 again
    rst = 0;
    d = 1;
    #10;
    if (q !== 1 || qb !== 0) begin
      $display("FAIL: D=1 state incorrect after reset");
      $finish;
    end

    // Test D = 0 again
    d = 0;
    #10;
    if (q !== 0 || qb !== 1) begin
      $display("FAIL: D=0 state incorrect after D=1");
      $finish;
    end

    // End of tests
    $display("PASS");
    $finish;
  end
endmodule