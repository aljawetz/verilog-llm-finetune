`timescale 1ns/1ps

module tb_mod_6_counter;

  reg clk;
  reg rst;
  wire [5:0] q;

  // Instantiate the module under test (uut)
  mod_6_counter #(6) uut (
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
    #10; // Wait for 10ns
    rst = 0; // Release reset

    // Test counting
    #10; // Wait for 10ns
    if (q !== 6'b000000) $display("FAIL: Initial count should be 0");

    // Count to 5
    #50; // Wait for 50ns (5 clock cycles)
    if (q !== 6'b000101) $display("FAIL: Count should be 5 after 5 clock cycles");

    // Count to 0 after reaching 5
    #10; // Wait for 10ns
    if (q !== 6'b000000) $display("FAIL: Count should wrap to 0 after reaching 5");

    // Count to 4
    #40; // Wait for 40ns (4 clock cycles)
    if (q !== 6'b000100) $display("FAIL: Count should be 4 after 4 more clock cycles");

    // Test reset functionality
    #10; // Wait for 10ns
    rst = 1; // Assert reset
    #10; // Wait for 10ns
    if (q !== 6'b000000) $display("FAIL: Count should be 0 after reset");
    rst = 0; // Release reset

    // Count to 3
    #30; // Wait for 30ns (3 clock cycles)
    if (q !== 6'b000011) $display("FAIL: Count should be 3 after 3 clock cycles");

    // Finish simulation
    $display("PASS");
    $finish;
  end

endmodule