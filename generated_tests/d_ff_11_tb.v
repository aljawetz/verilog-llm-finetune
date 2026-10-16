`timescale 1ns/1ps

module tb_d_ff;

  reg clk;
  reg rst;
  reg d;
  wire q;

  // Instantiate the D flip-flop
  d_ff uut (
    .d(d),
    .clk(clk),
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
    rst = 1;
    d = 0;
    #10; // Wait for 10ns

    // Release reset
    rst = 0;
    #10; // Wait for 10ns

    // Test case 1: Check reset functionality
    d = 1; 
    #10; // Wait for 10ns
    if (q !== 1) begin
      $display("FAIL: q should be 1 after d is set to 1");
      $finish;
    end

    // Test case 2: Check reset functionality
    rst = 1; 
    #10; // Wait for 10ns
    if (q !== 0) begin
      $display("FAIL: q should be 0 after reset is asserted");
      $finish;
    end

    // Test case 3: Check capturing d value
    rst = 0; 
    d = 0; 
    #10; // Wait for 10ns
    if (q !== 0) begin
      $display("FAIL: q should be 0 after d is set to 0");
      $finish;
    end

    // Test case 4: Change d value
    d = 1; 
    #10; // Wait for 10ns
    if (q !== 1) begin
      $display("FAIL: q should be 1 after d is set to 1");
      $finish;
    end

    // Test case 5: Assert reset again
    rst = 1; 
    #10; // Wait for 10ns
    if (q !== 0) begin
      $display("FAIL: q should be 0 after reset is asserted again");
      $finish;
    end

    // Test case 6: Final check with d = 1
    rst = 0; 
    d = 1; 
    #10; // Wait for 10ns
    if (q !== 1) begin
      $display("FAIL: q should be 1 after d is set to 1 again");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule