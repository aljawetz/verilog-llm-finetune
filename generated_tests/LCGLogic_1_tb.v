`timescale 1ns/1ps

module tb_LCGLogic;

  reg [3:0] P;
  reg [3:0] G;
  reg cin;
  wire [4:1] C;

  // Instantiate the module under test
  LCGLogic uut (
    .P(P),
    .G(G),
    .cin(cin),
    .C(C)
  );

  initial begin
    // Test case 1
    P = 4'b0000; G = 4'b0000; cin = 0; #10;
    if (C !== 4'b0000) $display("FAIL: Test case 1 failed, expected C = 0000, got C = %b", C);

    // Test case 2
    P = 4'b0001; G = 4'b0000; cin = 0; #10;
    if (C !== 4'b0000) $display("FAIL: Test case 2 failed, expected C = 0000, got C = %b", C);

    // Test case 3
    P = 4'b0001; G = 4'b0001; cin = 0; #10;
    if (C !== 4'b0001) $display("FAIL: Test case 3 failed, expected C = 0001, got C = %b", C);

    // Test case 4
    P = 4'b0011; G = 4'b0001; cin = 0; #10;
    if (C !== 4'b0001) $display("FAIL: Test case 4 failed, expected C = 0001, got C = %b", C);

    // Test case 5
    P = 4'b1111; G = 4'b1111; cin = 1; #10;
    if (C !== 4'b1111) $display("FAIL: Test case 5 failed, expected C = 1111, got C = %b", C);

    // Test case 6
    P = 4'b1010; G = 4'b1100; cin = 1; #10;
    if (C !== 4'b1111) $display("FAIL: Test case 6 failed, expected C = 1111, got C = %b", C);

    // Test case 7
    P = 4'b1100; G = 4'b1010; cin = 0; #10;
    if (C !== 4'b1010) $display("FAIL: Test case 7 failed, expected C = 1010, got C = %b", C);

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule