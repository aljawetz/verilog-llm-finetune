`timescale 1ns/1ps

module tb_excess_three_codes;

  reg [3:0] x;
  wire [3:0] y;

  // Instantiate the module under test (uut)
  excess_three_codes uut (
    .x(x),
    .y(y)
  );

  initial begin
    // Test cases
    // Test case 1: x = 0 (0 + 3 = 3)
    x = 4'b0000; #10;
    if (y !== 4'b0011) begin
      $display("FAIL: Test case 1 failed, expected 0011, got %b", y);
      $finish;
    end

    // Test case 2: x = 1 (1 + 3 = 4)
    x = 4'b0001; #10;
    if (y !== 4'b0100) begin
      $display("FAIL: Test case 2 failed, expected 0100, got %b", y);
      $finish;
    end

    // Test case 3: x = 2 (2 + 3 = 5)
    x = 4'b0010; #10;
    if (y !== 4'b0101) begin
      $display("FAIL: Test case 3 failed, expected 0101, got %b", y);
      $finish;
    end

    // Test case 4: x = 3 (3 + 3 = 6)
    x = 4'b0011; #10;
    if (y !== 4'b0110) begin
      $display("FAIL: Test case 4 failed, expected 0110, got %b", y);
      $finish;
    end

    // Test case 5: x = 4 (4 + 3 = 7)
    x = 4'b0100; #10;
    if (y !== 4'b0111) begin
      $display("FAIL: Test case 5 failed, expected 0111, got %b", y);
      $finish;
    end

    // Test case 6: x = 5 (5 + 3 = 8)
    x = 4'b0101; #10;
    if (y !== 4'b1000) begin
      $display("FAIL: Test case 6 failed, expected 1000, got %b", y);
      $finish;
    end

    // Test case 7: x = 6 (6 + 3 = 9)
    x = 4'b0110; #10;
    if (y !== 4'b1001) begin
      $display("FAIL: Test case 7 failed, expected 1001, got %b", y);
      $finish;
    end

    // Test case 8: x = 7 (7 + 3 = 10)
    x = 4'b0111; #10;
    if (y !== 4'b1010) begin
      $display("FAIL: Test case 8 failed, expected 1010, got %b", y);
      $finish;
    end

    // Test case 9: x = 8 (8 + 3 = 11)
    x = 4'b1000; #10;
    if (y !== 4'b1011) begin
      $display("FAIL: Test case 9 failed, expected 1011, got %b", y);
      $finish;
    end

    // Test case 10: x = 9 (9 + 3 = 12)
    x = 4'b1001; #10;
    if (y !== 4'b1100) begin
      $display("FAIL: Test case 10 failed, expected 1100, got %b", y);
      $finish;
    end

    // Test case 11: x = 10 (10 + 3 = 13)
    x = 4'b1010; #10;
    if (y !== 4'b1101) begin
      $display("FAIL: Test case 11 failed, expected 1101, got %b", y);
      $finish;
    end

    // Test case 12: x = 11 (11 + 3 = 14)
    x = 4'b1011; #10;
    if (y !== 4'b1110) begin
      $display("FAIL: Test case 12 failed, expected 1110, got %b", y);
      $finish;
    end

    // Test case 13: x = 12 (12 + 3 = 15)
    x = 4'b1100; #10;
    if (y !== 4'b1111) begin
      $display("FAIL: Test case 13 failed, expected 1111, got %b", y);
      $finish;
    end

    // Test case 14: x = 13 (13 + 3 = 16, overflow)
    x = 4'b1101; #10;
    if (y !== 4'b0000) begin
      $display("FAIL: Test case 14 failed, expected 0000, got %b", y);
      $finish;
    end

    // Test case 15: x = 14 (14 + 3 = 17, overflow)
    x = 4'b1110; #10;
    if (y !== 4'b0001) begin
      $display("FAIL: Test case 15 failed, expected 0001, got %b", y);
      $finish;
    end

    // Test case 16: x = 15 (15 + 3 = 18, overflow)
    x = 4'b1111; #10;
    if (y !== 4'b0010) begin
      $display("FAIL: Test case 16 failed, expected 0010, got %b", y);
      $finish;
    end

    $display("PASS");
    $finish;
  end

endmodule