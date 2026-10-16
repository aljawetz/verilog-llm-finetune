`timescale 1ns/1ps

module tb_melay_non_over;
  reg clk;
  reg rst_n;
  reg x;
  wire z;

  // Instantiate the module under test
  melay_non_over uut (
    .clk(clk),
    .rst_n(rst_n),
    .x(x),
    .z(z)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
  end

  // Test sequence
  initial begin
    // Initialize inputs
    rst_n = 0;
    x = 0;
    #10; // Wait for 10ns

    // Release reset
    rst_n = 1;
    #10;

    // Test sequence
    // State transitions and output checks
    // S0 -> S1
    x = 0; #10;
    if (uut.state !== 4'h1 || z !== 1'b0) $display("FAIL: Expected state S1 and z=0");

    // S1 -> S2
    x = 1; #10;
    if (uut.state !== 4'h2 || z !== 1'b0) $display("FAIL: Expected state S2 and z=0");

    // S2 -> S3
    x = 0; #10;
    if (uut.state !== 4'h3 || z !== 1'b0) $display("FAIL: Expected state S3 and z=0");

    // S3 -> S0 (z should be 1 when x is 0)
    x = 1; #10;
    if (uut.state !== 4'h0 || z !== 1'b1) $display("FAIL: Expected state S0 and z=1");

    // S0 -> S1
    x = 0; #10;
    if (uut.state !== 4'h1 || z !== 1'b0) $display("FAIL: Expected state S1 and z=0");

    // Reset the FSM
    rst_n = 0; #10;
    rst_n = 1; #10;

    // Check after reset
    if (uut.state !== 4'h0 || z !== 1'b0) $display("FAIL: Expected state S0 and z=0 after reset");

    // End simulation
    $display("PASS");
    $finish;
  end
endmodule