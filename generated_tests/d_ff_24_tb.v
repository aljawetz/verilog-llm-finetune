`timescale 1ns/1ps

module tb_d_ff;
  reg clk;
  reg rst;
  reg d;
  wire q;

  // Instantiate the D flip-flop
  d_ff uut (
    .clk(clk),
    .rst(rst),
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
    rst = 1; d = 0;
    #10; // Wait for 10ns

    // Test reset functionality
    if (q !== 0) begin
      $display("FAIL: Reset did not set q to 0");
      $finish;
    end

    // Release reset
    rst = 0;
    #10; // Wait for 10ns

    // Test D input functionality
    d = 1; #10; // Wait for 10ns
    if (q !== 1) begin
      $display("FAIL: q did not match d after clock edge");
      $finish;
    end

    d = 0; #10; // Wait for 10ns
    if (q !== 0) begin
      $display("FAIL: q did not match d after clock edge");
      $finish;
    end

    // Test reset again
    rst = 1; #10; // Wait for 10ns
    if (q !== 0) begin
      $display("FAIL: Reset did not set q to 0");
      $finish;
    end

    // End of tests
    $display("PASS");
    $finish;
  end
endmodule