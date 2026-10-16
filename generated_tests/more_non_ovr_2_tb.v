`timescale 1ns/1ps

module tb_more_non_ovr;

  reg clk;
  reg rst_n;
  reg x;
  wire z;

  // Instantiate the module under test (uut)
  more_non_ovr uut (
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

    // Reset the FSM
    #10;
    rst_n = 1; // Release reset
    #10;

    // Test sequence to reach state S4
    // S0 -> S1 (x=0)
    x = 0; #10;
    if (uut.state !== 4'h1) $display("FAIL: Expected state S1, got %h", uut.state);

    // S1 -> S2 (x=1)
    x = 1; #10;
    if (uut.state !== 4'h2) $display("FAIL: Expected state S2, got %h", uut.state);

    // S2 -> S3 (x=1)
    x = 1; #10;
    if (uut.state !== 4'h3) $display("FAIL: Expected state S3, got %h", uut.state);

    // S3 -> S4 (x=0)
    x = 0; #10;
    if (uut.state !== 4'h4) $display("FAIL: Expected state S4, got %h", uut.state);
    if (z !== 1) $display("FAIL: Expected output z=1, got z=%b", z);

    // S4 -> S0 (x=0)
    x = 0; #10;
    if (uut.state !== 4'h0) $display("FAIL: Expected state S0, got %h", uut.state);
    if (z !== 0) $display("FAIL: Expected output z=0, got z=%b", z);

    // S0 -> S1 (x=0)
    x = 0; #10;
    if (uut.state !== 4'h1) $display("FAIL: Expected state S1, got %h", uut.state);

    // S1 -> S2 (x=1)
    x = 1; #10;
    if (uut.state !== 4'h2) $display("FAIL: Expected state S2, got %h", uut.state);

    // S2 -> S3 (x=1)
    x = 1; #10;
    if (uut.state !== 4'h3) $display("FAIL: Expected state S3, got %h", uut.state);

    // S3 -> S4 (x=0)
    x = 0; #10;
    if (uut.state !== 4'h4) $display("FAIL: Expected state S4, got %h", uut.state);
    if (z !== 1) $display("FAIL: Expected output z=1, got z=%b", z);

    // End of test
    $display("PASS");
    $finish;
  end

endmodule