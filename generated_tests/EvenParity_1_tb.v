`timescale 1ns/1ps

module tb_EvenParity;

  reg A, B, C;
  wire out;

  // Instantiate the module under test (uut)
  EvenParity uut (
    .A(A),
    .B(B),
    .C(C),
    .out(out)
  );

  initial begin
    // Test case 1: A=0, B=0, C=0 -> out should be 0
    A = 0; B = 0; C = 0;
    #10;
    if (out !== 0) $display("FAIL: Test case 1 failed, expected out=0, got out=%b", out);

    // Test case 2: A=0, B=0, C=1 -> out should be 1
    A = 0; B = 0; C = 1;
    #10;
    if (out !== 1) $display("FAIL: Test case 2 failed, expected out=1, got out=%b", out);

    // Test case 3: A=0, B=1, C=0 -> out should be 1
    A = 0; B = 1; C = 0;
    #10;
    if (out !== 1) $display("FAIL: Test case 3 failed, expected out=1, got out=%b", out);

    // Test case 4: A=0, B=1, C=1 -> out should be 0
    A = 0; B = 1; C = 1;
    #10;
    if (out !== 0) $display("FAIL: Test case 4 failed, expected out=0, got out=%b", out);

    // Test case 5: A=1, B=0, C=0 -> out should be 1
    A = 1; B = 0; C = 0;
    #10;
    if (out !== 1) $display("FAIL: Test case 5 failed, expected out=1, got out=%b", out);

    // Test case 6: A=1, B=0, C=1 -> out should be 0
    A = 1; B = 0; C = 1;
    #10;
    if (out !== 0) $display("FAIL: Test case 6 failed, expected out=0, got out=%b", out);

    // Test case 7: A=1, B=1, C=0 -> out should be 0
    A = 1; B = 1; C = 0;
    #10;
    if (out !== 0) $display("FAIL: Test case 7 failed, expected out=0, got out=%b", out);

    // Test case 8: A=1, B=1, C=1 -> out should be 1
    A = 1; B = 1; C = 1;
    #10;
    if (out !== 1) $display("FAIL: Test case 8 failed, expected out=1, got out=%b", out);

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule