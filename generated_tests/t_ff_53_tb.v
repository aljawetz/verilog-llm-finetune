`timescale 1ns/1ps

module tb_t_ff;

  reg t;
  reg clk;
  wire q;

  // Instantiate the module under test (uut)
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

    // Wait for a clock edge
    @(posedge clk);
    
    // Test case 1: t = 0, q should remain 1
    #1;
    if (q !== 1) begin
      $display("FAIL: Expected q=1, got q=%b", q);
      $finish;
    end

    // Test case 2: t = 1, q should toggle
    t = 1;
    @(posedge clk);
    #1;
    if (q !== 0) begin
      $display("FAIL: Expected q=0, got q=%b", q);
      $finish;
    end

    // Test case 3: t = 0, q should remain 0
    t = 0;
    @(posedge clk);
    #1;
    if (q !== 0) begin
      $display("FAIL: Expected q=0, got q=%b", q);
      $finish;
    end

    // Test case 4: t = 1, q should toggle
    t = 1;
    @(posedge clk);
    #1;
    if (q !== 1) begin
      $display("FAIL: Expected q=1, got q=%b", q);
      $finish;
    end

    // Test case 5: t = 0, q should remain 1
    t = 0;
    @(posedge clk);
    #1;
    if (q !== 1) begin
      $display("FAIL: Expected q=1, got q=%b", q);
      $finish;
    end

    // End of tests
    $display("PASS");
    $finish;
  end

endmodule