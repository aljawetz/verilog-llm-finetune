`timescale 1ns/1ps

module tb_d_ff;

  // Inputs
  reg d_in;
  reg clk;
  reg reset_n;

  // Outputs
  wire q;
  wire qn;

  // Instantiate the D flip-flop
  d_ff uut (
    .d_in(d_in),
    .clk(clk),
    .reset_n(reset_n),
    .q(q),
    .qn(qn)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
  end

  // Test sequence
  initial begin
    // Initialize inputs
    d_in = 0;
    reset_n = 0;

    // Apply reset
    #10;
    reset_n = 1; // Release reset
    #10;

    // Test case 1: Check output after setting d_in
    d_in = 1; // Set d_in to 1
    #10; // Wait for one clock cycle
    if (q !== 1 || qn !== 0) begin
      $display("FAIL: Test case 1 failed. Expected q=1, qn=0 but got q=%b, qn=%b", q, qn);
      $finish;
    end

    // Test case 2: Check output after changing d_in
    d_in = 0; // Change d_in to 0
    #10; // Wait for one clock cycle
    if (q !== 0 || qn !== 1) begin
      $display("FAIL: Test case 2 failed. Expected q=0, qn=1 but got q=%b, qn=%b", q, qn);
      $finish;
    end

    // Test case 3: Check reset functionality
    reset_n = 0; // Assert reset
    #10; // Wait for one clock cycle
    if (q !== 0 || qn !== 1) begin
      $display("FAIL: Test case 3 failed. Expected q=0, qn=1 but got q=%b, qn=%b", q, qn);
      $finish;
    end

    // Release reset and check output
    reset_n = 1; // Release reset
    #10;
    d_in = 1; // Set d_in to 1
    #10; // Wait for one clock cycle
    if (q !== 1 || qn !== 0) begin
      $display("FAIL: Test case 4 failed. Expected q=1, qn=0 but got q=%b, qn=%b", q, qn);
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule