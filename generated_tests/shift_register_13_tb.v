`timescale 1ns/1ps

module tb_shift_register;

  reg clk;
  reg reset;
  wire [3:0] out;

  // Instantiate the module under test (uut)
  shift_register uut (
    .clk(clk),
    .reset(reset),
    .out(out)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
  end

  // Test sequence
  initial begin
    // Initialize reset
    reset = 1;
    #10; // Wait for 10ns
    reset = 0; // Release reset

    // Check initial value after reset
    if (out !== 4'b0011) begin
      $display("FAIL: Initial value after reset is incorrect, got %b", out);
      $finish;
    end

    // Shift left once
    #10; // Wait for one clock cycle
    if (out !== 4'b0110) begin
      $display("FAIL: Value after first shift is incorrect, got %b", out);
      $finish;
    end

    // Shift left twice
    #10; // Wait for one clock cycle
    if (out !== 4'b1100) begin
      $display("FAIL: Value after second shift is incorrect, got %b", out);
      $finish;
    end

    // Shift left three times
    #10; // Wait for one clock cycle
    if (out !== 4'b1000) begin
      $display("FAIL: Value after third shift is incorrect, got %b", out);
      $finish;
    end

    // Shift left four times
    #10; // Wait for one clock cycle
    if (out !== 4'b0000) begin
      $display("FAIL: Value after fourth shift is incorrect, got %b", out);
      $finish;
    end

    // Check if the output remains zero after further shifts
    #10; // Wait for one clock cycle
    if (out !== 4'b0000) begin
      $display("FAIL: Value should remain zero after further shifts, got %b", out);
      $finish;
    end

    // End of tests
    $display("PASS");
    $finish;
  end

endmodule