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
    rst = 1;
    t = 0;

    // Apply reset
    #10;
    rst = 0; // Release reset

    // Test case 1: Toggle T flip-flop
    t = 1; // Set T to toggle
    #10; // Wait for one clock cycle
    if (Q !== 1'b1 || Q_not !== 1'b0) begin
      $display("FAIL: Test case 1 failed, expected Q=1, Q_not=0");
      $finish;
    end

    // Test case 2: Toggle again
    #10; // Wait for another clock cycle
    if (Q !== 1'b0 || Q_not !== 1'b1) begin
      $display("FAIL: Test case 2 failed, expected Q=0, Q_not=1");
      $finish;
    end

    // Test case 3: Hold state
    t = 0; // Set T to hold
    #10; // Wait for one clock cycle
    if (Q !== 1'b0 || Q_not !== 1'b1) begin
      $display("FAIL: Test case 3 failed, expected Q=0, Q_not=1");
      $finish;
    end

    // Test case 4: Release reset and toggle
    rst = 1; // Assert reset
    #10;
    rst = 0; // Release reset
    t = 1; // Set T to toggle
    #10; // Wait for one clock cycle
    if (Q !== 1'b1 || Q_not !== 1'b0) begin
      $display("FAIL: Test case 4 failed, expected Q=1, Q_not=0");
      $finish;
    end

    // Test case 5: Toggle again
    #10; // Wait for another clock cycle
    if (Q !== 1'b0 || Q_not !== 1'b1) begin
      $display("FAIL: Test case 5 failed, expected Q=0, Q_not=1");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end
endmodule