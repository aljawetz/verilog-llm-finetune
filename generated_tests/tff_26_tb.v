`timescale 1ns/1ps

module tb_tff;
  reg t;
  reg rst;
  reg clk;
  wire Q;

  // Instantiate the module under test (uut)
  tff uut (
    .t(t),
    .rst(rst),
    .clk(clk),
    .Q(Q)
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
    t = 0; 
    #10; // Wait for 10ns

    // Release reset
    rst = 0; 
    #10; // Wait for 10ns

    // Test case 1: Toggle Q when t is high
    t = 1; 
    #10; // Wait for 10ns
    if (Q !== 1'b1) begin
      $display("FAIL: Expected Q to be 1 after toggling with t=1");
      $finish;
    end

    // Test case 2: No toggle when t is low
    t = 0; 
    #10; // Wait for 10ns
    if (Q !== 1'b1) begin
      $display("FAIL: Expected Q to remain 1 with t=0");
      $finish;
    end

    // Test case 3: Toggle Q again
    t = 1; 
    #10; // Wait for 10ns
    if (Q !== 1'b0) begin
      $display("FAIL: Expected Q to be 0 after toggling with t=1");
      $finish;
    end

    // Test case 4: Reset the flip-flop
    rst = 1; 
    #10; // Wait for 10ns
    if (Q !== 1'b0) begin
      $display("FAIL: Expected Q to be 0 after reset");
      $finish;
    end

    // Test case 5: Release reset and toggle
    rst = 0; 
    t = 1; 
    #10; // Wait for 10ns
    if (Q !== 1'b1) begin
      $display("FAIL: Expected Q to be 1 after toggling with t=1");
      $finish;
    end

    // End of test
    $display("PASS");
    $finish;
  end
endmodule