`timescale 1ns/1ps

module tb_more_ovr;
  reg clk;
  reg rst_n;
  reg x;
  wire z;

  // Instantiate the module under test (uut)
  more_ovr uut (
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

    // Apply reset
    #10;
    rst_n = 1; // Release reset
    #10;

    // Test sequence
    // State transitions
    // S0 -> S1
    x = 0; #10;
    if (uut.state !== 4'd1) $display("FAIL: Expected state S1 after S0 with x=0");

    // S1 -> S1
    x = 0; #10;
    if (uut.state !== 4'd1) $display("FAIL: Expected state S1 after S1 with x=0");

    // S1 -> S2
    x = 1; #10;
    if (uut.state !== 4'd2) $display("FAIL: Expected state S2 after S1 with x=1");

    // S2 -> S1
    x = 0; #10;
    if (uut.state !== 4'd1) $display("FAIL: Expected state S1 after S2 with x=0");

    // S2 -> S3
    x = 1; #10;
    if (uut.state !== 4'd3) $display("FAIL: Expected state S3 after S1 with x=1");

    // S3 -> S4
    x = 0; #10;
    if (uut.state !== 4'd4) $display("FAIL: Expected state S4 after S3 with x=0");

    // Check output z
    if (uut.z !== 1) $display("FAIL: Expected z=1 when in state S4");

    // S4 -> S2
    x = 1; #10;
    if (uut.state !== 4'd2) $display("FAIL: Expected state S2 after S4 with x=1");

    // S4 -> S1
    x = 0; #10;
    if (uut.state !== 4'd1) $display("FAIL: Expected state S1 after S2 with x=0");

    // End simulation
    $display("PASS");
    $finish;
  end
endmodule