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
    #10;
    
    // Test case 1: t = 0, q should remain 0
    if (q !== 0) begin
      $display("FAIL: Test case 1 failed, expected q=0, got q=%b", q);
      $finish;
    end

    // Test case 2: t = 1, toggle q
    t = 1; 
    #10; // Wait for one clock edge
    if (q !== 1) begin
      $display("FAIL: Test case 2 failed, expected q=1, got q=%b", q);
      $finish;
    end

    // Test case 3: Toggle q again
    #10; // Wait for another clock edge
    if (q !== 0) begin
      $display("FAIL: Test case 3 failed, expected q=0, got q=%b", q);
      $finish;
    end

    // Test case 4: t = 0, q should reset to 0
    t = 0; 
    #10; // Wait for one clock edge
    if (q !== 0) begin
      $display("FAIL: Test case 4 failed, expected q=0, got q=%b", q);
      $finish;
    end

    // Test case 5: t = 1, toggle q
    t = 1; 
    #10; // Wait for one clock edge
    if (q !== 1) begin
      $display("FAIL: Test case 5 failed, expected q=1, got q=%b", q);
      $finish;
    end

    // Test case 6: t = 1, toggle q again
    #10; // Wait for another clock edge
    if (q !== 0) begin
      $display("FAIL: Test case 6 failed, expected q=0, got q=%b", q);
      $finish;
    end

    // Test case 7: t = 0, q should remain 0
    t = 0; 
    #10; // Wait for one clock edge
    if (q !== 0) begin
      $display("FAIL: Test case 7 failed, expected q=0, got q=%b", q);
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule