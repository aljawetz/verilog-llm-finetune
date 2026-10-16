`timescale 1ns/1ps

module tb_t_ff;

  reg t;
  reg clk;
  wire q;

  // Instantiate the T flip-flop
  t_ff uut (
    .t(t),
    .clk(clk),
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
    t = 0;
    #10; // Wait for 10ns

    // Test case 1: Hold state when t is low
    if (q !== 1) begin
      $display("FAIL: Initial state is incorrect");
      $finish;
    end

    // Test case 2: Toggle when t is high
    t = 1; 
    #10; // Wait for one clock cycle
    if (q !== 0) begin
      $display("FAIL: Expected q=0 when t=1");
      $finish;
    end

    #10; // Wait for another clock cycle
    if (q !== 1) begin
      $display("FAIL: Expected q=1 when t=1");
      $finish;
    end

    // Test case 3: Hold state when t is low again
    t = 0; 
    #10; // Wait for one clock cycle
    if (q !== 1) begin
      $display("FAIL: Expected q=1 when t=0");
      $finish;
    end

    // Test case 4: Toggle again when t is high
    t = 1; 
    #10; // Wait for one clock cycle
    if (q !== 0) begin
      $display("FAIL: Expected q=0 when t=1");
      $finish;
    end

    #10; // Wait for another clock cycle
    if (q !== 1) begin
      $display("FAIL: Expected q=1 when t=1");
      $finish;
    end

    // Final check: Hold state when t is low
    t = 0; 
    #10; // Wait for one clock cycle
    if (q !== 1) begin
      $display("FAIL: Expected q=1 when t=0");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule