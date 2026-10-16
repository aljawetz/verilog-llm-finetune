`timescale 1ns/1ps

module tb_full_adder;
  reg A, B, cin;
  wire Sum, Carry;

  // Instantiate the full adder
  full_adder uut (
    .A(A),
    .B(B),
    .cin(cin),
    .Sum(Sum),
    .Carry(Carry)
  );

  initial begin
    // Test case 1: 0 + 0 + 0 = 0, Carry = 0
    A = 0; B = 0; cin = 0;
    #10;
    if (Sum !== 0 || Carry !== 0) $display("FAIL: Test case 1 failed");

    // Test case 2: 0 + 0 + 1 = 1, Carry = 0
    A = 0; B = 0; cin = 1;
    #10;
    if (Sum !== 1 || Carry !== 0) $display("FAIL: Test case 2 failed");

    // Test case 3: 0 + 1 + 0 = 1, Carry = 0
    A = 0; B = 1; cin = 0;
    #10;
    if (Sum !== 1 || Carry !== 0) $display("FAIL: Test case 3 failed");

    // Test case 4: 0 + 1 + 1 = 0, Carry = 1
    A = 0; B = 1; cin = 1;
    #10;
    if (Sum !== 0 || Carry !== 1) $display("FAIL: Test case 4 failed");

    // Test case 5: 1 + 0 + 0 = 1, Carry = 0
    A = 1; B = 0; cin = 0;
    #10;
    if (Sum !== 1 || Carry !== 0) $display("FAIL: Test case 5 failed");

    // Test case 6: 1 + 0 + 1 = 0, Carry = 1
    A = 1; B = 0; cin = 1;
    #10;
    if (Sum !== 0 || Carry !== 1) $display("FAIL: Test case 6 failed");

    // Test case 7: 1 + 1 + 0 = 0, Carry = 1
    A = 1; B = 1; cin = 0;
    #10;
    if (Sum !== 0 || Carry !== 1) $display("FAIL: Test case 7 failed");

    // Test case 8: 1 + 1 + 1 = 1, Carry = 1
    A = 1; B = 1; cin = 1;
    #10;
    if (Sum !== 1 || Carry !== 1) $display("FAIL: Test case 8 failed");

    $display("PASS");
    $finish;
  end
endmodule