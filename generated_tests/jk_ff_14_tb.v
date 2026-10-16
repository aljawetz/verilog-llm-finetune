`timescale 1ns/1ps

module tb_jk_ff;

  reg clk;
  reg j;
  reg k;
  wire q;
  wire qbar;

  // Instantiate the JK flip-flop
  jk_ff uut (
    .clk(clk),
    .j(j),
    .k(k),
    .q(q),
    .qbar(qbar)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
  end

  // Test sequence
  initial begin
    // Initialize inputs
    j = 0;
    k = 0;
    #10; // Wait for 10ns

    // Test case 1: Hold state (j=0, k=0)
    #10;
    if (q !== 1'b1) begin
      $display("FAIL: Expected q=1, got q=%b", q);
      $finish;
    end

    // Test case 2: Reset (j=0, k=1)
    j = 0; k = 1;
    #10;
    if (q !== 1'b0) begin
      $display("FAIL: Expected q=0, got q=%b", q);
      $finish;
    end

    // Test case 3: Set (j=1, k=0)
    j = 1; k = 0;
    #10;
    if (q !== 1'b1) begin
      $display("FAIL: Expected q=1, got q=%b", q);
      $finish;
    end

    // Test case 4: Toggle (j=1, k=1)
    j = 1; k = 1;
    #10;
    if (q !== 1'b0) begin
      $display("FAIL: Expected q=0, got q=%b", q);
      $finish;
    end

    // Test case 5: Toggle again (j=1, k=1)
    #10;
    if (q !== 1'b1) begin
      $display("FAIL: Expected q=1, got q=%b", q);
      $finish;
    end

    // Test case 6: Hold state again (j=0, k=0)
    j = 0; k = 0;
    #10;
    if (q !== 1'b1) begin
      $display("FAIL: Expected q=1, got q=%b", q);
      $finish;
    end

    $display("PASS");
    $finish;
  end

endmodule