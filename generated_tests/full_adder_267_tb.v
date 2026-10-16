`timescale 1ns/1ps

module tb_full_adder;

  reg i_bit1;
  reg i_bit2;
  reg i_carry;
  wire o_sum;
  wire o_carry;

  // Instantiate the full_adder module
  full_adder uut (
    .i_bit1(i_bit1),
    .i_bit2(i_bit2),
    .i_carry(i_carry),
    .o_sum(o_sum),
    .o_carry(o_carry)
  );

  initial begin
    // Test case 1: 0 + 0 + 0 = 0, carry = 0
    i_bit1 = 0; i_bit2 = 0; i_carry = 0;
    #10;
    if (o_sum !== 0 || o_carry !== 0) $display("FAIL: Test case 1 failed");

    // Test case 2: 0 + 0 + 1 = 1, carry = 0
    i_bit1 = 0; i_bit2 = 0; i_carry = 1;
    #10;
    if (o_sum !== 1 || o_carry !== 0) $display("FAIL: Test case 2 failed");

    // Test case 3: 0 + 1 + 0 = 1, carry = 0
    i_bit1 = 0; i_bit2 = 1; i_carry = 0;
    #10;
    if (o_sum !== 1 || o_carry !== 0) $display("FAIL: Test case 3 failed");

    // Test case 4: 0 + 1 + 1 = 0, carry = 1
    i_bit1 = 0; i_bit2 = 1; i_carry = 1;
    #10;
    if (o_sum !== 0 || o_carry !== 1) $display("FAIL: Test case 4 failed");

    // Test case 5: 1 + 0 + 0 = 1, carry = 0
    i_bit1 = 1; i_bit2 = 0; i_carry = 0;
    #10;
    if (o_sum !== 1 || o_carry !== 0) $display("FAIL: Test case 5 failed");

    // Test case 6: 1 + 0 + 1 = 0, carry = 1
    i_bit1 = 1; i_bit2 = 0; i_carry = 1;
    #10;
    if (o_sum !== 0 || o_carry !== 1) $display("FAIL: Test case 6 failed");

    // Test case 7: 1 + 1 + 0 = 0, carry = 1
    i_bit1 = 1; i_bit2 = 1; i_carry = 0;
    #10;
    if (o_sum !== 0 || o_carry !== 1) $display("FAIL: Test case 7 failed");

    // Test case 8: 1 + 1 + 1 = 1, carry = 1
    i_bit1 = 1; i_bit2 = 1; i_carry = 1;
    #10;
    if (o_sum !== 1 || o_carry !== 1) $display("FAIL: Test case 8 failed");

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule