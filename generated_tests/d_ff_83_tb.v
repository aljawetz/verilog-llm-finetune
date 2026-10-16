`timescale 1ns/1ps

module tb_d_ff;

  reg clk;
  reg d;
  reg rst;
  wire q;

  // Instantiate the D Flip-Flop
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

    // Release reset
    rst = 0;
    #10;

    // Test case 1: Check reset functionality
    if (q !== 0) begin
      $display("FAIL: Reset did not set q to 0");
      $finish;
    end

    // Test case 2: Check D input propagation
    d = 1; 
    #10; // Wait for one clock cycle
    if (q !== 1) begin
      $display("FAIL: D input did not propagate to q");
      $finish;
    end

    // Test case 3: Check D input changes
    d = 0; 
    #10; // Wait for one clock cycle
    if (q !== 0) begin
      $display("FAIL: D input change did not propagate to q");
      $finish;
    end

    // Test case 4: Check reset during operation
    rst = 1; 
    #10; // Wait for reset to take effect
    if (q !== 0) begin
      $display("FAIL: Reset did not set q to 0 during operation");
      $finish;
    end

    // Test case 5: Check D input after reset
    rst = 0; d = 1; 
    #10; // Wait for one clock cycle
    if (q !== 1) begin
      $display("FAIL: D input did not propagate to q after reset");
      $finish;
    end

    // End of tests
    $display("PASS");
    $finish;
  end

endmodule