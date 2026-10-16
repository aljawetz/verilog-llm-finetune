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
    // State transitions and output checks
    // S0 -> S1 (x = 0)
    x = 0; #10;
    if (uut.state !== 4'h2 || z !== 1'b0) $display("FAIL: Expected state S1, got %h, z = %b", uut.state, z);

    // S1 -> S2 (x = 1)
    x = 1; #10;
    if (uut.state !== 4'h3 || z !== 1'b0) $display("FAIL: Expected state S2, got %h, z = %b", uut.state, z);

    // S2 -> S3 (x = 1)
    x = 1; #10;
    if (uut.state !== 4'h4 || z !== 1'b0) $display("FAIL: Expected state S3, got %h, z = %b", uut.state, z);

    // S3 -> S0 (x = 1)
    x = 1; #10;
    if (uut.state !== 4'h1 || z !== 1'b1) $display("FAIL: Expected state S0, got %h, z = %b", uut.state, z);

    // S0 -> S1 (x = 0)
    x = 0; #10;
    if (uut.state !== 4'h2 || z !== 1'b0) $display("FAIL: Expected state S1, got %h, z = %b", uut.state, z);

    // S1 -> S1 (x = 0)
    x = 0; #10;
    if (uut.state !== 4'h2 || z !== 1'b0) $display("FAIL: Expected state S1, got %h, z = %b", uut.state, z);

    // S1 -> S2 (x = 1)
    x = 1; #10;
    if (uut.state !== 4'h3 || z !== 1'b0) $display("FAIL: Expected state S2, got %h, z = %b", uut.state, z);

    // S2 -> S1 (x = 0)
    x = 0; #10;
    if (uut.state !== 4'h2 || z !== 1'b0) $display("FAIL: Expected state S1, got %h, z = %b", uut.state, z);

    // Finish simulation
    $display("PASS");
    $finish;
  end
endmodule