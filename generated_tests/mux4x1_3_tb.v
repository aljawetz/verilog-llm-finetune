`timescale 1ns/1ps

module tb_mux4x1;

  // Inputs
  reg i0;
  reg i1;
  reg i2;
  reg i3;
  reg s0;
  reg s1;

  // Output
  wire y;

  // Instantiate the Unit Under Test (UUT)
  mux4x1 uut (
    .i0(i0),
    .i1(i1),
    .i2(i2),
    .i3(i3),
    .s0(s0),
    .s1(s1),
    .y(y)
  );

  initial begin
    // Initialize inputs
    i0 = 0; i1 = 0; i2 = 0; i3 = 0; s0 = 0; s1 = 0;

    // Test case 1: Select i0
    i0 = 1; i1 = 0; i2 = 0; i3 = 0; s0 = 0; s1 = 0;
    #10;
    if (y !== i0) $display("FAIL: Test case 1 failed, expected %b, got %b", i0, y);

    // Test case 2: Select i1
    i0 = 0; i1 = 1; i2 = 0; i3 = 0; s0 = 1; s1 = 0;
    #10;
    if (y !== i1) $display("FAIL: Test case 2 failed, expected %b, got %b", i1, y);

    // Test case 3: Select i2
    i0 = 0; i1 = 0; i2 = 1; i3 = 0; s0 = 0; s1 = 1;
    #10;
    if (y !== i2) $display("FAIL: Test case 3 failed, expected %b, got %b", i2, y);

    // Test case 4: Select i3
    i0 = 0; i1 = 0; i2 = 0; i3 = 1; s0 = 1; s1 = 1;
    #10;
    if (y !== i3) $display("FAIL: Test case 4 failed, expected %b, got %b", i3, y);

    // Test case 5: Default case
    i0 = 0; i1 = 0; i2 = 0; i3 = 0; s0 = 1; s1 = 1; // Should not select any valid input
    #10;
    if (y !== i3) $display("FAIL: Test case 5 failed, expected %b, got %b", i3, y);

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule