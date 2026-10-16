`timescale 1ns/1ps

module tb_mod16_counter;

  reg clk;
  reg reset;
  wire [3:0] count;

  // Instantiate the module under test (uut)
  mod16_counter uut (
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

    // Test counting
    #50; // Wait for some clock cycles

    // Check count value after 5 clock cycles (should be 5)
    if (count !== 4'b0101) begin
      $display("FAIL: Expected count 5, got %b", count);
      $finish;
    end

    // Continue counting to 15
    #50; // Wait for more clock cycles

    // Check count value after 10 clock cycles (should be 10)
    if (count !== 4'b1010) begin
      $display("FAIL: Expected count 10, got %b", count);
      $finish;
    end

    // Check wrap around
    #50; // Wait for more clock cycles

    // Check count value after 15 clock cycles (should be 15)
    if (count !== 4'b1111) begin
      $display("FAIL: Expected count 15, got %b", count);
      $finish;
    end

    // Check wrap around to 0
    #10; // Wait for one more clock cycle

    // Check count value after wrap around (should be 0)
    if (count !== 4'b0000) begin
      $display("FAIL: Expected count 0 after wrap around, got %b", count);
      $finish;
    end

    // Test reset functionality
    reset = 1; // Assert reset
    #10; // Wait for reset to take effect
    reset = 0; // Release reset

    // Check count value after reset (should be 0)
    if (count !== 4'b0000) begin
      $display("FAIL: Expected count 0 after reset, got %b", count);
      $finish;
    end

    // End of tests
    $display("PASS");
    $finish;
  end

endmodule