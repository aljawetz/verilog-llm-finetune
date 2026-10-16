`timescale 1ns/1ps

module tb_Binary_to_onehot;

  reg [3:0] dat1;
  wire [15:0] result1;

  // Instantiate the module under test (uut)
  Binary_to_onehot uut (
    .dat1(dat1),
    .result1(result1)
  );

  initial begin
    // Test cases
    // Test case 0: dat1 = 0
    dat1 = 4'b0000; #10;
    if (result1 !== 16'b0000000000000001) begin
      $display("FAIL: Test case 0 failed, expected 0000000000000001, got %b", result1);
      $finish;
    end

    // Test case 1: dat1 = 1
    dat1 = 4'b0001; #10;
    if (result1 !== 16'b0000000000000010) begin
      $display("FAIL: Test case 1 failed, expected 0000000000000010, got %b", result1);
      $finish;
    end

    // Test case 2: dat1 = 2
    dat1 = 4'b0010; #10;
    if (result1 !== 16'b0000000000000100) begin
      $display("FAIL: Test case 2 failed, expected 0000000000000100, got %b", result1);
      $finish;
    end

    // Test case 3: dat1 = 3
    dat1 = 4'b0011; #10;
    if (result1 !== 16'b0000000000001000) begin
      $display("FAIL: Test case 3 failed, expected 0000000000001000, got %b", result1);
      $finish;
    end

    // Test case 4: dat1 = 4
    dat1 = 4'b0100; #10;
    if (result1 !== 16'b0000000000010000) begin
      $display("FAIL: Test case 4 failed, expected 0000000000010000, got %b", result1);
      $finish;
    end

    // Test case 5: dat1 = 5
    dat1 = 4'b0101; #10;
    if (result1 !== 16'b0000000000100000) begin
      $display("FAIL: Test case 5 failed, expected 0000000000100000, got %b", result1);
      $finish;
    end

    // Test case 6: dat1 = 6
    dat1 = 4'b0110; #10;
    if (result1 !== 16'b0000000001000000) begin
      $display("FAIL: Test case 6 failed, expected 0000000001000000, got %b", result1);
      $finish;
    end

    // Test case 7: dat1 = 7
    dat1 = 4'b0111; #10;
    if (result1 !== 16'b0000000010000000) begin
      $display("FAIL: Test case 7 failed, expected 0000000010000000, got %b", result1);
      $finish;
    end

    // Test case 8: dat1 = 8
    dat1 = 4'b1000; #10;
    if (result1 !== 16'b0000000100000000) begin
      $display("FAIL: Test case 8 failed, expected 0000000100000000, got %b", result1);
      $finish;
    end

    // Test case 9: dat1 = 9
    dat1 = 4'b1001; #10;
    if (result1 !== 16'b0000001000000000) begin
      $display("FAIL: Test case 9 failed, expected 0000001000000000, got %b", result1);
      $finish;
    end

    // Test case 10: dat1 = 10
    dat1 = 4'b1010; #10;
    if (result1 !== 16'b0000010000000000) begin
      $display("FAIL: Test case 10 failed, expected 0000010000000000, got %b", result1);
      $finish;
    end

    // Test case 11: dat1 = 11
    dat1 = 4'b1011; #10;
    if (result1 !== 16'b0000100000000000) begin
      $display("FAIL: Test case 11 failed, expected 0000100000000000, got %b", result1);
      $finish;
    end

    // Test case 12: dat1 = 12
    dat1 = 4'b1100; #10;
    if (result1 !== 16'b0001000000000000) begin
      $display("FAIL: Test case 12 failed, expected 0001000000000000, got %b", result1);
      $finish;
    end

    // Test case 13: dat1 = 13
    dat1 = 4'b1101; #10;
    if (result1 !== 16'b0010000000000000) begin
      $display("FAIL: Test case 13 failed, expected 0010000000000000, got %b", result1);
      $finish;
    end

    // Test case 14: dat1 = 14
    dat1 = 4'b1110; #10;
    if (result1 !== 16'b0100000000000000) begin
      $display("FAIL: Test case 14 failed, expected 0100000000000000, got %b", result1);
      $finish;
    end

    // Test case 15: dat1 = 15
    dat1 = 4'b1111; #10;
    if (result1 !== 16'b1000000000000000) begin
      $display("FAIL: Test case 15 failed, expected 1000000000000000, got %b", result1);
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule