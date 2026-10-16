`timescale 1ns/1ps

module tb_d_ff;

  reg clk;
  reg d;
  reg rst;
  wire q;

  // Instantiate the D flip-flop module
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
    rst = 1;
    d = 0;

    // Wait for a clock edge
    #10;

    // Test reset functionality
    if (q !== 1'b0) begin
      $display("FAIL: Reset did not set q to 0");
      $finish;
    end

    // Release reset
    rst = 0;

    // Test D input propagation
    d = 1;
    #10; // Wait for one clock cycle
    if (q !== 1'b1) begin
      $display("FAIL: q did not match d after clock edge");
      $finish;
    end

    d = 0;
    #10; // Wait for one clock cycle
    if (q !== 1'b0) begin
      $display("FAIL: q did not match d after clock edge");
      $finish;
    end

    // Test reset functionality again
    rst = 1;
    #10; // Wait for one clock cycle
    if (q !== 1'b0) begin
      $display("FAIL: Reset did not set q to 0");
      $finish;
    end

    // End simulation
    $display("PASS");
    $finish;
  end

endmodule