`timescale 1ns/1ps

module tb_up_counter;

  reg clk;
  reg reset;
  wire [2:0] count;

  // Instantiate the module under test (uut)
  up_counter uut (
    .count(count),
    .clk(clk),
    .reset(reset)
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
    #10; // Wait for a clock cycle
    reset = 0;

    // Check initial count
    if (count !== 3'b000) begin
      $display("FAIL: Initial count is not zero");
      $finish;
    end

    // Count up
    #10; // Wait for 1 clock cycle
    if (count !== 3'b001) begin
      $display("FAIL: Count did not increment to 1");
      $finish;
    end

    #10; // Wait for 1 clock cycle
    if (count !== 3'b010) begin
      $display("FAIL: Count did not increment to 2");
      $finish;
    end

    #10; // Wait for 1 clock cycle
    if (count !== 3'b011) begin
      $display("FAIL: Count did not increment to 3");
      $finish;
    end

    #10; // Wait for 1 clock cycle
    if (count !== 3'b100) begin
      $display("FAIL: Count did not increment to 4");
      $finish;
    end

    #10; // Wait for 1 clock cycle
    if (count !== 3'b101) begin
      $display("FAIL: Count did not increment to 5");
      $finish;
    end

    #10; // Wait for 1 clock cycle
    if (count !== 3'b110) begin
      $display("FAIL: Count did not increment to 6");
      $finish;
    end

    #10; // Wait for 1 clock cycle
    if (count !== 3'b111) begin
      $display("FAIL: Count did not increment to 7");
      $finish;
    end

    #10; // Wait for 1 clock cycle
    if (count !== 3'b000) begin
      $display("FAIL: Count did not wrap around to 0");
      $finish;
    end

    // Reset the counter
    reset = 1;
    #10; // Wait for a clock cycle
    reset = 0;

    // Check count after reset
    if (count !== 3'b000) begin
      $display("FAIL: Count is not zero after reset");
      $finish;
    end

    $display("PASS");
    $finish;
  end

endmodule