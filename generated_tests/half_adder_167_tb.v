`timescale 1ns/1ps

module tb_half_adder;

  // Inputs
  reg i_bit1;
  reg i_bit2;

  // Outputs
  wire o_sum;
  wire o_carry;

  // Instantiate the Unit Under Test (UUT)
  half_adder uut (
    .i_bit1(i_bit1),
    .i_bit2(i_bit2),
    .o_sum(o_sum),
    .o_carry(o_carry)
  );

  initial begin
    // Test case 1: 0 + 0
    i_bit1 = 0; i_bit2 = 0;
    #10;
    if (o_sum !== 0 || o_carry !== 0) begin
      $display("FAIL: Test case 1 failed (0 + 0)");
      $finish;
    end

    // Test case 2: 0 + 1
    i_bit1 = 0; i_bit2 = 1;
    #10;
    if (o_sum !== 1 || o_carry !== 0) begin
      $display("FAIL: Test case 2 failed (0 + 1)");
      $finish;
    end

    // Test case 3: 1 + 0
    i_bit1 = 1; i_bit2 = 0;
    #10;
    if (o_sum !== 1 || o_carry !== 0) begin
      $display("FAIL: Test case 3 failed (1 + 0)");
      $finish;
    end

    // Test case 4: 1 + 1
    i_bit1 = 1; i_bit2 = 1;
    #10;
    if (o_sum !== 0 || o_carry !== 1) begin
      $display("FAIL: Test case 4 failed (1 + 1)");
      $finish;
    end

    $display("PASS");
    $finish;
  end

endmodule