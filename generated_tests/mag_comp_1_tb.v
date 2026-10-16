`timescale 1ns/1ps

module tb_mag_comp;

  // Inputs
  reg [3:0] A;
  reg [3:0] B;

  // Outputs
  wire EQ;
  wire GT;
  wire LT;

  // Instantiate the module under test (uut)
  mag_comp uut (
    .A(A),
    .B(B),
    .EQ(EQ),
    .GT(GT),
    .LT(LT)
  );

  initial begin
    // Test case 1: A = B
    A = 4'b0000; B = 4'b0000; #10;
    if (EQ !== 1 || GT !== 0 || LT !== 0) begin
      $display("FAIL: Test case 1 failed (A = B)");
      $finish;
    end

    // Test case 2: A > B
    A = 4'b1001; B = 4'b0110; #10;
    if (EQ !== 0 || GT !== 1 || LT !== 0) begin
      $display("FAIL: Test case 2 failed (A > B)");
      $finish;
    end

    // Test case 3: A < B
    A = 4'b0010; B = 4'b0100; #10;
    if (EQ !== 0 || GT !== 0 || LT !== 1) begin
      $display("FAIL: Test case 3 failed (A < B)");
      $finish;
    end

    // Test case 4: A = B (different values)
    A = 4'b1111; B = 4'b1111; #10;
    if (EQ !== 1 || GT !== 0 || LT !== 0) begin
      $display("FAIL: Test case 4 failed (A = B)");
      $finish;
    end

    // Test case 5: A > B (different values)
    A = 4'b0111; B = 4'b0011; #10;
    if (EQ !== 0 || GT !== 1 || LT !== 0) begin
      $display("FAIL: Test case 5 failed (A > B)");
      $finish;
    end

    // Test case 6: A < B (different values)
    A = 4'b0001; B = 4'b0010; #10;
    if (EQ !== 0 || GT !== 0 || LT !== 1) begin
      $display("FAIL: Test case 6 failed (A < B)");
      $finish;
    end

    $display("PASS");
    $finish;
  end

endmodule