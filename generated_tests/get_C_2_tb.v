`timescale 1ns/1ps

module tb_get_C;

  // Inputs
  reg cin;
  reg P;
  reg G;

  // Outputs
  wire cout;

  // Instantiate the Unit Under Test (UUT)
  get_C uut (
    .cout(cout),
    .cin(cin),
    .P(P),
    .G(G)
  );

  initial begin
    // Test case 1: cin = 0, P = 0, G = 0
    cin = 0; P = 0; G = 0;
    #10;
    if (cout !== 0) $display("FAIL: Test case 1 failed, expected cout = 0, got cout = %b", cout);

    // Test case 2: cin = 0, P = 0, G = 1
    cin = 0; P = 0; G = 1;
    #10;
    if (cout !== 1) $display("FAIL: Test case 2 failed, expected cout = 1, got cout = %b", cout);

    // Test case 3: cin = 0, P = 1, G = 0
    cin = 0; P = 1; G = 0;
    #10;
    if (cout !== 0) $display("FAIL: Test case 3 failed, expected cout = 0, got cout = %b", cout);

    // Test case 4: cin = 0, P = 1, G = 1
    cin = 0; P = 1; G = 1;
    #10;
    if (cout !== 1) $display("FAIL: Test case 4 failed, expected cout = 1, got cout = %b", cout);

    // Test case 5: cin = 1, P = 0, G = 0
    cin = 1; P = 0; G = 0;
    #10;
    if (cout !== 0) $display("FAIL: Test case 5 failed, expected cout = 0, got cout = %b", cout);

    // Test case 6: cin = 1, P = 0, G = 1
    cin = 1; P = 0; G = 1;
    #10;
    if (cout !== 1) $display("FAIL: Test case 6 failed, expected cout = 1, got cout = %b", cout);

    // Test case 7: cin = 1, P = 1, G = 0
    cin = 1; P = 1; G = 0;
    #10;
    if (cout !== 1) $display("FAIL: Test case 7 failed, expected cout = 1, got cout = %b", cout);

    // Test case 8: cin = 1, P = 1, G = 1
    cin = 1; P = 1; G = 1;
    #10;
    if (cout !== 1) $display("FAIL: Test case 8 failed, expected cout = 1, got cout = %b", cout);

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule