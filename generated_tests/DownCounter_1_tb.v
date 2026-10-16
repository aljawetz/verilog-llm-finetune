`timescale 1ns/1ps

module tb_DownCounter;

  reg clk;
  reg rst;
  wire [2:0] count;

  // Instantiate the module under test (uut)
  DownCounter uut (
    .clk(clk),
    .rst(rst),
    .count(count)
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
    #10; // Wait for a clock cycle
    rst = 0;
    
    // Test 1: Check initial count after reset
    if (count !== 3'b111) begin
      $display("FAIL: Initial count after reset is not 7");
      $finish;
    end

    // Test 2: Count down from 7 to 0
    #10; // Wait for 1 clock cycle
    if (count !== 3'b110) begin
      $display("FAIL: Count did not decrement to 6");
      $finish;
    end

    #10; // Wait for 1 clock cycle
    if (count !== 3'b101) begin
      $display("FAIL: Count did not decrement to 5");
      $finish;
    end

    #10; // Wait for 1 clock cycle
    if (count !== 3'b100) begin
      $display("FAIL: Count did not decrement to 4");
      $finish;
    end

    #10; // Wait for 1 clock cycle
    if (count !== 3'b011) begin
      $display("FAIL: Count did not decrement to 3");
      $finish;
    end

    #10; // Wait for 1 clock cycle
    if (count !== 3'b010) begin
      $display("FAIL: Count did not decrement to 2");
      $finish;
    end

    #10; // Wait for 1 clock cycle
    if (count !== 3'b001) begin
      $display("FAIL: Count did not decrement to 1");
      $finish;
    end

    #10; // Wait for 1 clock cycle
    if (count !== 3'b000) begin
      $display("FAIL: Count did not reach 0");
      $finish;
    end

    // Test 3: Check reset functionality when count is 0
    rst = 1; // Assert reset
    #10; // Wait for a clock cycle
    rst = 0; // Deassert reset

    // Check if count resets to 7
    if (count !== 3'b111) begin
      $display("FAIL: Count did not reset to 7 after reaching 0");
      $finish;
    end

    // End of tests
    $display("PASS");
    $finish;
  end

endmodule