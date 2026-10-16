`timescale 1ns/1ps

module tb_NAND2x1;

  reg A;
  reg B;
  wire Y;

  // Instantiate the module under test (uut)
  NAND2x1 uut (
    .Y(Y),
    .A(A),
    .B(B)
  );

  initial begin
    // Test case 1: A = 0, B = 0
    A = 0; B = 0;
    #10;
    if (Y !== 1) begin
      $display("FAIL: Test case 1 failed (A=0, B=0)");
      $finish;
    end

    // Test case 2: A = 0, B = 1
    A = 0; B = 1;
    #10;
    if (Y !== 1) begin
      $display("FAIL: Test case 2 failed (A=0, B=1)");
      $finish;
    end

    // Test case 3: A = 1, B = 0
    A = 1; B = 0;
    #10;
    if (Y !== 1) begin
      $display("FAIL: Test case 3 failed (A=1, B=0)");
      $finish;
    end

    // Test case 4: A = 1, B = 1
    A = 1; B = 1;
    #10;
    if (Y !== 0) begin
      $display("FAIL: Test case 4 failed (A=1, B=1)");
      $finish;
    end

    $display("PASS");
    $finish;
  end

endmodule