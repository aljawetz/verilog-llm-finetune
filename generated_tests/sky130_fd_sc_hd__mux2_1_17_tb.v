`timescale 1ns/1ps

module tb_mux2_1;

  // Inputs
  reg [0:0] A1;
  reg [0:0] A0;
  reg [0:0] S;

  // Output
  wire [0:0] X;

  // Instantiate the Unit Under Test (UUT)
  sky130_fd_sc_hd__mux2_1 uut (
    .A1(A1),
    .A0(A0),
    .S(S),
    .X(X)
  );

  initial begin
    // Test Case 1: Select A0
    A1 = 1'b0; A0 = 1'b1; S = 1'b0; #10;
    if (X !== A0) $display("FAIL: Test Case 1 failed, expected X = %b, got X = %b", A0, X);

    // Test Case 2: Select A1
    A1 = 1'b1; A0 = 1'b0; S = 1'b1; #10;
    if (X !== A1) $display("FAIL: Test Case 2 failed, expected X = %b, got X = %b", A1, X);

    // Test Case 3: Select A0 again
    A1 = 1'b0; A0 = 1'b1; S = 1'b0; #10;
    if (X !== A0) $display("FAIL: Test Case 3 failed, expected X = %b, got X = %b", A0, X);

    // Test Case 4: Select A1 again
    A1 = 1'b1; A0 = 1'b0; S = 1'b1; #10;
    if (X !== A1) $display("FAIL: Test Case 4 failed, expected X = %b, got X = %b", A1, X);

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule