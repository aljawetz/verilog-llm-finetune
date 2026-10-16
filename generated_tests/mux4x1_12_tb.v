`timescale 1ns/1ps

module tb_mux4x1;

  reg A, B, C, D;
  reg S0, S1;
  wire Y;

  // Instantiate the module under test (uut)
  mux4x1 uut (
    .A(A),
    .B(B),
    .C(C),
    .D(D),
    .S0(S0),
    .S1(S1),
    .Y(Y)
  );

  initial begin
    // Test case 1: Select A
    A = 1'b1; B = 1'b0; C = 1'b0; D = 1'b0; S0 = 1'b0; S1 = 1'b0;
    #10;
    if (Y !== A) $display("FAIL: Test case 1 failed, expected %b, got %b", A, Y);

    // Test case 2: Select B
    A = 1'b0; B = 1'b1; C = 1'b0; D = 1'b0; S0 = 1'b1; S1 = 1'b0;
    #10;
    if (Y !== B) $display("FAIL: Test case 2 failed, expected %b, got %b", B, Y);

    // Test case 3: Select C
    A = 1'b0; B = 1'b0; C = 1'b1; D = 1'b0; S0 = 1'b0; S1 = 1'b1;
    #10;
    if (Y !== C) $display("FAIL: Test case 3 failed, expected %b, got %b", C, Y);

    // Test case 4: Select D
    A = 1'b0; B = 1'b0; C = 1'b0; D = 1'b1; S0 = 1'b1; S1 = 1'b1;
    #10;
    if (Y !== D) $display("FAIL: Test case 4 failed, expected %b, got %b", D, Y);

    // Test case 5: All inputs low, select A
    A = 1'b0; B = 1'b0; C = 1'b0; D = 1'b0; S0 = 1'b0; S1 = 1'b0;
    #10;
    if (Y !== A) $display("FAIL: Test case 5 failed, expected %b, got %b", A, Y);

    // Test case 6: All inputs high, select D
    A = 1'b1; B = 1'b1; C = 1'b1; D = 1'b1; S0 = 1'b1; S1 = 1'b1;
    #10;
    if (Y !== D) $display("FAIL: Test case 6 failed, expected %b, got %b", D, Y);

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule