`timescale 1ns/1ps

module tb_shiftreg_siso;

  reg d;
  reg rst;
  reg clk;
  wire q0, q1, q2, q3;

  // Instantiate the module under test (uut)
  shiftreg_siso uut (
    .d(d),
    .rst(rst),
    .clk(clk),
    .q0(q0),
    .q1(q1),
    .q2(q2),
    .q3(q3)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
  end

  // Test sequence
  initial begin
    // Initialize inputs
    d = 0;
    rst = 1; // Assert reset
    #10; // Wait for 10ns
    rst = 0; // Deassert reset

    // Test shifting in bits
    // Shift in 1, 0, 1, 1
    d = 1; #10; // Shift in 1
    if (q0 !== 1 || q1 !== 0 || q2 !== 0 || q3 !== 0) begin
      $display("FAIL: Incorrect output after shifting in 1");
      $finish;
    end

    d = 0; #10; // Shift in 0
    if (q0 !== 0 || q1 !== 1 || q2 !== 0 || q3 !== 0) begin
      $display("FAIL: Incorrect output after shifting in 0");
      $finish;
    end

    d = 1; #10; // Shift in 1
    if (q0 !== 1 || q1 !== 0 || q2 !== 1 || q3 !== 0) begin
      $display("FAIL: Incorrect output after shifting in 1");
      $finish;
    end

    d = 1; #10; // Shift in 1
    if (q0 !== 1 || q1 !== 1 || q2 !== 0 || q3 !== 1) begin
      $display("FAIL: Incorrect output after shifting in 1");
      $finish;
    end

    // Test reset functionality
    rst = 1; #10; // Assert reset
    if (q0 !== 0 || q1 !== 0 || q2 !== 0 || q3 !== 0) begin
      $display("FAIL: Incorrect output after reset");
      $finish;
    end

    // End simulation
    $display("PASS");
    $finish;
  end

endmodule