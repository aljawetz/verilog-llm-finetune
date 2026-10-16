`timescale 1ns/1ps

module tb_FullSubtractor;

  reg A;
  reg B;
  reg Bin;
  wire Difference;
  wire Borrow;

  // Instantiate the FullSubtractor module
  FullSubtractor uut (
    .A(A),
    .B(B),
    .Bin(Bin),
    .Difference(Difference),
    .Borrow(Borrow)
  );

  initial begin
    // Test case 1: A=0, B=0, Bin=0
    A = 0; B = 0; Bin = 0;
    #10;
    if (Difference !== 0 || Borrow !== 0) $display("FAIL: Test case 1 failed");

    // Test case 2: A=0, B=0, Bin=1
    A = 0; B = 0; Bin = 1;
    #10;
    if (Difference !== 1 || Borrow !== 1) $display("FAIL: Test case 2 failed");

    // Test case 3: A=0, B=1, Bin=0
    A = 0; B = 1; Bin = 0;
    #10;
    if (Difference !== 1 || Borrow !== 1) $display("FAIL: Test case 3 failed");

    // Test case 4: A=0, B=1, Bin=1
    A = 0; B = 1; Bin = 1;
    #10;
    if (Difference !== 0 || Borrow !== 1) $display("FAIL: Test case 4 failed");

    // Test case 5: A=1, B=0, Bin=0
    A = 1; B = 0; Bin = 0;
    #10;
    if (Difference !== 1 || Borrow !== 0) $display("FAIL: Test case 5 failed");

    // Test case 6: A=1, B=0, Bin=1
    A = 1; B = 0; Bin = 1;
    #10;
    if (Difference !== 0 || Borrow !== 0) $display("FAIL: Test case 6 failed");

    // Test case 7: A=1, B=1, Bin=0
    A = 1; B = 1; Bin = 0;
    #10;
    if (Difference !== 0 || Borrow !== 1) $display("FAIL: Test case 7 failed");

    // Test case 8: A=1, B=1, Bin=1
    A = 1; B = 1; Bin = 1;
    #10;
    if (Difference !== 1 || Borrow !== 1) $display("FAIL: Test case 8 failed");

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule