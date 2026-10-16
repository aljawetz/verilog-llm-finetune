`timescale 1ns/1ps

module tb_up_counter;

  reg clk;
  reg rst;
  wire [3:0] count;

  // Instantiate the up_counter module
  up_counter uut (
    .clk(clk),
    .rst(rst),
    .count(count)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns period
  end

  // Test sequence
  initial begin
    // Initialize reset
    rst = 0;
    #10; // Wait for 10ns
    rst = 1; // Release reset

    // Check initial count value
    if (count !== 4'b0000) begin
      $display("FAIL: Initial count is not zero");
      $finish;
    end

    // Count up for a few cycles
    #10; // Wait for 1 clock cycle
    if (count !== 4'b0001) begin
      $display("FAIL: Count did not increment to 1");
      $finish;
    end

    #10; // Wait for another clock cycle
    if (count !== 4'b0010) begin
      $display("FAIL: Count did not increment to 2");
      $finish;
    end

    #10; // Wait for another clock cycle
    if (count !== 4'b0011) begin
      $display("FAIL: Count did not increment to 3");
      $finish;
    end

    #10; // Wait for another clock cycle
    if (count !== 4'b0100) begin
      $display("FAIL: Count did not increment to 4");
      $finish;
    end

    // Assert reset functionality
    rst = 0; // Assert reset
    #10; // Wait for 1 clock cycle
    if (count !== 4'b0000) begin
      $display("FAIL: Count did not reset to zero");
      $finish;
    end

    rst = 1; // Release reset
    #10; // Wait for 1 clock cycle
    if (count !== 4'b0001) begin
      $display("FAIL: Count did not increment to 1 after reset");
      $finish;
    end

    // Continue counting
    #10; // Wait for another clock cycle
    if (count !== 4'b0010) begin
      $display("FAIL: Count did not increment to 2");
      $finish;
    end

    // Finish the simulation
    $display("PASS");
    $finish;
  end

endmodule