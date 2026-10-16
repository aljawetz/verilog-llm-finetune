`timescale 1ns/1ps

module tb_sisov;
  reg clk;
  reg rst;
  reg in;
  wire out;

  // Instantiate the module under test (uut)
  sisov uut (
    .clk(clk),
    .rst(rst),
    .in(in),
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
    rst = 1;
    in = 0;
    #10; // Wait for 10ns

    // Release reset
    rst = 0;
    #10;

    // Test case 1: Shift in '1' and check output
    in = 1; // Load '1' into MSB
    #10; // Wait for one clock cycle
    if (out !== 0) $display("FAIL: Expected out = 0, got %b", out);

    // Test case 2: Shift in '0' and check output
    in = 0; // Load '0' into MSB
    #10; // Wait for one clock cycle
    if (out !== 1) $display("FAIL: Expected out = 1, got %b", out);

    // Test case 3: Shift in '1' and check output
    in = 1; // Load '1' into MSB
    #10; // Wait for one clock cycle
    if (out !== 0) $display("FAIL: Expected out = 0, got %b", out);

    // Test case 4: Shift in '1' multiple times
    in = 1; #10; // Load '1'
    if (out !== 0) $display("FAIL: Expected out = 0, got %b", out);
    #10; // Next shift
    if (out !== 1) $display("FAIL: Expected out = 1, got %b", out);
    #10; // Next shift
    if (out !== 1) $display("FAIL: Expected out = 1, got %b", out);
    #10; // Next shift
    if (out !== 1) $display("FAIL: Expected out = 1, got %b", out);

    // Test case 5: Reset the register
    rst = 1; #10; // Assert reset
    rst = 0; #10; // Release reset
    if (out !== 0) $display("FAIL: Expected out = 0 after reset, got %b", out);

    // Final check
    $display("PASS");
    $finish;
  end
endmodule