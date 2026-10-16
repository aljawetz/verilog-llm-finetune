`timescale 1ns/1ps

module tb_sipov;
  reg clk;
  reg rst;
  reg in;
  wire [3:0] out;

  // Instantiate the Unit Under Test (UUT)
  sipov uut (
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
    // Initialize inputs
    rst = 1;
    in = 0;

    // Apply reset
    #10;
    rst = 0;

    // Test case 1: Shift in 1
    in = 1; #10;
    if (out !== 4'b0001) $display("FAIL: Test case 1 failed, expected 0001, got %b", out);

    // Test case 2: Shift in 0
    in = 0; #10;
    if (out !== 4'b0000) $display("FAIL: Test case 2 failed, expected 0000, got %b", out);

    // Test case 3: Shift in 1 again
    in = 1; #10;
    if (out !== 4'b1000) $display("FAIL: Test case 3 failed, expected 1000, got %b", out);

    // Test case 4: Shift in 1 again
    in = 1; #10;
    if (out !== 4'b1100) $display("FAIL: Test case 4 failed, expected 1100, got %b", out);

    // Test case 5: Shift in 0
    in = 0; #10;
    if (out !== 4'b1110) $display("FAIL: Test case 5 failed, expected 1110, got %b", out);

    // Test case 6: Reset the module
    rst = 1; #10;
    rst = 0; #10;
    if (out !== 4'b0000) $display("FAIL: Test case 6 failed after reset, expected 0000, got %b", out);

    // Test case 7: Shift in 1 after reset
    in = 1; #10;
    if (out !== 4'b0001) $display("FAIL: Test case 7 failed, expected 0001, got %b", out);

    // If all tests pass
    $display("PASS");
    $finish;
  end
endmodule