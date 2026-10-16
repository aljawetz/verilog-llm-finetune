`timescale 1ns/1ps

module tb_mealy_non_overlapping;
  reg clk;
  reg rst;
  reg in;
  wire out;

  // Instantiate the module under test
  mealy_non_overlapping uut (
    .out(out),
    .clk(clk),
    .rst(rst),
    .in(in)
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
    in = 0;
    #10; // Wait for a clock cycle

    // Release reset
    rst = 0;
    #10; // Wait for a clock cycle

    // Test sequence
    // State A
    if (out !== 0) begin
      $display("FAIL: Expected out = 0 in state A");
      $finish;
    end

    // Transition to state B
    in = 1; #10;
    if (out !== 0) begin
      $display("FAIL: Expected out = 0 in state B");
      $finish;
    end

    // Stay in state B
    in = 1; #10;
    if (out !== 0) begin
      $display("FAIL: Expected out = 0 in state B");
      $finish;
    end

    // Transition to state C
    in = 0; #10;
    if (out !== 0) begin
      $display("FAIL: Expected out = 0 in state C");
      $finish;
    end

    // Transition to state D
    in = 1; #10;
    if (out !== 1) begin
      $display("FAIL: Expected out = 1 in state D");
      $finish;
    end

    // Transition back to state B
    in = 0; #10;
    if (out !== 0) begin
      $display("FAIL: Expected out = 0 in state B after D");
      $finish;
    end

    // Transition to state B again
    in = 1; #10;
    if (out !== 0) begin
      $display("FAIL: Expected out = 0 in state B");
      $finish;
    end

    // Transition to state C
    in = 0; #10;
    if (out !== 0) begin
      $display("FAIL: Expected out = 0 in state C");
      $finish;
    end

    // Transition to state D
    in = 1; #10;
    if (out !== 1) begin
      $display("FAIL: Expected out = 1 in state D");
      $finish;
    end

    // End of test
    $display("PASS");
    $finish;
  end
endmodule