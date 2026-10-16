`timescale 1ns/1ps

module tb_shift_register;

  reg clk;
  reg reset;
  wire [3:0] out;

  // Instantiate the shift_register module
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
      $display("FAIL: Initial output after reset is incorrect. Expected 0011, got %b", out);
      $finish;
    end

    // Shift left once
    #10; // Wait for one clock cycle
    if (out !== 4'b0110) begin
      $display("FAIL: Output after first shift is incorrect. Expected 0110, got %b", out);
      $finish;
    end

    // Shift left again
    #10; // Wait for one clock cycle
    if (out !== 4'b1100) begin
      $display("FAIL: Output after second shift is incorrect. Expected 1100, got %b", out);
      $finish;
    end

    // Shift left again
    #10; // Wait for one clock cycle
    if (out !== 4'b1000) begin
      $display("FAIL: Output after third shift is incorrect. Expected 1000, got %b", out);
      $finish;
    end

    // Shift left again
    #10; // Wait for one clock cycle
    if (out !== 4'b0000) begin
      $display("FAIL: Output after fourth shift is incorrect. Expected 0000, got %b", out);
      $finish;
    end

    // Check if the register holds the value after reset
    reset = 1; // Assert reset
    #10; // Wait for 10ns
    reset = 0; // Release reset

    // Check initial value after reset
    if (out !== 4'b0011) begin
      $display("FAIL: Initial output after reset is incorrect. Expected 0011, got %b", out);
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule