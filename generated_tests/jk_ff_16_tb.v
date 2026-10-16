`timescale 1ns/1ps

module tb_jk_ff;

  reg clk;
  reg j;
  reg k;
  wire q;

  // Instantiate the JK flip-flop
  jk_ff uut (
    .clk(clk),
    .j(j),
    .k(k),
    .q(q)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
  end

  // Test sequence
  initial begin
    // Initial state check
    #1;
    if (q !== 1'b1) begin
      $display("FAIL: Initial state is not 1");
      $finish;
    end

    // Test case 1: Hold state (j=0, k=0)
    j = 0; k = 0; #10;
    if (q !== 1'b1) begin
      $display("FAIL: Hold state failed, expected 1, got %b", q);
      $finish;
    end

    // Test case 2: Reset state (j=0, k=1)
    j = 0; k = 1; #10;
    if (q !== 1'b0) begin
      $display("FAIL: Reset state failed, expected 0, got %b", q);
      $finish;
    end

    // Test case 3: Set state (j=1, k=0)
    j = 1; k = 0; #10;
    if (q !== 1'b1) begin
      $display("FAIL: Set state failed, expected 1, got %b", q);
      $finish;
    end

    // Test case 4: Toggle state (j=1, k=1)
    j = 1; k = 1; #10;
    if (q !== 1'b0) begin
      $display("FAIL: Toggle state failed, expected 0, got %b", q);
      $finish;
    end

    // Test case 5: Toggle back (j=1, k=1)
    #10;
    if (q !== 1'b1) begin
      $display("FAIL: Toggle back failed, expected 1, got %b", q);
      $finish;
    end

    // Final check
    $display("PASS");
    $finish;
  end

endmodule