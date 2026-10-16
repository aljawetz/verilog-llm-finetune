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
    forever #5 clk = ~clk; // 10 ns clock period
  end

  // Test sequence
  initial begin
    // Initialize inputs
    j = 0; k = 0;
    #10; // Wait for the first clock edge

    // Test hold state (j=0, k=0)
    #10;
    if (q !== 1'b1) begin
      $display("FAIL: Expected q=1, got q=%b", q);
      $finish;
    end

    // Test reset state (j=0, k=1)
    j = 0; k = 1;
    #10;
    if (q !== 1'b0) begin
      $display("FAIL: Expected q=0, got q=%b", q);
      $finish;
    end

    // Test set state (j=1, k=0)
    j = 1; k = 0;
    #10;
    if (q !== 1'b1) begin
      $display("FAIL: Expected q=1, got q=%b", q);
      $finish;
    end

    // Test toggle state (j=1, k=1)
    j = 1; k = 1;
    #10;
    if (q !== 1'b0) begin
      $display("FAIL: Expected q=0, got q=%b", q);
      $finish;
    end

    // Toggle again
    #10;
    if (q !== 1'b1) begin
      $display("FAIL: Expected q=1, got q=%b", q);
      $finish;
    end

    // Final state check
    j = 0; k = 0;
    #10;
    if (q !== 1'b1) begin
      $display("FAIL: Expected q=1, got q=%b", q);
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end
endmodule