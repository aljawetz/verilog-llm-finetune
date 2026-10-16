`timescale 1ns/1ps

module tb_operator_A;

  // Inputs
  reg A;
  reg B;

  // Outputs
  wire P;
  wire G;

  // Instantiate the Unit Under Test (UUT)
  operator_A uut (
    .A(A),
    .B(B),
    .P(P),
    .G(G)
  );

  initial begin
    // Test case 1: A = 0, B = 0
    A = 0; B = 0;
    #10;
    if (P !== 0 || G !== 0) begin
      $display("FAIL: Test case 1 failed (A=0, B=0)");
      $finish;
    end

    // Test case 2: A = 0, B = 1
    A = 0; B = 1;
    #10;
    if (P !== 1 || G !== 0) begin
      $display("FAIL: Test case 2 failed (A=0, B=1)");
      $finish;
    end

    // Test case 3: A = 1, B = 0
    A = 1; B = 0;
    #10;
    if (P !== 1 || G !== 0) begin
      $display("FAIL: Test case 3 failed (A=1, B=0)");
      $finish;
    end

    // Test case 4: A = 1, B = 1
    A = 1; B = 1;
    #10;
    if (P !== 0 || G !== 1) begin
      $display("FAIL: Test case 4 failed (A=1, B=1)");
      $finish;
    end

    $display("PASS");
    $finish;
  end

endmodule