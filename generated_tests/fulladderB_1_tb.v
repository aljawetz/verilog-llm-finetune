`timescale 1ns/1ps

module tb_fulladderB;

  // Inputs
  reg A;
  reg B;
  reg Cin;

  // Outputs
  wire sum;
  wire carry;

  // Instantiate the Unit Under Test (UUT)
  fulladderB uut (
    .sum(sum),
    .carry(carry),
    .A(A),
    .B(B),
    .Cin(Cin)
  );

  initial begin
    // Test Case 1: A=0, B=0, Cin=0
    A = 0; B = 0; Cin = 0;
    #10;
    if (sum !== 0 || carry !== 0) begin
      $display("FAIL: Test Case 1 failed");
      $finish;
    end

    // Test Case 2: A=0, B=0, Cin=1
    A = 0; B = 0; Cin = 1;
    #10;
    if (sum !== 1 || carry !== 0) begin
      $display("FAIL: Test Case 2 failed");
      $finish;
    end

    // Test Case 3: A=0, B=1, Cin=0
    A = 0; B = 1; Cin = 0;
    #10;
    if (sum !== 1 || carry !== 0) begin
      $display("FAIL: Test Case 3 failed");
      $finish;
    end

    // Test Case 4: A=0, B=1, Cin=1
    A = 0; B = 1; Cin = 1;
    #10;
    if (sum !== 0 || carry !== 1) begin
      $display("FAIL: Test Case 4 failed");
      $finish;
    end

    // Test Case 5: A=1, B=0, Cin=0
    A = 1; B = 0; Cin = 0;
    #10;
    if (sum !== 1 || carry !== 0) begin
      $display("FAIL: Test Case 5 failed");
      $finish;
    end

    // Test Case 6: A=1, B=0, Cin=1
    A = 1; B = 0; Cin = 1;
    #10;
    if (sum !== 0 || carry !== 1) begin
      $display("FAIL: Test Case 6 failed");
      $finish;
    end

    // Test Case 7: A=1, B=1, Cin=0
    A = 1; B = 1; Cin = 0;
    #10;
    if (sum !== 0 || carry !== 1) begin
      $display("FAIL: Test Case 7 failed");
      $finish;
    end

    // Test Case 8: A=1, B=1, Cin=1
    A = 1; B = 1; Cin = 1;
    #10;
    if (sum !== 1 || carry !== 1) begin
      $display("FAIL: Test Case 8 failed");
      $finish;
    end

    $display("PASS");
    $finish;
  end

endmodule