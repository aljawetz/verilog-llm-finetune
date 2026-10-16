`timescale 1ns/1ps

module tb_fa;

  reg a, b, cin;
  wire sum, carry;

  // Instantiate the full adder
  fa uut (
    .a(a),
    .b(b),
    .cin(cin),
    .sum(sum),
    .carry(carry)
  );

  initial begin
    // Test cases
    // Test case 1: 0 + 0 + 0
    a = 0; b = 0; cin = 0; #10;
    if (sum !== 0 || carry !== 0) begin
      $display("FAIL: Test case 1 failed (0 + 0 + 0)");
      $finish;
    end

    // Test case 2: 0 + 0 + 1
    a = 0; b = 0; cin = 1; #10;
    if (sum !== 1 || carry !== 0) begin
      $display("FAIL: Test case 2 failed (0 + 0 + 1)");
      $finish;
    end

    // Test case 3: 0 + 1 + 0
    a = 0; b = 1; cin = 0; #10;
    if (sum !== 1 || carry !== 0) begin
      $display("FAIL: Test case 3 failed (0 + 1 + 0)");
      $finish;
    end

    // Test case 4: 0 + 1 + 1
    a = 0; b = 1; cin = 1; #10;
    if (sum !== 0 || carry !== 1) begin
      $display("FAIL: Test case 4 failed (0 + 1 + 1)");
      $finish;
    end

    // Test case 5: 1 + 0 + 0
    a = 1; b = 0; cin = 0; #10;
    if (sum !== 1 || carry !== 0) begin
      $display("FAIL: Test case 5 failed (1 + 0 + 0)");
      $finish;
    end

    // Test case 6: 1 + 0 + 1
    a = 1; b = 0; cin = 1; #10;
    if (sum !== 0 || carry !== 1) begin
      $display("FAIL: Test case 6 failed (1 + 0 + 1)");
      $finish;
    end

    // Test case 7: 1 + 1 + 0
    a = 1; b = 1; cin = 0; #10;
    if (sum !== 0 || carry !== 1) begin
      $display("FAIL: Test case 7 failed (1 + 1 + 0)");
      $finish;
    end

    // Test case 8: 1 + 1 + 1
    a = 1; b = 1; cin = 1; #10;
    if (sum !== 1 || carry !== 1) begin
      $display("FAIL: Test case 8 failed (1 + 1 + 1)");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule