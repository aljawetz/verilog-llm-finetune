`timescale 1ns/1ps

module tb_sky130_fd_sc_hd__or2_1;

  // Inputs
  reg [0:0] A;
  reg [0:0] B;

  // Outputs
  wire [0:0] X;

  // Instantiate the Unit Under Test (UUT)
  sky130_fd_sc_hd__or2_1 uut (
    .A(A),
    .B(B),
    .X(X)
  );

  initial begin
    // Test Case 1: A = 0, B = 0 -> X should be 0
    A = 1'b0; B = 1'b0;
    #10;
    if (X !== 1'b0) $display("FAIL: Test Case 1 failed, expected X=0, got X=%b", X);

    // Test Case 2: A = 0, B = 1 -> X should be 1
    A = 1'b0; B = 1'b1;
    #10;
    if (X !== 1'b1) $display("FAIL: Test Case 2 failed, expected X=1, got X=%b", X);

    // Test Case 3: A = 1, B = 0 -> X should be 1
    A = 1'b1; B = 1'b0;
    #10;
    if (X !== 1'b1) $display("FAIL: Test Case 3 failed, expected X=1, got X=%b", X);

    // Test Case 4: A = 1, B = 1 -> X should be 1
    A = 1'b1; B = 1'b1;
    #10;
    if (X !== 1'b1) $display("FAIL: Test Case 4 failed, expected X=1, got X=%b", X);

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule