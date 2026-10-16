`timescale 1ns/1ps

module tb_tff_1;
  reg T;
  reg clk;
  wire Q;
  wire Q_not;

  // Instantiate the T flip-flop module
  tff_1 uut (
    .T(T),
    .clk(clk),
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
    // Initialize inputs
    T = 0;
    #10; // Wait for 10ns

    // Test case 1: T = 0, Q should hold its value
    if (Q !== 0 || Q_not !== 1) begin
      $display("FAIL: Initial state check failed");
      $finish;
    end

    // Test case 2: T = 1, Q should toggle
    T = 1;
    #10; // Wait for one clock cycle
    if (Q !== 1 || Q_not !== 0) begin
      $display("FAIL: Q did not toggle when T=1");
      $finish;
    end

    // Test case 3: T = 0, Q should hold its value
    T = 0;
    #10; // Wait for one clock cycle
    if (Q !== 1 || Q_not !== 0) begin
      $display("FAIL: Q changed when T=0");
      $finish;
    end

    // Test case 4: T = 1, Q should toggle again
    T = 1;
    #10; // Wait for one clock cycle
    if (Q !== 0 || Q_not !== 1) begin
      $display("FAIL: Q did not toggle when T=1 again");
      $finish;
    end

    // Test case 5: T = 0, Q should hold its value
    T = 0;
    #10; // Wait for one clock cycle
    if (Q !== 0 || Q_not !== 1) begin
      $display("FAIL: Q changed when T=0 again");
      $finish;
    end

    // Test case 6: T = 1, Q should toggle
    T = 1;
    #10; // Wait for one clock cycle
    if (Q !== 1 || Q_not !== 0) begin
      $display("FAIL: Q did not toggle when T=1 for the third time");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end
endmodule