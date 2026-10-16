`timescale 1ns/1ps

module tb_full_adder;

  reg A, B, Cin;
  wire S, Cout;

  // Instantiate the full_adder module
  full_adder uut (
    .A(A),
    .B(B),
    .Cin(Cin),
    .S(S),
    .Cout(Cout)
  );

  initial begin
    // Test case 1: A=0, B=0, Cin=0
    A = 0; B = 0; Cin = 0;
    #10;
    if (S !== 0 || Cout !== 0) begin
      $display("FAIL: Test case 1 failed");
      $finish;
    end

    // Test case 2: A=0, B=0, Cin=1
    A = 0; B = 0; Cin = 1;
    #10;
    if (S !== 1 || Cout !== 0) begin
      $display("FAIL: Test case 2 failed");
      $finish;
    end

    // Test case 3: A=0, B=1, Cin=0
    A = 0; B = 1; Cin = 0;
    #10;
    if (S !== 1 || Cout !== 0) begin
      $display("FAIL: Test case 3 failed");
      $finish;
    end

    // Test case 4: A=0, B=1, Cin=1
    A = 0; B = 1; Cin = 1;
    #10;
    if (S !== 0 || Cout !== 1) begin
      $display("FAIL: Test case 4 failed");
      $finish;
    end

    // Test case 5: A=1, B=0, Cin=0
    A = 1; B = 0; Cin = 0;
    #10;
    if (S !== 1 || Cout !== 0) begin
      $display("FAIL: Test case 5 failed");
      $finish;
    end

    // Test case 6: A=1, B=0, Cin=1
    A = 1; B = 0; Cin = 1;
    #10;
    if (S !== 0 || Cout !== 1) begin
      $display("FAIL: Test case 6 failed");
      $finish;
    end

    // Test case 7: A=1, B=1, Cin=0
    A = 1; B = 1; Cin = 0;
    #10;
    if (S !== 0 || Cout !== 1) begin
      $display("FAIL: Test case 7 failed");
      $finish;
    end

    // Test case 8: A=1, B=1, Cin=1
    A = 1; B = 1; Cin = 1;
    #10;
    if (S !== 1 || Cout !== 1) begin
      $display("FAIL: Test case 8 failed");
      $finish;
    end

    $display("PASS");
    $finish;
  end

endmodule