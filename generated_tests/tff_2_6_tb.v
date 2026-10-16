`timescale 1ns/1ps

module tb_tff_2;
  reg t;
  reg clk;
  reg rst;
  wire Q;
  wire Q_not;

  // Instantiate the module under test (uut)
  tff_2 uut (
    .t(t),
    .clk(clk),
    .rst(rst),
    .Q(Q),
    .Q_not(Q_not)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
  end

  // Test sequence
  initial begin
    // Initialize signals
    rst = 1; t = 0;
    #10; // Wait for a clock cycle

    // Test reset functionality
    rst = 1; 
    #10; // Wait for a clock cycle
    if (Q !== 0 || Q_not !== 1) begin
      $display("FAIL: Reset did not set Q to 0 and Q_not to 1");
      $finish;
    end

    // Release reset and test hold functionality
    rst = 0; 
    #10; // Wait for a clock cycle
    if (Q !== 0 || Q_not !== 1) begin
      $display("FAIL: Q and Q_not should hold values when t is 0");
      $finish;
    end

    // Test toggle functionality with t = 1
    t = 1; 
    #10; // Wait for a clock cycle
    if (Q !== 1 || Q_not !== 0) begin
      $display("FAIL: Q should toggle to 1 and Q_not to 0");
      $finish;
    end

    // Toggle again
    #10; // Wait for a clock cycle
    if (Q !== 0 || Q_not !== 1) begin
      $display("FAIL: Q should toggle back to 0 and Q_not to 1");
      $finish;
    end

    // Test hold functionality with t = 0
    t = 0; 
    #10; // Wait for a clock cycle
    if (Q !== 0 || Q_not !== 1) begin
      $display("FAIL: Q and Q_not should hold values when t is 0");
      $finish;
    end

    // Test toggle again with t = 1
    t = 1; 
    #10; // Wait for a clock cycle
    if (Q !== 1 || Q_not !== 0) begin
      $display("FAIL: Q should toggle to 1 and Q_not to 0");
      $finish;
    end

    // Final toggle
    #10; // Wait for a clock cycle
    if (Q !== 0 || Q_not !== 1) begin
      $display("FAIL: Q should toggle back to 0 and Q_not to 1");
      $finish;
    end

    // End of tests
    $display("PASS");
    $finish;
  end
endmodule