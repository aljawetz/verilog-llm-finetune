`timescale 1ns/1ps

module tb_d_ff;

  reg clk;
  reg d;
  wire q;

  // Instantiate the D flip-flop
  d_ff uut (
    .clk(clk),
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
    // Initialize
    d = 0;
    #10; // Wait for the first clock edge

    // Test case 1: Check if q follows d on falling edge
    d = 1; 
    #10; // Wait for the next falling edge
    if (q !== 1) begin
      $display("FAIL: Test case 1 failed, expected q = 1, got q = %b", q);
      $finish;
    end

    // Test case 2: Change d and check q
    d = 0; 
    #10; // Wait for the next falling edge
    if (q !== 0) begin
      $display("FAIL: Test case 2 failed, expected q = 0, got q = %b", q);
      $finish;
    end

    // Test case 3: Set d to 1 again
    d = 1; 
    #10; // Wait for the next falling edge
    if (q !== 1) begin
      $display("FAIL: Test case 3 failed, expected q = 1, got q = %b", q);
      $finish;
    end

    // Test case 4: Set d to 0 again
    d = 0; 
    #10; // Wait for the next falling edge
    if (q !== 0) begin
      $display("FAIL: Test case 4 failed, expected q = 0, got q = %b", q);
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule