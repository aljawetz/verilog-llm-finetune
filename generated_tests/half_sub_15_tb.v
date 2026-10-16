`timescale 1ns/1ps

module tb_half_sub;

  reg X;
  reg Y;
  wire Diff;
  wire Bout;

  // Instantiate the half_sub module
  half_sub uut (
    .Diff(Diff),
    .Bout(Bout),
    .X(X),
    .Y(Y)
  );

  initial begin
    // Test case 1: X = 0, Y = 0
    X = 0; Y = 0;
    #10;
    if (Diff !== 0 || Bout !== 0) $display("FAIL: Test case 1 failed (X=0, Y=0)");

    // Test case 2: X = 0, Y = 1
    X = 0; Y = 1;
    #10;
    if (Diff !== 1 || Bout !== 1) $display("FAIL: Test case 2 failed (X=0, Y=1)");

    // Test case 3: X = 1, Y = 0
    X = 1; Y = 0;
    #10;
    if (Diff !== 1 || Bout !== 0) $display("FAIL: Test case 3 failed (X=1, Y=0)");

    // Test case 4: X = 1, Y = 1
    X = 1; Y = 1;
    #10;
    if (Diff !== 0 || Bout !== 0) $display("FAIL: Test case 4 failed (X=1, Y=1)");

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule