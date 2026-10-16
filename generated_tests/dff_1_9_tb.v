`timescale 1ns/1ps

module tb_dff_1;

  reg D;
  reg clk;
  reg rst;
  wire Q;
  wire Q_not;

  // Instantiate the module under test (uut)
  dff_1 uut (
    .D(D),
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
    D = 0;
    rst = 0;

    // Test 1: Reset the flip-flop
    rst = 1; #10;
    if (Q !== 0 || Q_not !== 1) begin
      $display("FAIL: Reset did not set Q to 0 and Q_not to 1");
      $finish;
    end

    // Test 2: Set D to 1 and clock
    rst = 0; D = 1; #10;
    if (Q !== 1 || Q_not !== 0) begin
      $display("FAIL: After clock with D=1, Q should be 1 and Q_not should be 0");
      $finish;
    end

    // Test 3: Set D to 0 and clock
    D = 0; #10;
    if (Q !== 0 || Q_not !== 1) begin
      $display("FAIL: After clock with D=0, Q should be 0 and Q_not should be 1");
      $finish;
    end

    // Test 4: Reset again
    rst = 1; #10;
    if (Q !== 0 || Q_not !== 1) begin
      $display("FAIL: Reset did not set Q to 0 and Q_not to 1");
      $finish;
    end

    // Test 5: Set D to 1, release reset and clock
    rst = 0; D = 1; #10;
    if (Q !== 1 || Q_not !== 0) begin
      $display("FAIL: After clock with D=1, Q should be 1 and Q_not should be 0");
      $finish;
    end

    // Test 6: Set D to 0, clock and check
    D = 0; #10;
    if (Q !== 0 || Q_not !== 1) begin
      $display("FAIL: After clock with D=0, Q should be 0 and Q_not should be 1");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule