`timescale 1ns/1ps

module tb_siso;
  reg clk;
  reg rst;
  reg a;
  wire q;

  // Instantiate the module under test (uut)
  siso uut (
    .clk(clk),
    .rst(rst),
    .a(a),
    .q(q)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
  end

  // Test sequence
  initial begin
    // Initialize inputs
    rst = 1; // Start with reset
    a = 0;
    #10; // Wait for 10ns

    // Check reset behavior
    if (q !== 1'b0) begin
      $display("FAIL: q should be 0 when rst is high");
      $finish;
    end

    // Release reset
    rst = 0;
    #10; // Wait for 10ns

    // Test with a = 1
    a = 1;
    #10; // Wait for 10ns
    if (q !== 1'b1) begin
      $display("FAIL: q should be 1 when a is 1 and clk rises");
      $finish;
    end

    // Test with a = 0
    a = 0;
    #10; // Wait for 10ns
    if (q !== 1'b0) begin
      $display("FAIL: q should be 0 when a is 0 and clk rises");
      $finish;
    end

    // Test reset again
    rst = 1;
    #10; // Wait for 10ns
    if (q !== 1'b0) begin
      $display("FAIL: q should be 0 when rst is high again");
      $finish;
    end

    // Release reset and test with a = 1 again
    rst = 0;
    a = 1;
    #10; // Wait for 10ns
    if (q !== 1'b1) begin
      $display("FAIL: q should be 1 when a is 1 and clk rises after reset");
      $finish;
    end

    // Final check
    $display("PASS");
    $finish;
  end
endmodule