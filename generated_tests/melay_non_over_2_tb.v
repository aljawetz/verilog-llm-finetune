`timescale 1ns/1ps

module tb_melay_non_over;
  reg clk;
  reg rst_n;
  reg x;
  wire z;

  // Instantiate the module under test (uut)
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
    // Initialize signals
    rst_n = 0;
    x = 0;
    #10; // Wait for 10ns

    // Release reset
    rst_n = 1;
    #10;

    // Test sequence
    // State S0 -> S1 (x=0)
    x = 0; #10;
    if (uut.state !== 4'h1) $display("FAIL: Expected state S1, got %h", uut.state);

    // State S1 -> S2 (x=1)
    x = 1; #10;
    if (uut.state !== 4'h2) $display("FAIL: Expected state S2, got %h", uut.state);

    // State S2 -> S3 (x=1)
    x = 1; #10;
    if (uut.state !== 4'h3) $display("FAIL: Expected state S3, got %h", uut.state);

    // State S3 -> S0 (x=0), z should be 1
    x = 0; #10;
    if (uut.state !== 4'h0) $display("FAIL: Expected state S0, got %h", uut.state);
    if (z !== 1) $display("FAIL: Expected z=1, got z=%b", z);

    // State S0 -> S1 (x=0)
    x = 0; #10;
    if (uut.state !== 4'h1) $display("FAIL: Expected state S1, got %h", uut.state);

    // State S1 -> S1 (x=0)
    x = 0; #10;
    if (uut.state !== 4'h1) $display("FAIL: Expected state S1, got %h", uut.state);

    // State S1 -> S2 (x=1)
    x = 1; #10;
    if (uut.state !== 4'h2) $display("FAIL: Expected state S2, got %h", uut.state);

    // State S2 -> S1 (x=0)
    x = 0; #10;
    if (uut.state !== 4'h1) $display("FAIL: Expected state S1, got %h", uut.state);

    // State S1 -> S2 (x=1)
    x = 1; #10;
    if (uut.state !== 4'h2) $display("FAIL: Expected state S2, got %h", uut.state);

    // State S2 -> S3 (x=1)
    x = 1; #10;
    if (uut.state !== 4'h3) $display("FAIL: Expected state S3, got %h", uut.state);

    // State S3 -> S0 (x=0), z should be 1
    x = 0; #10;
    if (uut.state !== 4'h0) $display("FAIL: Expected state S0, got %h", uut.state);
    if (z !== 1) $display("FAIL: Expected z=1, got z=%b", z);

    // End simulation
    $display("PASS");
    $finish;
  end
endmodule