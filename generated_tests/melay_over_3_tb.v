`timescale 1ns/1ps

module tb_melay_over;
  reg clk;
  reg rst_n;
  reg x;
  wire z;

  // Instantiate the module under test (uut)
  melay_over uut (
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
    // Initialize signals
    rst_n = 0;
    x = 0;

    // Apply reset
    #10;
    rst_n = 1; // Release reset
    #10;

    // Test sequence
    // State S0 -> S1 (x=0)
    x = 0; #10;
    if (uut.state !== 4'h2) $display("FAIL: Expected state S1 after S0 with x=0");

    // State S1 -> S2 (x=1)
    x = 1; #10;
    if (uut.state !== 4'h3) $display("FAIL: Expected state S2 after S1 with x=1");

    // State S2 -> S3 (x=1)
    x = 1; #10;
    if (uut.state !== 4'h4) $display("FAIL: Expected state S3 after S2 with x=1");

    // State S3 -> S1 (x=0), z should be 1
    x = 0; #10;
    if (uut.state !== 4'h2) $display("FAIL: Expected state S1 after S3 with x=0");
    if (uut.z !== 1) $display("FAIL: Expected z=1 when leaving S3 with x=0");

    // State S1 -> S1 (x=0)
    x = 0; #10;
    if (uut.state !== 4'h2) $display("FAIL: Expected state S1 after S1 with x=0");

    // State S1 -> S2 (x=1)
    x = 1; #10;
    if (uut.state !== 4'h3) $display("FAIL: Expected state S2 after S1 with x=1");

    // State S2 -> S1 (x=0), z should be 1
    x = 0; #10;
    if (uut.state !== 4'h2) $display("FAIL: Expected state S1 after S2 with x=0");
    if (uut.z !== 1) $display("FAIL: Expected z=1 when leaving S3 with x=0");

    // If all checks pass
    $display("PASS");
    $finish;
  end
endmodule