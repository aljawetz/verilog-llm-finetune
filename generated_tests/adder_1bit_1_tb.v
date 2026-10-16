`timescale 1ns/1ps

module tb_adder_1bit;

  reg X;
  reg Y;
  reg Cin;
  wire S;
  wire Cout;

  // Instantiate the module under test (uut)
  adder_1bit uut (
    .X(X),
    .Y(Y),
    .Cin(Cin),
    .S(S),
    .Cout(Cout)
  );

  initial begin
    // Test case 1: 0 + 0 + 0 = 0, Cout = 0
    X = 0; Y = 0; Cin = 0;
    #10;
    if (S !== 0 || Cout !== 0) $display("FAIL: Test case 1 failed");

    // Test case 2: 0 + 0 + 1 = 1, Cout = 0
    X = 0; Y = 0; Cin = 1;
    #10;
    if (S !== 1 || Cout !== 0) $display("FAIL: Test case 2 failed");

    // Test case 3: 0 + 1 + 0 = 1, Cout = 0
    X = 0; Y = 1; Cin = 0;
    #10;
    if (S !== 1 || Cout !== 0) $display("FAIL: Test case 3 failed");

    // Test case 4: 0 + 1 + 1 = 0, Cout = 1
    X = 0; Y = 1; Cin = 1;
    #10;
    if (S !== 0 || Cout !== 1) $display("FAIL: Test case 4 failed");

    // Test case 5: 1 + 0 + 0 = 1, Cout = 0
    X = 1; Y = 0; Cin = 0;
    #10;
    if (S !== 1 || Cout !== 0) $display("FAIL: Test case 5 failed");

    // Test case 6: 1 + 0 + 1 = 0, Cout = 1
    X = 1; Y = 0; Cin = 1;
    #10;
    if (S !== 0 || Cout !== 1) $display("FAIL: Test case 6 failed");

    // Test case 7: 1 + 1 + 0 = 0, Cout = 1
    X = 1; Y = 1; Cin = 0;
    #10;
    if (S !== 0 || Cout !== 1) $display("FAIL: Test case 7 failed");

    // Test case 8: 1 + 1 + 1 = 1, Cout = 1
    X = 1; Y = 1; Cin = 1;
    #10;
    if (S !== 1 || Cout !== 1) $display("FAIL: Test case 8 failed");

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule