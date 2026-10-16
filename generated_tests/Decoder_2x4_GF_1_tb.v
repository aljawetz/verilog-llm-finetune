`timescale 1ns/1ps

module tb_Decoder_2x4_GF;

  // Inputs
  reg A;
  reg B;
  reg E;

  // Outputs
  wire [3:0] D;

  // Instantiate the Unit Under Test (UUT)
  Decoder_2x4_GF uut (
    .D(D),
    .A(A),
    .B(B),
    .E(E)
  );

  initial begin
    // Initialize Inputs
    A = 0;
    B = 0;
    E = 1; // E is active-high initially

    // Wait for global reset to finish
    #10;

    // Test case 1: E = 0, A = 0, B = 0
    E = 0; A = 0; B = 0; #10;
    if (D !== 4'b1110) $display("FAIL: Test case 1 failed, D = %b", D);

    // Test case 2: E = 0, A = 0, B = 1
    E = 0; A = 0; B = 1; #10;
    if (D !== 4'b1101) $display("FAIL: Test case 2 failed, D = %b", D);

    // Test case 3: E = 0, A = 1, B = 0
    E = 0; A = 1; B = 0; #10;
    if (D !== 4'b1011) $display("FAIL: Test case 3 failed, D = %b", D);

    // Test case 4: E = 0, A = 1, B = 1
    E = 0; A = 1; B = 1; #10;
    if (D !== 4'b0111) $display("FAIL: Test case 4 failed, D = %b", D);

    // Test case 5: E = 1, A = 0, B = 0
    E = 1; A = 0; B = 0; #10;
    if (D !== 4'b1111) $display("FAIL: Test case 5 failed, D = %b", D);

    // Test case 6: E = 1, A = 0, B = 1
    E = 1; A = 0; B = 1; #10;
    if (D !== 4'b1111) $display("FAIL: Test case 6 failed, D = %b", D);

    // Test case 7: E = 1, A = 1, B = 0
    E = 1; A = 1; B = 0; #10;
    if (D !== 4'b1111) $display("FAIL: Test case 7 failed, D = %b", D);

    // Test case 8: E = 1, A = 1, B = 1
    E = 1; A = 1; B = 1; #10;
    if (D !== 4'b1111) $display("FAIL: Test case 8 failed, D = %b", D);

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule