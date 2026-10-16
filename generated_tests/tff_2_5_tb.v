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
    forever #5 clk = ~clk; // 10ns period
  end

  // Test sequence
  initial begin
    // Initialize signals
    rst = 1; t = 0;
    #10; // Wait for 10ns

    // Release reset
    rst = 0;
    #10; // Wait for 10ns

    // Test case 1: Check reset functionality
    if (Q !== 1'b0 || Q_not !== 1'b1) begin
      $display("FAIL: Reset did not set Q to 0 and Q_not to 1");
      $finish;
    end

    // Test case 2: Toggle Q when t = 1
    t = 1; 
    #10; // Wait for 10ns
    if (Q !== 1'b1 || Q_not !== 1'b0) begin
      $display("FAIL: Q did not toggle to 1 when t = 1");
      $finish;
    end

    // Test case 3: Maintain state when t = 0
    t = 0; 
    #10; // Wait for 10ns
    if (Q !== 1'b1 || Q_not !== 1'b0) begin
      $display("FAIL: Q changed when t = 0");
      $finish;
    end

    // Test case 4: Toggle Q again when t = 1
    t = 1; 
    #10; // Wait for 10ns
    if (Q !== 1'b0 || Q_not !== 1'b1) begin
      $display("FAIL: Q did not toggle back to 0 when t = 1");
      $finish;
    end

    // Test case 5: Reset functionality again
    rst = 1; 
    #10; // Wait for 10ns
    if (Q !== 1'b0 || Q_not !== 1'b1) begin
      $display("FAIL: Reset did not set Q to 0 and Q_not to 1 again");
      $finish;
    end

    // End of test
    $display("PASS");
    $finish;
  end
endmodule