`timescale 1ns/1ps

module tb_t_flipflop;

  reg t;
  reg clk;
  reg rst;
  wire qn;
  wire qbar;

  // Instantiate the T flip-flop
  t_flipflop uut (
    .t(t),
    .clk(clk),
    .rst(rst),
    .qn(qn),
    .qbar(qbar)
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
    #10; // Wait for 10ns
    rst = 0; // Release reset

    // Test case 1: Check reset functionality
    if (qn !== 0) begin
      $display("FAIL: Reset did not set qn to 0");
      $finish;
    end

    // Test case 2: Check toggle functionality with t = 1
    t = 1; // Set T to toggle
    #10; // Wait for one clock cycle
    if (qn !== 1) begin
      $display("FAIL: qn did not toggle to 1");
      $finish;
    end

    #10; // Wait for another clock cycle
    if (qn !== 0) begin
      $display("FAIL: qn did not toggle back to 0");
      $finish;
    end

    // Test case 3: Check no toggle with t = 0
    t = 0; // Set T to hold
    #10; // Wait for one clock cycle
    if (qn !== 0) begin
      $display("FAIL: qn toggled when t was 0");
      $finish;
    end

    #10; // Wait for another clock cycle
    if (qn !== 0) begin
      $display("FAIL: qn changed when t was 0");
      $finish;
    end

    // Test case 4: Check toggle functionality again with t = 1
    t = 1; // Set T to toggle
    #10; // Wait for one clock cycle
    if (qn !== 1) begin
      $display("FAIL: qn did not toggle to 1");
      $finish;
    end

    #10; // Wait for another clock cycle
    if (qn !== 0) begin
      $display("FAIL: qn did not toggle back to 0");
      $finish;
    end

    // Test case 5: Check reset functionality again
    rst = 1; // Assert reset
    #10; // Wait for reset to take effect
    if (qn !== 0) begin
      $display("FAIL: Reset did not set qn to 0");
      $finish;
    end

    // End of test
    $display("PASS");
    $finish;
  end

endmodule