`timescale 1ns/1ps

module tb_d_ff;

  reg clk;
  reg d;
  reg rst;
  wire q;

  // Instantiate the D flip-flop
  d_ff uut (
    .clk(clk),
    .d(d),
    .rst(rst),
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
    rst = 1; d = 0;
    #10; // Wait for 10ns

    // Test reset functionality
    if (q !== 1'b0) begin
      $display("FAIL: q should be 0 when rst is high");
      $finish;
    end

    // Release reset
    rst = 0;
    #10; // Wait for 10ns

    // Test D input assignment
    d = 1;
    #10; // Wait for 10ns
    if (q !== 1'b1) begin
      $display("FAIL: q should be 1 when d is 1 and rst is low");
      $finish;
    end

    // Change D input
    d = 0;
    #10; // Wait for 10ns
    if (q !== 1'b0) begin
      $display("FAIL: q should be 0 when d is 0 and rst is low");
      $finish;
    end

    // Test reset again
    rst = 1;
    #10; // Wait for 10ns
    if (q !== 1'b0) begin
      $display("FAIL: q should be 0 when rst is high again");
      $finish;
    end

    // End of test
    $display("PASS");
    $finish;
  end

endmodule