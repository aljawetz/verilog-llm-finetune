`timescale 1ns/1ps

module tb_D_FF_neg;

  reg D;
  reg clk;
  wire Q;

  // Instantiate the D flip-flop
  D_FF_neg uut (
    .D(D),
    .clk(clk),
    .Q(Q)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
  end

  // Test sequence
  initial begin
    // Initialize
    D = 0;

    // Wait for a falling edge to capture the initial value
    #10;
    if (Q !== 0) begin
      $display("FAIL: Initial Q is not 0");
      $finish;
    end

    // Test case 1: Set D to 1, expect Q to be 1 after falling edge
    D = 1;
    #10; // Wait for falling edge
    if (Q !== 1) begin
      $display("FAIL: Q is not 1 after D is set to 1");
      $finish;
    end

    // Test case 2: Set D to 0, expect Q to be 0 after falling edge
    D = 0;
    #10; // Wait for falling edge
    if (Q !== 0) begin
      $display("FAIL: Q is not 0 after D is set to 0");
      $finish;
    end

    // Test case 3: Toggle D to 1, expect Q to be 1 after falling edge
    D = 1;
    #10; // Wait for falling edge
    if (Q !== 1) begin
      $display("FAIL: Q is not 1 after D is toggled to 1");
      $finish;
    end

    // Test case 4: Toggle D to 0, expect Q to be 0 after falling edge
    D = 0;
    #10; // Wait for falling edge
    if (Q !== 0) begin
      $display("FAIL: Q is not 0 after D is toggled to 0");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule