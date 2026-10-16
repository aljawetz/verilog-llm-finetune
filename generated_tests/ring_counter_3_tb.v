`timescale 1ns/1ps

module tb_ring_counter;

  reg clk;
  reg reset;
  wire [3:0] count;

  // Instantiate the ring_counter module
  ring_counter uut (
    .clk(clk),
    .reset(reset),
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
    reset = 1;
    #10; // Wait for 10ns
    reset = 0; // Release reset

    // Check initial state
    if (count !== 4'b0001) begin
      $display("FAIL: Initial state is incorrect, expected 0001 but got %b", count);
      $finish;
    end

    // Run the counter for a few cycles
    #10; // Wait for 1 clock cycle
    if (count !== 4'b0010) begin
      $display("FAIL: After 1 clock cycle, expected 0010 but got %b", count);
      $finish;
    end

    #10; // Wait for 1 clock cycle
    if (count !== 4'b0100) begin
      $display("FAIL: After 2 clock cycles, expected 0100 but got %b", count);
      $finish;
    end

    #10; // Wait for 1 clock cycle
    if (count !== 4'b1000) begin
      $display("FAIL: After 3 clock cycles, expected 1000 but got %b", count);
      $finish;
    end

    #10; // Wait for 1 clock cycle
    if (count !== 4'b0001) begin
      $display("FAIL: After 4 clock cycles, expected 0001 but got %b", count);
      $finish;
    end

    // Assert reset functionality
    reset = 1; // Assert reset
    #10; // Wait for 1 clock cycle
    if (count !== 4'b0001) begin
      $display("FAIL: After reset, expected 0001 but got %b", count);
      $finish;
    end

    // Release reset and check again
    reset = 0; // Release reset
    #10; // Wait for 1 clock cycle
    if (count !== 4'b0010) begin
      $display("FAIL: After releasing reset, expected 0010 but got %b", count);
      $finish;
    end

    // If all checks pass
    $display("PASS");
    $finish;
  end

endmodule