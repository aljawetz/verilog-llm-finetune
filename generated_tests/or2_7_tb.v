`timescale 1ns/1ps

module tb_or2;

  // Inputs
  reg i0;
  reg i1;

  // Outputs
  wire o;

  // Instantiate the Unit Under Test (UUT)
  or2 uut (
    .i0(i0),
    .i1(i1),
    .o(o)
  );

  initial begin
    // Test case 1: i0 = 0, i1 = 0
    i0 = 0; i1 = 0;
    #10;
    if (o !== 0) $display("FAIL: Test case 1 failed, expected o = 0, got o = %b", o);

    // Test case 2: i0 = 0, i1 = 1
    i0 = 0; i1 = 1;
    #10;
    if (o !== 1) $display("FAIL: Test case 2 failed, expected o = 1, got o = %b", o);

    // Test case 3: i0 = 1, i1 = 0
    i0 = 1; i1 = 0;
    #10;
    if (o !== 1) $display("FAIL: Test case 3 failed, expected o = 1, got o = %b", o);

    // Test case 4: i0 = 1, i1 = 1
    i0 = 1; i1 = 1;
    #10;
    if (o !== 1) $display("FAIL: Test case 4 failed, expected o = 1, got o = %b", o);

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule