`timescale 1ns/1ps

module tb_tff;
  reg t;
  reg clk;
  wire q;

  // Instantiate the T flip-flop module
  tff uut (
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
    #10; // Wait for some time

    // Test case 1: t = 0, q should remain 1
    t = 0;
    #10;
    if (q !== 1) begin
      $display("FAIL: Expected q=1, got q=%b", q);
      $finish;
    end

    // Test case 2: t = 1, q should toggle to 0
    t = 1;
    #10;
    if (q !== 0) begin
      $display("FAIL: Expected q=0, got q=%b", q);
      $finish;
    end

    // Test case 3: t = 0, q should remain 0
    t = 0;
    #10;
    if (q !== 0) begin
      $display("FAIL: Expected q=0, got q=%b", q);
      $finish;
    end

    // Test case 4: t = 1, q should toggle to 1
    t = 1;
    #10;
    if (q !== 1) begin
      $display("FAIL: Expected q=1, got q=%b", q);
      $finish;
    end

    // Test case 5: t = 1, q should toggle to 0
    #10;
    if (q !== 0) begin
      $display("FAIL: Expected q=0, got q=%b", q);
      $finish;
    end

    // Test case 6: t = 0, q should remain 0
    t = 0;
    #10;
    if (q !== 0) begin
      $display("FAIL: Expected q=0, got q=%b", q);
      $finish;
    end

    // Test case 7: t = 1, q should toggle to 1
    t = 1;
    #10;
    if (q !== 1) begin
      $display("FAIL: Expected q=1, got q=%b", q);
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end
endmodule