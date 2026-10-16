`timescale 1ns/1ps

module tb_sky130_fd_sc_hd__mux2_1;

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
    // Test case 1: Select A1 when S = 1
    A1 = 1'b1; A0 = 1'b0; S = 1'b1;
    #10;
    if (X !== 1'b1) $display("FAIL: Test case 1 failed, expected X = 1, got X = %b", X);

    // Test case 2: Select A0 when S = 0
    A1 = 1'b0; A0 = 1'b1; S = 1'b0;
    #10;
    if (X !== 1'b1) $display("FAIL: Test case 2 failed, expected X = 1, got X = %b", X);

    // Test case 3: Select A1 when S = 1 with different values
    A1 = 1'b0; A0 = 1'b1; S = 1'b1;
    #10;
    if (X !== 1'b0) $display("FAIL: Test case 3 failed, expected X = 0, got X = %b", X);

    // Test case 4: Select A0 when S = 0 with different values
    A1 = 1'b1; A0 = 1'b0; S = 1'b0;
    #10;
    if (X !== 1'b0) $display("FAIL: Test case 4 failed, expected X = 0, got X = %b", X);

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule