`timescale 1ns/1ps

module tb_halfsub;

  reg A;
  reg B;
  wire Diff;
  wire Bor;

  // Instantiate the half subtractor
  halfsub uut (
    .A(A),
    .B(B),
    .Diff(Diff),
    .Bor(Bor)
  );

  initial begin
    // Test case 1: A = 0, B = 0
    A = 0; B = 0;
    #10;
    if (Diff !== 0 || Bor !== 0) begin
      $display("FAIL: Test case 1 failed (A=0, B=0)");
      $finish;
    end

    // Test case 2: A = 0, B = 1
    A = 0; B = 1;
    #10;
    if (Diff !== 1 || Bor !== 1) begin
      $display("FAIL: Test case 2 failed (A=0, B=1)");
      $finish;
    end

    // Test case 3: A = 1, B = 0
    A = 1; B = 0;
    #10;
    if (Diff !== 1 || Bor !== 0) begin
      $display("FAIL: Test case 3 failed (A=1, B=0)");
      $finish;
    end

    // Test case 4: A = 1, B = 1
    A = 1; B = 1;
    #10;
    if (Diff !== 0 || Bor !== 0) begin
      $display("FAIL: Test case 4 failed (A=1, B=1)");
      $finish;
    end

    $display("PASS");
    $finish;
  end

endmodule