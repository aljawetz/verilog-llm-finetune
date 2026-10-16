`timescale 1ns/1ps

module tb_sky130_fd_sc_hd__mux2_1_wrapper;

  // Inputs
  reg [0:0] A0;
  reg [0:0] A1;
  reg [0:0] S;

  // Outputs
  wire [0:0] X;

  // Instantiate the Unit Under Test (UUT)
  sky130_fd_sc_hd__mux2_1_wrapper uut (
    .A0(A0),
    .A1(A1),
    .S(S),
    .X(X)
  );

  initial begin
    // Initialize Inputs
    A0 = 1'b0;
    A1 = 1'b0;
    S = 1'b0;

    // Wait for global reset to finish
    #10;

    // Test case 1: S = 0, expect X = A0
    A0 = 1'b1; A1 = 1'b0; S = 1'b0;
    #10;
    if (X !== A0) $display("FAIL: Test case 1 failed, expected X = %b, got X = %b", A0, X);

    // Test case 2: S = 1, expect X = A1
    A0 = 1'b0; A1 = 1'b1; S = 1'b1;
    #10;
    if (X !== A1) $display("FAIL: Test case 2 failed, expected X = %b, got X = %b", A1, X);

    // Test case 3: S = 0, expect X = A0
    A0 = 1'b1; A1 = 1'b1; S = 1'b0;
    #10;
    if (X !== A0) $display("FAIL: Test case 3 failed, expected X = %b, got X = %b", A0, X);

    // Test case 4: S = 1, expect X = A1
    A0 = 1'b0; A1 = 1'b0; S = 1'b1;
    #10;
    if (X !== A1) $display("FAIL: Test case 4 failed, expected X = %b, got X = %b", A1, X);

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule