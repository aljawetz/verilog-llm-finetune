`timescale 1ns/1ps

module tb_bcd_addition;

  reg [3:0] a;
  reg [3:0] b;
  reg c;
  wire [3:0] sum;
  wire carry;

  // Instantiate the module under test (uut)
  bcd_addition uut (
    .a(a),
    .b(b),
    .c(c),
    .sum(sum),
    .carry(carry)
  );

  initial begin
    // Test case 1: 4 + 5 + 0 = 9, carry = 0
    a = 4'b0100; // 4
    b = 4'b0101; // 5
    c = 1'b0;   // 0
    #10;
    if (sum !== 4'b1001 || carry !== 1'b0) begin
      $display("FAIL: Test case 1 failed");
      $finish;
    end

    // Test case 2: 7 + 3 + 0 = 10, carry = 1
    a = 4'b0111; // 7
    b = 4'b0011; // 3
    c = 1'b0;   // 0
    #10;
    if (sum !== 4'b0000 || carry !== 1'b1) begin
      $display("FAIL: Test case 2 failed");
      $finish;
    end

    // Test case 3: 9 + 1 + 0 = 10, carry = 1
    a = 4'b1001; // 9
    b = 4'b0001; // 1
    c = 1'b0;   // 0
    #10;
    if (sum !== 4'b0000 || carry !== 1'b1) begin
      $display("FAIL: Test case 3 failed");
      $finish;
    end

    // Test case 4: 5 + 4 + 1 = 10, carry = 1
    a = 4'b0101; // 5
    b = 4'b0100; // 4
    c = 1'b1;   // 1
    #10;
    if (sum !== 4'b0000 || carry !== 1'b1) begin
      $display("FAIL: Test case 4 failed");
      $finish;
    end

    // Test case 5: 2 + 2 + 1 = 5, carry = 0
    a = 4'b0010; // 2
    b = 4'b0010; // 2
    c = 1'b1;   // 1
    #10;
    if (sum !== 4'b0101 || carry !== 1'b0) begin
      $display("FAIL: Test case 5 failed");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule