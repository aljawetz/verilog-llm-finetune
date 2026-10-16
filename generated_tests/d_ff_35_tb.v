`timescale 1ns/1ps

module tb_d_ff;
  reg clk;
  reg rst;
  reg D;
  wire Q;
  wire Q_bar;

  // Instantiate the D flip-flop
  d_ff uut (
    .clk(clk),
    .rst(rst),
    .D(D),
    .Q(Q),
    .Q_bar(Q_bar)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
  end

  // Test sequence
  initial begin
    // Initialize signals
    rst = 1; // Start with reset active
    D = 0;

    // Wait for a clock edge
    #10;

    // Release reset
    rst = 0;
    #10;

    // Test case 1: Check Q and Q_bar when D = 0
    D = 0;
    #10;
    if (Q !== 0 || Q_bar !== 1) begin
      $display("FAIL: Test case 1 failed (D=0)");
      $finish;
    end

    // Test case 2: Check Q and Q_bar when D = 1
    D = 1;
    #10;
    if (Q !== 1 || Q_bar !== 0) begin
      $display("FAIL: Test case 2 failed (D=1)");
      $finish;
    end

    // Test case 3: Check reset functionality
    rst = 1; // Activate reset
    #10;
    if (Q !== 0 || Q_bar !== 1) begin
      $display("FAIL: Test case 3 failed (reset active)");
      $finish;
    end

    // Test case 4: Check Q and Q_bar after reset is released
    rst = 0; // Release reset
    D = 0; // Set D to 0
    #10;
    if (Q !== 0 || Q_bar !== 1) begin
      $display("FAIL: Test case 4 failed (D=0 after reset)");
      $finish;
    end

    // Test case 5: Check Q and Q_bar with D = 1 after reset
    D = 1;
    #10;
    if (Q !== 1 || Q_bar !== 0) begin
      $display("FAIL: Test case 5 failed (D=1 after reset)");
      $finish;
    end

    // End of tests
    $display("PASS");
    $finish;
  end
endmodule