`timescale 1ns/1ps

module tb_xor2;

  // Inputs
  reg i0;
  reg i1;

  // Output
  wire o;

  // Instantiate the Unit Under Test (UUT)
  xor2 uut (
    .i0(i0),
    .i1(i1),
    .o(o)
  );

  initial begin
    // Test case 1: i0 = 0, i1 = 0 -> o should be 0
    i0 = 0; i1 = 0;
    #10;
    if (o !== 1'b0) begin
      $display("FAIL: Test case 1 failed (i0=0, i1=0, o=%b)", o);
      $finish;
    end

    // Test case 2: i0 = 0, i1 = 1 -> o should be 1
    i0 = 0; i1 = 1;
    #10;
    if (o !== 1'b1) begin
      $display("FAIL: Test case 2 failed (i0=0, i1=1, o=%b)", o);
      $finish;
    end

    // Test case 3: i0 = 1, i1 = 0 -> o should be 1
    i0 = 1; i1 = 0;
    #10;
    if (o !== 1'b1) begin
      $display("FAIL: Test case 3 failed (i0=1, i1=0, o=%b)", o);
      $finish;
    end

    // Test case 4: i0 = 1, i1 = 1 -> o should be 0
    i0 = 1; i1 = 1;
    #10;
    if (o !== 1'b0) begin
      $display("FAIL: Test case 4 failed (i0=1, i1=1, o=%b)", o);
      $finish;
    end

    $display("PASS");
    $finish;
  end

endmodule