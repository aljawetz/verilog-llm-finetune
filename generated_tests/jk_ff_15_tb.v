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
    // Wait for the clock to stabilize
    #10;

    // Test case 1: Initial state
    if (q !== 1'b1) begin
      $display("FAIL: Initial state is not 1");
      $finish;
    end

    // Test case 2: Set to 0
    j = 0; k = 1; #10;
    if (q !== 1'b0) begin
      $display("FAIL: Expected q to be 0 when j=0, k=1");
      $finish;
    end

    // Test case 3: Set to 1
    j = 1; k = 0; #10;
    if (q !== 1'b1) begin
      $display("FAIL: Expected q to be 1 when j=1, k=0");
      $finish;
    end

    // Test case 4: Toggle
    j = 1; k = 1; #10;
    if (q !== 1'b0) begin
      $display("FAIL: Expected q to be 0 after toggle when previous q=1");
      $finish;
    end

    // Test case 5: Toggle again
    #10;
    if (q !== 1'b1) begin
      $display("FAIL: Expected q to be 1 after toggle when previous q=0");
      $finish;
    end

    // Test case 6: Hold state
    j = 0; k = 0; #10;
    if (q !== 1'b1) begin
      $display("FAIL: Expected q to hold at 1 when j=0, k=0");
      $finish;
    end

    // Test case 7: Set to 0 again
    j = 0; k = 1; #10;
    if (q !== 1'b0) begin
      $display("FAIL: Expected q to be 0 when j=0, k=1");
      $finish;
    end

    // Test case 8: Set to 1 again
    j = 1; k = 0; #10;
    if (q !== 1'b1) begin
      $display("FAIL: Expected q to be 1 when j=1, k=0");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule