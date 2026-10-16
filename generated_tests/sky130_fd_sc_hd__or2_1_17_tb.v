`timescale 1ns/1ps

module tb_sky130_fd_sc_hd__or2_1;

  // Inputs
  reg [0:0] A;
  reg [0:0] B;

  // Outputs
  wire [0:0] X;

  // Instantiate the module under test (uut)
  sky130_fd_sc_hd__or2_1 uut (
    .A(A),
    .B(B),
    .X(X)
  );

  initial begin
    // Test case 1: A = 0, B = 0 -> X should be 0
    A = 1'b0; B = 1'b0;
    #10;
    if (X !== 1'b0) $display("FAIL: Test case 1 failed (A=0, B=0)");

    // Test case 2: A = 0, B = 1 -> X should be 1
    A = 1'b0; B = 1'b1;
    #10;
    if (X !== 1'b1) $display("FAIL: Test case 2 failed (A=0, B=1)");

    // Test case 3: A = 1, B = 0 -> X should be 1
    A = 1'b1; B = 1'b0;
    #10;
    if (X !== 1'b1) $display("FAIL: Test case 3 failed (A=1, B=0)");

    // Test case 4: A = 1, B = 1 -> X should be 1
    A = 1'b1; B = 1'b1;
    #10;
    if (X !== 1'b1) $display("FAIL: Test case 4 failed (A=1, B=1)");

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule