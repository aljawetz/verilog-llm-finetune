`timescale 1ns/1ps

module tb_check_palindrome;

  reg [7:0] num;
  wire p_out;

  // Instantiate the module under test
  check_palindrome uut (
    .num(num),
    .p_out(p_out)
  );

  initial begin
    // Test cases
    // Test case 1: 8'b00000000 (palindrome)
    num = 8'b00000000; #10;
    if (p_out !== 1) begin
      $display("FAIL: Test case 1 failed for input %b", num);
      $finish;
    end

    // Test case 2: 8'b11111111 (palindrome)
    num = 8'b11111111; #10;
    if (p_out !== 1) begin
      $display("FAIL: Test case 2 failed for input %b", num);
      $finish;
    end

    // Test case 3: 8'b10101010 (not a palindrome)
    num = 8'b10101010; #10;
    if (p_out !== 0) begin
      $display("FAIL: Test case 3 failed for input %b", num);
      $finish;
    end

    // Test case 4: 8'b11001100 (not a palindrome)
    num = 8'b11001100; #10;
    if (p_out !== 0) begin
      $display("FAIL: Test case 4 failed for input %b", num);
      $finish;
    end

    // Test case 5: 8'b10011001 (palindrome)
    num = 8'b10011001; #10;
    if (p_out !== 1) begin
      $display("FAIL: Test case 5 failed for input %b", num);
      $finish;
    end

    // Test case 6: 8'b01100110 (palindrome)
    num = 8'b01100110; #10;
    if (p_out !== 1) begin
      $display("FAIL: Test case 6 failed for input %b", num);
      $finish;
    end

    // Test case 7: 8'b00001111 (not a palindrome)
    num = 8'b00001111; #10;
    if (p_out !== 0) begin
      $display("FAIL: Test case 7 failed for input %b", num);
      $finish;
    end

    // Test case 8: 8'b11110000 (not a palindrome)
    num = 8'b11110000; #10;
    if (p_out !== 0) begin
      $display("FAIL: Test case 8 failed for input %b", num);
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule