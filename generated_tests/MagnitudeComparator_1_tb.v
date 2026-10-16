`timescale 1ns/1ps

module tb_MagnitudeComparator;

  reg [3:0] A;
  reg [3:0] B;
  wire A_greater_than_B;
  wire A_less_than_B;
  wire A_equal_to_B;

  // Instantiate the module under test (uut)
  MagnitudeComparator uut (
    .A(A),
    .B(B),
    .A_greater_than_B(A_greater_than_B),
    .A_less_than_B(A_less_than_B),
    .A_equal_to_B(A_equal_to_B)
  );

  initial begin
    // Test case 1: A = 4, B = 2 (A > B)
    A = 4; B = 2;
    #10;
    if (A_greater_than_B !== 1 || A_less_than_B !== 0 || A_equal_to_B !== 0) begin
      $display("FAIL: Test case 1 failed");
      $finish;
    end

    // Test case 2: A = 2, B = 4 (A < B)
    A = 2; B = 4;
    #10;
    if (A_greater_than_B !== 0 || A_less_than_B !== 1 || A_equal_to_B !== 0) begin
      $display("FAIL: Test case 2 failed");
      $finish;
    end

    // Test case 3: A = 3, B = 3 (A == B)
    A = 3; B = 3;
    #10;
    if (A_greater_than_B !== 0 || A_less_than_B !== 0 || A_equal_to_B !== 1) begin
      $display("FAIL: Test case 3 failed");
      $finish;
    end

    // Test case 4: A = 0, B = 0 (A == B)
    A = 0; B = 0;
    #10;
    if (A_greater_than_B !== 0 || A_less_than_B !== 0 || A_equal_to_B !== 1) begin
      $display("FAIL: Test case 4 failed");
      $finish;
    end

    // Test case 5: A = 15, B = 0 (A > B)
    A = 15; B = 0;
    #10;
    if (A_greater_than_B !== 1 || A_less_than_B !== 0 || A_equal_to_B !== 0) begin
      $display("FAIL: Test case 5 failed");
      $finish;
    end

    // Test case 6: A = 0, B = 15 (A < B)
    A = 0; B = 15;
    #10;
    if (A_greater_than_B !== 0 || A_less_than_B !== 1 || A_equal_to_B !== 0) begin
      $display("FAIL: Test case 6 failed");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule