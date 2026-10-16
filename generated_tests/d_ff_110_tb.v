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
    // Initialize inputs
    d = 0;

    // Wait for the first clock edge
    #10;

    // Test case 1: Check if q follows d on falling edge
    d = 1; // Set d to 1
    #10;   // Wait for falling edge
    if (q !== 1) begin
      $display("FAIL: Test case 1 failed, expected q=1, got q=%b", q);
      $finish;
    end

    // Test case 2: Check if q holds value on next falling edge
    #10;   // Wait for next falling edge
    if (q !== 1) begin
      $display("FAIL: Test case 2 failed, expected q=1, got q=%b", q);
      $finish;
    end

    // Test case 3: Change d to 0 and check q on falling edge
    d = 0; // Set d to 0
    #10;   // Wait for falling edge
    if (q !== 0) begin
      $display("FAIL: Test case 3 failed, expected q=0, got q=%b", q);
      $finish;
    end

    // Test case 4: Check if q holds value on next falling edge
    #10;   // Wait for next falling edge
    if (q !== 0) begin
      $display("FAIL: Test case 4 failed, expected q=0, got q=%b", q);
      $finish;
    end

    // Test case 5: Set d to 1 again and check q
    d = 1; // Set d to 1
    #10;   // Wait for falling edge
    if (q !== 1) begin
      $display("FAIL: Test case 5 failed, expected q=1, got q=%b", q);
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule