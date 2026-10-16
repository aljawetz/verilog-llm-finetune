`timescale 1ns/1ps

module tb_dff;
  reg clk;
  reg rst;
  reg d;
  wire q;

  // Instantiate the D Flip-Flop
  dff uut (
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
    rst = 1; // Assert reset
    d = 0;

    // Wait for a clock cycle
    #10;
    
    // Check reset functionality
    if (q !== 1'b0) begin
      $display("FAIL: Reset did not set q to 0");
      $finish;
    end
    
    // Release reset
    rst = 0;
    #10; // Wait for a clock cycle

    // Test setting d to 1
    d = 1;
    #10; // Wait for a clock cycle
    if (q !== 1'b1) begin
      $display("FAIL: q did not update to d when d is 1");
      $finish;
    end

    // Test setting d to 0
    d = 0;
    #10; // Wait for a clock cycle
    if (q !== 1'b0) begin
      $display("FAIL: q did not update to d when d is 0");
      $finish;
    end

    // Test reset functionality again
    rst = 1;
    #10; // Wait for a clock cycle
    if (q !== 1'b0) begin
      $display("FAIL: Reset did not set q to 0 after being released");
      $finish;
    end

    // End of test
    $display("PASS");
    $finish;
  end
endmodule