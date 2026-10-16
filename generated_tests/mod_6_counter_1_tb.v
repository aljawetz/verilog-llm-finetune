`timescale 1ns/1ps

module tb_mod_6_counter;
  reg clk;
  reg rst;
  wire [5:0] q;

  // Instantiate the module under test (uut)
  mod_6_counter uut (
    .q(q),
    .clk(clk),
    .rst(rst)
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
    #10; // Wait for a few clock cycles
    rst = 0;

    // Check initial value
    if (q !== 6'b000000) begin
      $display("FAIL: Initial value is not 0");
      $finish;
    end

    // Count up to 5
    #50; // Wait for 5 clock cycles
    if (q !== 6'b000101) begin
      $display("FAIL: Counter did not count to 5 correctly");
      $finish;
    end

    // Count to 6 (should wrap around to 0)
    #10; // Wait for 1 clock cycle
    if (q !== 6'b000000) begin
      $display("FAIL: Counter did not wrap around to 0 after reaching 6");
      $finish;
    end

    // Count up to 3
    #30; // Wait for 3 clock cycles
    if (q !== 6'b000011) begin
      $display("FAIL: Counter did not count to 3 correctly after reset");
      $finish;
    end

    // Reset the counter
    rst = 1;
    #10; // Wait for a clock cycle
    rst = 0;

    // Check value after reset
    if (q !== 6'b000000) begin
      $display("FAIL: Counter did not reset to 0");
      $finish;
    end

    // Final count to 5
    #50; // Wait for 5 clock cycles
    if (q !== 6'b000101) begin
      $display("FAIL: Counter did not count to 5 correctly after reset");
      $finish;
    end

    // If all checks pass
    $display("PASS");
    $finish;
  end
endmodule