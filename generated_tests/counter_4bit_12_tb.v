`timescale 1ns/1ps

module tb_counter_4bit;

  reg clk;
  reg rst;
  wire signed [3:0] q;

  // Instantiate the module under test (uut)
  counter_4bit uut (
    .clk(clk),
    .rst(rst),
    .q(q)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
  end

  // Test sequence
  initial begin
    // Initialize reset
    rst = 1;
    #10; // Wait for 10ns
    rst = 0;

    // Check initial value after reset
    if (q !== 4'b0000) begin
      $display("FAIL: Initial value after reset is not zero");
      $finish;
    end

    // Increment the counter
    #10; // Wait for 1 clock cycle
    if (q !== 4'b0001) begin
      $display("FAIL: Counter value is not 1 after 1 increment");
      $finish;
    end

    #10; // Wait for 1 clock cycle
    if (q !== 4'b0010) begin
      $display("FAIL: Counter value is not 2 after 2 increments");
      $finish;
    end

    #10; // Wait for 1 clock cycle
    if (q !== 4'b0011) begin
      $display("FAIL: Counter value is not 3 after 3 increments");
      $finish;
    end

    #10; // Wait for 1 clock cycle
    if (q !== 4'b0100) begin
      $display("FAIL: Counter value is not 4 after 4 increments");
      $finish;
    end

    // Test reset functionality
    rst = 1; // Assert reset
    #10; // Wait for 1 clock cycle
    rst = 0; // Deassert reset

    // Check value after reset
    if (q !== 4'b0000) begin
      $display("FAIL: Counter value is not zero after reset");
      $finish;
    end

    // Continue incrementing
    #10; // Wait for 1 clock cycle
    if (q !== 4'b0001) begin
      $display("FAIL: Counter value is not 1 after reset and 1 increment");
      $finish;
    end

    // Test wrap around
    rst = 0; // Ensure reset is deasserted
    repeat (15) begin
      #10; // Wait for 1 clock cycle
    end

    if (q !== 4'b0000) begin
      $display("FAIL: Counter did not wrap around correctly");
      $finish;
    end

    $display("PASS");
    $finish;
  end

endmodule