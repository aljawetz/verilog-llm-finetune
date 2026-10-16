`timescale 1ns/1ps

module tb_full_sub;

  // Inputs
  reg X;
  reg Y;
  reg Z;

  // Outputs
  wire Diff;
  wire Borr;

  // Instantiate the Unit Under Test (UUT)
  full_sub uut (
    .X(X),
    .Y(Y),
    .Z(Z),
    .Diff(Diff),
    .Borr(Borr)
  );

  initial begin
    // Test case 1: X=0, Y=0, Z=0
    X = 0; Y = 0; Z = 0;
    #10;
    if (Diff !== 0 || Borr !== 0) $display("FAIL: Test case 1 failed");

    // Test case 2: X=0, Y=0, Z=1
    X = 0; Y = 0; Z = 1;
    #10;
    if (Diff !== 1 || Borr !== 0) $display("FAIL: Test case 2 failed");

    // Test case 3: X=0, Y=1, Z=0
    X = 0; Y = 1; Z = 0;
    #10;
    if (Diff !== 1 || Borr !== 1) $display("FAIL: Test case 3 failed");

    // Test case 4: X=0, Y=1, Z=1
    X = 0; Y = 1; Z = 1;
    #10;
    if (Diff !== 0 || Borr !== 1) $display("FAIL: Test case 4 failed");

    // Test case 5: X=1, Y=0, Z=0
    X = 1; Y = 0; Z = 0;
    #10;
    if (Diff !== 1 || Borr !== 0) $display("FAIL: Test case 5 failed");

    // Test case 6: X=1, Y=0, Z=1
    X = 1; Y = 0; Z = 1;
    #10;
    if (Diff !== 0 || Borr !== 0) $display("FAIL: Test case 6 failed");

    // Test case 7: X=1, Y=1, Z=0
    X = 1; Y = 1; Z = 0;
    #10;
    if (Diff !== 0 || Borr !== 1) $display("FAIL: Test case 7 failed");

    // Test case 8: X=1, Y=1, Z=1
    X = 1; Y = 1; Z = 1;
    #10;
    if (Diff !== 1 || Borr !== 1) $display("FAIL: Test case 8 failed");

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule