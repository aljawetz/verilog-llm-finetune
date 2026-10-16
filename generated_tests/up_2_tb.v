`timescale 1ns/1ps

module tb_up;

  reg clk;
  reg reset;
  reg up_down;
  wire [3:0] count;

  // Instantiate the module under test (uut)
  up uut (
    .clk(clk),
    .reset(reset),
    .up_down(up_down),
    .count(count)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
  end

  // Test sequence
  initial begin
    // Initialize signals
    reset = 1;
    up_down = 1; // Count up

    // Wait for a clock edge
    #10;
    reset = 0; // Release reset

    // Test counting up
    #10; // Wait for 1 clock cycle
    if (count !== 4'b0001) $display("FAIL: Expected count 1, got %b", count);

    #10; // Wait for 1 clock cycle
    if (count !== 4'b0010) $display("FAIL: Expected count 2, got %b", count);

    #10; // Wait for 1 clock cycle
    if (count !== 4'b0011) $display("FAIL: Expected count 3, got %b", count);

    // Change to counting down
    up_down = 0; // Count down

    #10; // Wait for 1 clock cycle
    if (count !== 4'b0010) $display("FAIL: Expected count 2, got %b", count);

    #10; // Wait for 1 clock cycle
    if (count !== 4'b0001) $display("FAIL: Expected count 1, got %b", count);

    #10; // Wait for 1 clock cycle
    if (count !== 4'b0000) $display("FAIL: Expected count 0, got %b", count);

    // Test reset functionality
    reset = 1; // Assert reset
    #10; // Wait for 1 clock cycle
    if (count !== 4'b0000) $display("FAIL: Expected count 0 after reset, got %b", count);

    reset = 0; // Release reset
    up_down = 1; // Count up again

    #10; // Wait for 1 clock cycle
    if (count !== 4'b0001) $display("FAIL: Expected count 1, got %b", count);

    #10; // Wait for 1 clock cycle
    if (count !== 4'b0010) $display("FAIL: Expected count 2, got %b", count);

    // End simulation
    $display("PASS");
    $finish;
  end

endmodule