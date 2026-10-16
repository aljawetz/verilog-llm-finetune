`timescale 1ns/1ps

module tb_d_ff;
  reg clk;
  reg rst;
  reg D;
  wire Q;
  wire Q_bar;

  // Instantiate the D flip-flop module
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
    forever #5 clk = ~clk; // 10ns period
  end

  // Test sequence
  initial begin
    // Initialize signals
    rst = 1; // Start with reset active
    D = 0;

    // Wait for a few clock cycles
    #10;

    // Release reset
    rst = 0;
    #10;

    // Test case 1: Check output when D = 0
    D = 0;
    #10;
    if (Q !== 0 || Q_bar !== 1) begin
      $display("FAIL: Test case 1 failed, expected Q=0, Q_bar=1 but got Q=%b, Q_bar=%b", Q, Q_bar);
      $finish;
    end

    // Test case 2: Check output when D = 1
    D = 1;
    #10;
    if (Q !== 1 || Q_bar !== 0) begin
      $display("FAIL: Test case 2 failed, expected Q=1, Q_bar=0 but got Q=%b, Q_bar=%b", Q, Q_bar);
      $finish;
    end

    // Test case 3: Check reset functionality
    rst = 1; // Activate reset
    #10;
    if (Q !== 0 || Q_bar !== 1) begin
      $display("FAIL: Test case 3 failed during reset, expected Q=0, Q_bar=1 but got Q=%b, Q_bar=%b", Q, Q_bar);
      $finish;
    end

    // Test case 4: Check output after reset
    rst = 0; // Release reset
    D = 0;
    #10;
    if (Q !== 0 || Q_bar !== 1) begin
      $display("FAIL: Test case 4 failed after reset, expected Q=0, Q_bar=1 but got Q=%b, Q_bar=%b", Q, Q_bar);
      $finish;
    end

    // Test case 5: Check output when D changes after reset
    D = 1;
    #10;
    if (Q !== 1 || Q_bar !== 0) begin
      $display("FAIL: Test case 5 failed, expected Q=1, Q_bar=0 but got Q=%b, Q_bar=%b", Q, Q_bar);
      $finish;
    end

    // All tests passed
    $display("PASS");
    $finish;
  end
endmodule