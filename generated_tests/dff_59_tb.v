`timescale 1ns/1ps

module tb_dff;
  reg clk;
  reg rst;
  reg d;
  wire q;

  // Instantiate the D flip-flop
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
    rst = 1;
    d = 0;

    // Wait for a clock edge
    #10;
    
    // Test 1: Check reset functionality
    if (q !== 0) begin
      $display("FAIL: Reset did not set output to 0");
      $finish;
    end

    // Release reset
    rst = 0;
    #10;

    // Test 2: Check D input functionality
    d = 1; 
    #10; // Wait for clock edge
    if (q !== 1) begin
      $display("FAIL: Output did not follow D input");
      $finish;
    end

    // Test 3: Change D input
    d = 0; 
    #10; // Wait for clock edge
    if (q !== 0) begin
      $display("FAIL: Output did not follow D input after change");
      $finish;
    end

    // Test 4: Assert reset again
    rst = 1; 
    #10; // Wait for clock edge
    if (q !== 0) begin
      $display("FAIL: Reset did not set output to 0 again");
      $finish;
    end

    // Test 5: Check D input after reset
    rst = 0; 
    d = 1; 
    #10; // Wait for clock edge
    if (q !== 1) begin
      $display("FAIL: Output did not follow D input after reset");
      $finish;
    end

    // End of tests
    $display("PASS");
    $finish;
  end
endmodule