`timescale 1ns/1ps

module tb_up_counter_4bit;

  reg clk;
  reg rst;
  wire [3:0] count;

  // Instantiate the module under test (uut)
  up_counter_4bit uut (
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
    #10; // Wait for 10ns
    rst = 0; // Release reset

    // Check initial count after reset
    if (count !== 4'b0000) begin
      $display("FAIL: Initial count is not zero");
      $finish;
    end

    // Wait for a few clock cycles and check count
    #10; // Wait for 1 clock cycle
    if (count !== 4'b0001) begin
      $display("FAIL: Count is not 1 after 1 clock cycle");
      $finish;
    end

    #10; // Wait for 1 clock cycle
    if (count !== 4'b0010) begin
      $display("FAIL: Count is not 2 after 2 clock cycles");
      $finish;
    end

    #10; // Wait for 1 clock cycle
    if (count !== 4'b0011) begin
      $display("FAIL: Count is not 3 after 3 clock cycles");
      $finish;
    end

    #10; // Wait for 1 clock cycle
    if (count !== 4'b0100) begin
      $display("FAIL: Count is not 4 after 4 clock cycles");
      $finish;
    end

    // Assert reset functionality
    rst = 1; // Assert reset
    #10; // Wait for 1 clock cycle
    rst = 0; // Release reset

    // Check count after reset
    if (count !== 4'b0000) begin
      $display("FAIL: Count is not zero after reset");
      $finish;
    end

    // Continue counting after reset
    #10; // Wait for 1 clock cycle
    if (count !== 4'b0001) begin
      $display("FAIL: Count is not 1 after reset and 1 clock cycle");
      $finish;
    end

    // Finish the simulation
    $display("PASS");
    $finish;
  end

endmodule