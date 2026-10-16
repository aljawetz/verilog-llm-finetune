`timescale 1ns/1ps

module tb_fulladder;

  // Inputs
  reg X;
  reg Y;
  reg Ci;

  // Outputs
  wire S;
  wire Co;

  // Instantiate the Unit Under Test (UUT)
  fulladder uut (
    .X(X),
    .Y(Y),
    .Ci(Ci),
    .S(S),
    .Co(Co)
  );

  initial begin
    // Test case 1: 0 + 0 + 0 = 0, Co = 0
    X = 0; Y = 0; Ci = 0;
    #10;
    if (S !== 0 || Co !== 0) $display("FAIL: Test case 1 failed");

    // Test case 2: 0 + 0 + 1 = 1, Co = 0
    X = 0; Y = 0; Ci = 1;
    #10;
    if (S !== 1 || Co !== 0) $display("FAIL: Test case 2 failed");

    // Test case 3: 0 + 1 + 0 = 1, Co = 0
    X = 0; Y = 1; Ci = 0;
    #10;
    if (S !== 1 || Co !== 0) $display("FAIL: Test case 3 failed");

    // Test case 4: 0 + 1 + 1 = 0, Co = 1
    X = 0; Y = 1; Ci = 1;
    #10;
    if (S !== 0 || Co !== 1) $display("FAIL: Test case 4 failed");

    // Test case 5: 1 + 0 + 0 = 1, Co = 0
    X = 1; Y = 0; Ci = 0;
    #10;
    if (S !== 1 || Co !== 0) $display("FAIL: Test case 5 failed");

    // Test case 6: 1 + 0 + 1 = 0, Co = 1
    X = 1; Y = 0; Ci = 1;
    #10;
    if (S !== 0 || Co !== 1) $display("FAIL: Test case 6 failed");

    // Test case 7: 1 + 1 + 0 = 0, Co = 1
    X = 1; Y = 1; Ci = 0;
    #10;
    if (S !== 0 || Co !== 1) $display("FAIL: Test case 7 failed");

    // Test case 8: 1 + 1 + 1 = 1, Co = 1
    X = 1; Y = 1; Ci = 1;
    #10;
    if (S !== 1 || Co !== 1) $display("FAIL: Test case 8 failed");

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule