`timescale 1ns/1ps

module tb_down_counter;
  reg clk;
  reg rst;
  wire [3:0] count;

  // Instantiate the down_counter module
  down_counter uut (
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

    // Test reset functionality
    rst = 0; // Assert reset
    #10; // Wait for a clock cycle
    if (count !== 4'b1111) begin
      $display("FAIL: Reset did not set count to 15");
      $finish;
    end

    rst = 1; // Deassert reset
    #10; // Wait for a clock cycle

    // Test counting down
    if (count !== 4'b1110) begin
      $display("FAIL: Count did not decrement to 14");
      $finish;
    end

    #10; // Wait for a clock cycle
    if (count !== 4'b1101) begin
      $display("FAIL: Count did not decrement to 13");
      $finish;
    end

    #10; // Wait for a clock cycle
    if (count !== 4'b1100) begin
      $display("FAIL: Count did not decrement to 12");
      $finish;
    end

    // Continue testing until count reaches 0
    repeat (12) begin
      #10; // Wait for a clock cycle
    end

    if (count !== 4'b0000) begin
      $display("FAIL: Count did not reach 0");
      $finish;
    end

    // Test wrap around to 15
    #10; // Wait for a clock cycle
    if (count !== 4'b1111) begin
      $display("FAIL: Count did not wrap around to 15");
      $finish;
    end

    $display("PASS");
    $finish;
  end
endmodule