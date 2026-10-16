`timescale 1ns/1ps

module tb_mux;

  // Inputs
  reg A;
  reg B;
  reg S;

  // Output
  wire Y;

  // Instantiate the Unit Under Test (UUT)
  mux uut (
    .A(A),
    .B(B),
    .S(S),
    .Y(Y)
  );

  initial begin
    // Test case 1: A = 0, B = 0, S = 0
    A = 0; B = 0; S = 0;
    #10;
    if (Y !== 0) $display("FAIL: Test case 1 failed, expected Y=0, got Y=%b", Y);

    // Test case 2: A = 0, B = 1, S = 0
    A = 0; B = 1; S = 0;
    #10;
    if (Y !== 0) $display("FAIL: Test case 2 failed, expected Y=0, got Y=%b", Y);

    // Test case 3: A = 1, B = 0, S = 0
    A = 1; B = 0; S = 0;
    #10;
    if (Y !== 1) $display("FAIL: Test case 3 failed, expected Y=1, got Y=%b", Y);

    // Test case 4: A = 0, B = 0, S = 1
    A = 0; B = 0; S = 1;
    #10;
    if (Y !== 0) $display("FAIL: Test case 4 failed, expected Y=0, got Y=%b", Y);

    // Test case 5: A = 0, B = 1, S = 1
    A = 0; B = 1; S = 1;
    #10;
    if (Y !== 1) $display("FAIL: Test case 5 failed, expected Y=1, got Y=%b", Y);

    // Test case 6: A = 1, B = 0, S = 1
    A = 1; B = 0; S = 1;
    #10;
    if (Y !== 0) $display("FAIL: Test case 6 failed, expected Y=0, got Y=%b", Y);

    // Test case 7: A = 1, B = 1, S = 0
    A = 1; B = 1; S = 0;
    #10;
    if (Y !== 1) $display("FAIL: Test case 7 failed, expected Y=1, got Y=%b", Y);

    // Test case 8: A = 1, B = 1, S = 1
    A = 1; B = 1; S = 1;
    #10;
    if (Y !== 1) $display("FAIL: Test case 8 failed, expected Y=1, got Y=%b", Y);

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule