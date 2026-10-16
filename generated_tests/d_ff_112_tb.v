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
    // Initialize signals
    rst = 1; d = 0;
    #10; // Wait for 10ns

    // Test reset functionality
    rst = 1; // Assert reset
    #10; // Wait for 10ns
    if (q !== 1'b0) begin
      $display("FAIL: Reset did not set q to 0");
      $finish;
    end

    // Release reset and test D input
    rst = 0; d = 1;
    #10; // Wait for 10ns
    if (q !== 1'b1) begin
      $display("FAIL: q did not capture d on falling edge");
      $finish;
    end

    // Change D input and check
    d = 0;
    #10; // Wait for 10ns
    if (q !== 1'b0) begin
      $display("FAIL: q did not capture new d on falling edge");
      $finish;
    end

    // Test reset again
    rst = 1; 
    #10; // Wait for 10ns
    if (q !== 1'b0) begin
      $display("FAIL: Reset did not set q to 0 again");
      $finish;
    end

    // Finalize
    $display("PASS");
    $finish;
  end

endmodule