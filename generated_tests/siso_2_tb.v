`timescale 1ns/1ps

module tb_siso;

  parameter WIDTH = 4;
  reg s_in;
  reg clk;
  reg arstn;
  wire s_out;

  // Instantiate the module under test
  siso #(WIDTH) uut (
    .s_in(s_in),
    .clk(clk),
    .arstn(arstn),
    .s_out(s_out)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
  end

  // Test sequence
  initial begin
    // Initialize inputs
    s_in = 0;
    arstn = 0;

    // Apply reset
    #10;
    arstn = 1; // Release reset

    // Test sequence
    // Shift in 1, expect s_out to be 0
    s_in = 1; #10;
    if (s_out !== 0) $display("FAIL: Expected s_out = 0, got %b", s_out);

    // Shift in 1, expect s_out to be 1
    s_in = 1; #10;
    if (s_out !== 1) $display("FAIL: Expected s_out = 1, got %b", s_out);

    // Shift in 0, expect s_out to be 1
    s_in = 0; #10;
    if (s_out !== 1) $display("FAIL: Expected s_out = 1, got %b", s_out);

    // Shift in 1, expect s_out to be 0
    s_in = 1; #10;
    if (s_out !== 0) $display("FAIL: Expected s_out = 0, got %b", s_out);

    // Shift in 0, expect s_out to be 1
    s_in = 0; #10;
    if (s_out !== 1) $display("FAIL: Expected s_out = 1, got %b", s_out);

    // Shift in 1, expect s_out to be 0
    s_in = 1; #10;
    if (s_out !== 0) $display("FAIL: Expected s_out = 0, got %b", s_out);

    // Shift in 0, expect s_out to be 1
    s_in = 0; #10;
    if (s_out !== 1) $display("FAIL: Expected s_out = 1, got %b", s_out);

    // Check full shift register behavior
    s_in = 1; #10; // 1
    s_in = 1; #10; // 1
    s_in = 0; #10; // 0
    s_in = 1; #10; // 1
    s_in = 0; #10; // 0
    s_in = 1; #10; // 1

    // Check the final output
    if (s_out !== 1) $display("FAIL: Expected s_out = 1, got %b", s_out);

    // End simulation
    $display("PASS");
    $finish;
  end

endmodule