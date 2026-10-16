`timescale 1ns/1ps

module tb_mux2_1_wrapper;

  // Inputs
  reg [0:0] A0;
  reg [0:0] A1;
  reg [0:0] S;

  // Output
  wire [0:0] X;

  // Instantiate the Unit Under Test (UUT)
  sky130_fd_sc_hd__mux2_1_wrapper uut (
    .A0(A0),
    .A1(A1),
    .S(S),
    .X(X)
  );

  // Test procedure
  initial begin
    // Test case 1: A0 = 0, A1 = 0, S = 0 -> X should be 0
    A0 = 1'b0; A1 = 1'b0; S = 1'b0;
    #10;
    if (X !== 1'b0) $display("FAIL: Test case 1 failed, expected X = 0, got X = %b", X);

    // Test case 2: A0 = 0, A1 = 1, S = 0 -> X should be 0
    A0 = 1'b0; A1 = 1'b1; S = 1'b0;
    #10;
    if (X !== 1'b0) $display("FAIL: Test case 2 failed, expected X = 0, got X = %b", X);

    // Test case 3: A0 = 1, A1 = 0, S = 0 -> X should be 0
    A0 = 1'b1; A1 = 1'b0; S = 1'b0;
    #10;
    if (X !== 1'b0) $display("FAIL: Test case 3 failed, expected X = 0, got X = %b", X);

    // Test case 4: A0 = 0, A1 = 0, S = 1 -> X should be 0
    A0 = 1'b0; A1 = 1'b0; S = 1'b1;
    #10;
    if (X !== 1'b0) $display("FAIL: Test case 4 failed, expected X = 0, got X = %b", X);

    // Test case 5: A0 = 0, A1 = 1, S = 1 -> X should be 1
    A0 = 1'b0; A1 = 1'b1; S = 1'b1;
    #10;
    if (X !== 1'b1) $display("FAIL: Test case 5 failed, expected X = 1, got X = %b", X);

    // Test case 6: A0 = 1, A1 = 0, S = 1 -> X should be 0
    A0 = 1'b1; A1 = 1'b0; S = 1'b1;
    #10;
    if (X !== 1'b0) $display("FAIL: Test case 6 failed, expected X = 0, got X = %b", X);

    // Test case 7: A0 = 1, A1 = 1, S = 1 -> X should be 1
    A0 = 1'b1; A1 = 1'b1; S = 1'b1;
    #10;
    if (X !== 1'b1) $display("FAIL: Test case 7 failed, expected X = 1, got X = %b", X);

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule