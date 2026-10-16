`timescale 1ns/1ps

module tb_jk_ff;
  reg clk;
  reg J;
  reg K;
  wire q;
  wire q_bar;

  // Instantiate the jk_ff module
  jk_ff uut (
    .clk(clk),
    .J(J),
    .K(K),
    .q(q),
    .q_bar(q_bar)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
  end

  // Test sequence
  initial begin
    // Initialize inputs
    J = 0; K = 0;
    #10; // Wait for a clock edge

    // Test hold state
    if (q !== 1'b1) begin
      $display("FAIL: Expected q=1 after hold state, got q=%b", q);
      $finish;
    end

    // Test reset state
    J = 0; K = 1; 
    #10; // Wait for a clock edge
    if (q !== 1'b0) begin
      $display("FAIL: Expected q=0 after reset, got q=%b", q);
      $finish;
    end

    // Test set state
    J = 1; K = 0; 
    #10; // Wait for a clock edge
    if (q !== 1'b1) begin
      $display("FAIL: Expected q=1 after set, got q=%b", q);
      $finish;
    end

    // Test toggle state
    J = 1; K = 1; 
    #10; // Wait for a clock edge
    if (q !== 1'b0) begin
      $display("FAIL: Expected q=0 after toggle, got q=%b", q);
      $finish;
    end

    #10; // Wait for a clock edge
    if (q !== 1'b1) begin
      $display("FAIL: Expected q=1 after toggle, got q=%b", q);
      $finish;
    end

    // Final check for toggle
    J = 1; K = 1; 
    #10; // Wait for a clock edge
    if (q !== 1'b0) begin
      $display("FAIL: Expected q=0 after toggle, got q=%b", q);
      $finish;
    end

    // End of test
    $display("PASS");
    $finish;
  end
endmodule