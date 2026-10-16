`timescale 1ns/1ps

module tb_sipo;

  reg in;
  reg clk;
  reg reset;
  wire [3:0] out;

  // Instantiate the module under test (uut)
  sipo uut (
    .in(in),
    .clk(clk),
    .reset(reset),
    .out(out)
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
    in = 0;
    #10; // Wait for 10ns

    // Release reset
    reset = 0;
    #10;

    // Test shifting in bits
    in = 1; #10; // Shift in 1
    if (out !== 4'b0001) $display("FAIL: Expected out = 0001, got out = %b", out);

    in = 0; #10; // Shift in 0
    if (out !== 4'b0010) $display("FAIL: Expected out = 0010, got out = %b", out);

    in = 1; #10; // Shift in 1
    if (out !== 4'b0101) $display("FAIL: Expected out = 0101, got out = %b", out);

    in = 1; #10; // Shift in 1
    if (out !== 4'b1011) $display("FAIL: Expected out = 1011, got out = %b", out);

    in = 0; #10; // Shift in 0
    if (out !== 4'b0110) $display("FAIL: Expected out = 0110, got out = %b", out);

    // Test reset functionality
    reset = 1; #10; // Assert reset
    if (out !== 4'b0000) $display("FAIL: Expected out = 0000 after reset, got out = %b", out);

    reset = 0; #10; // Release reset

    // Shift in more bits after reset
    in = 1; #10; // Shift in 1
    if (out !== 4'b0001) $display("FAIL: Expected out = 0001 after reset, got out = %b", out);

    in = 1; #10; // Shift in 1
    if (out !== 4'b0011) $display("FAIL: Expected out = 0011, got out = %b", out);

    in = 0; #10; // Shift in 0
    if (out !== 4'b0110) $display("FAIL: Expected out = 0110, got out = %b", out);

    // If all checks pass
    $display("PASS");
    $finish;
  end

endmodule