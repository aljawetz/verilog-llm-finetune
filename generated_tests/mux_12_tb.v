`timescale 1ns/1ps

module tb_mux;

  // Inputs
  reg i1;
  reg i2;
  reg s;

  // Output
  wire o;

  // Instantiate the Unit Under Test (UUT)
  mux uut (
    .o(o),
    .i1(i1),
    .i2(i2),
    .s(s)
  );

  initial begin
    // Test case 1: i1 = 0, i2 = 0, s = 0
    i1 = 0; i2 = 0; s = 0;
    #10;
    if (o !== 0) $display("FAIL: Test case 1 failed, expected o = 0, got o = %b", o);

    // Test case 2: i1 = 0, i2 = 1, s = 0
    i1 = 0; i2 = 1; s = 0;
    #10;
    if (o !== 0) $display("FAIL: Test case 2 failed, expected o = 0, got o = %b", o);

    // Test case 3: i1 = 1, i2 = 0, s = 0
    i1 = 1; i2 = 0; s = 0;
    #10;
    if (o !== 1) $display("FAIL: Test case 3 failed, expected o = 1, got o = %b", o);

    // Test case 4: i1 = 1, i2 = 1, s = 0
    i1 = 1; i2 = 1; s = 0;
    #10;
    if (o !== 1) $display("FAIL: Test case 4 failed, expected o = 1, got o = %b", o);

    // Test case 5: i1 = 0, i2 = 0, s = 1
    i1 = 0; i2 = 0; s = 1;
    #10;
    if (o !== 0) $display("FAIL: Test case 5 failed, expected o = 0, got o = %b", o);

    // Test case 6: i1 = 0, i2 = 1, s = 1
    i1 = 0; i2 = 1; s = 1;
    #10;
    if (o !== 1) $display("FAIL: Test case 6 failed, expected o = 1, got o = %b", o);

    // Test case 7: i1 = 1, i2 = 0, s = 1
    i1 = 1; i2 = 0; s = 1;
    #10;
    if (o !== 0) $display("FAIL: Test case 7 failed, expected o = 0, got o = %b", o);

    // Test case 8: i1 = 1, i2 = 1, s = 1
    i1 = 1; i2 = 1; s = 1;
    #10;
    if (o !== 1) $display("FAIL: Test case 8 failed, expected o = 1, got o = %b", o);

    $display("PASS");
    $finish;
  end

endmodule