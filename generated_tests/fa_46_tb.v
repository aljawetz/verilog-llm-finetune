`timescale 1ns/1ps

module tb_fa;
  reg a, b, cin;
  wire s, c;

  // Instantiate the module under test (uut)
  fa uut (
    .a(a),
    .b(b),
    .cin(cin),
    .s(s),
    .c(c)
  );

  initial begin
    // Test case 1: 0 + 0 + 0 = 0, carry = 0
    a = 0; b = 0; cin = 0;
    #10;
    if (s !== 0 || c !== 0) begin
      $display("FAIL: Test case 1 failed");
      $finish;
    end

    // Test case 2: 0 + 0 + 1 = 1, carry = 0
    a = 0; b = 0; cin = 1;
    #10;
    if (s !== 1 || c !== 0) begin
      $display("FAIL: Test case 2 failed");
      $finish;
    end

    // Test case 3: 0 + 1 + 0 = 1, carry = 0
    a = 0; b = 1; cin = 0;
    #10;
    if (s !== 1 || c !== 0) begin
      $display("FAIL: Test case 3 failed");
      $finish;
    end

    // Test case 4: 0 + 1 + 1 = 0, carry = 1
    a = 0; b = 1; cin = 1;
    #10;
    if (s !== 0 || c !== 1) begin
      $display("FAIL: Test case 4 failed");
      $finish;
    end

    // Test case 5: 1 + 0 + 0 = 1, carry = 0
    a = 1; b = 0; cin = 0;
    #10;
    if (s !== 1 || c !== 0) begin
      $display("FAIL: Test case 5 failed");
      $finish;
    end

    // Test case 6: 1 + 0 + 1 = 0, carry = 1
    a = 1; b = 0; cin = 1;
    #10;
    if (s !== 0 || c !== 1) begin
      $display("FAIL: Test case 6 failed");
      $finish;
    end

    // Test case 7: 1 + 1 + 0 = 0, carry = 1
    a = 1; b = 1; cin = 0;
    #10;
    if (s !== 0 || c !== 1) begin
      $display("FAIL: Test case 7 failed");
      $finish;
    end

    // Test case 8: 1 + 1 + 1 = 1, carry = 1
    a = 1; b = 1; cin = 1;
    #10;
    if (s !== 1 || c !== 1) begin
      $display("FAIL: Test case 8 failed");
      $finish;
    end

    $display("PASS");
    $finish;
  end
endmodule