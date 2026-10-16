`timescale 1ns/1ps

module tb_one_hot;

  parameter BIN_W = 5;
  parameter ONE_HOT_W = 32;

  reg [BIN_W-1:0] bin_i;
  wire [ONE_HOT_W-1:0] one_hot_o;

  // Instantiate the module under test (uut)
  one_hot uut (
    .bin_i(bin_i),
    .one_hot_o(one_hot_o)
  );

  initial begin
    // Test cases
    // Test case 0: bin_i = 0
    bin_i = 5'b00000; #10;
    if (one_hot_o !== 32'b00000000000000000000000000000001) begin
      $display("FAIL: Test case 0 failed");
      $finish;
    end

    // Test case 1: bin_i = 1
    bin_i = 5'b00001; #10;
    if (one_hot_o !== 32'b00000000000000000000000000000010) begin
      $display("FAIL: Test case 1 failed");
      $finish;
    end

    // Test case 2: bin_i = 2
    bin_i = 5'b00010; #10;
    if (one_hot_o !== 32'b00000000000000000000000000000100) begin
      $display("FAIL: Test case 2 failed");
      $finish;
    end

    // Test case 3: bin_i = 3
    bin_i = 5'b00011; #10;
    if (one_hot_o !== 32'b00000000000000000000000000001000) begin
      $display("FAIL: Test case 3 failed");
      $finish;
    end

    // Test case 4: bin_i = 4
    bin_i = 5'b00100; #10;
    if (one_hot_o !== 32'b00000000000000000000000000010000) begin
      $display("FAIL: Test case 4 failed");
      $finish;
    end

    // Test case 5: bin_i = 5
    bin_i = 5'b00101; #10;
    if (one_hot_o !== 32'b00000000000000000000000000100000) begin
      $display("FAIL: Test case 5 failed");
      $finish;
    end

    // Test case 6: bin_i = 6
    bin_i = 5'b00110; #10;
    if (one_hot_o !== 32'b00000000000000000000000001000000) begin
      $display("FAIL: Test case 6 failed");
      $finish;
    end

    // Test case 7: bin_i = 7
    bin_i = 5'b00111; #10;
    if (one_hot_o !== 32'b00000000000000000000000010000000) begin
      $display("FAIL: Test case 7 failed");
      $finish;
    end

    // Test case 8: bin_i = 8
    bin_i = 5'b01000; #10;
    if (one_hot_o !== 32'b00000000000000000000000100000000) begin
      $display("FAIL: Test case 8 failed");
      $finish;
    end

    // Test case 9: bin_i = 9
    bin_i = 5'b01001; #10;
    if (one_hot_o !== 32'b00000000000000000000001000000000) begin
      $display("FAIL: Test case 9 failed");
      $finish;
    end

    // Test case 10: bin_i = 10
    bin_i = 5'b01010; #10;
    if (one_hot_o !== 32'b00000000000000000000010000000000) begin
      $display("FAIL: Test case 10 failed");
      $finish;
    end

    // Test case 11: bin_i = 11
    bin_i = 5'b01011; #10;
    if (one_hot_o !== 32'b00000000000000000000100000000000) begin
      $display("FAIL: Test case 11 failed");
      $finish;
    end

    // Test case 12: bin_i = 12
    bin_i = 5'b01100; #10;
    if (one_hot_o !== 32'b00000000000000000001000000000000) begin
      $display("FAIL: Test case 12 failed");
      $finish;
    end

    // Test case 13: bin_i = 13
    bin_i = 5'b01101; #10;
    if (one_hot_o !== 32'b00000000000000000010000000000000) begin
      $display("FAIL: Test case 13 failed");
      $finish;
    end

    // Test case 14: bin_i = 14
    bin_i = 5'b01110; #10;
    if (one_hot_o !== 32'b00000000000000000100000000000000) begin
      $display("FAIL: Test case 14 failed");
      $finish;
    end

    // Test case 15: bin_i = 15
    bin_i = 5'b01111; #10;
    if (one_hot_o !== 32'b00000000000000001000000000000000) begin
      $display("FAIL: Test case 15 failed");
      $finish;
    end

    // Test case 16: bin_i = 16
    bin_i = 5'b10000; #10;
    if (one_hot_o !== 32'b00000000000000010000000000000000) begin
      $display("FAIL: Test case 16 failed");
      $finish;
    end

    // Test case 17: bin_i = 17
    bin_i = 5'b10001; #10;
    if (one_hot_o !== 32'b00000000000000100000000000000000) begin
      $display("FAIL: Test case 17 failed");
      $finish;
    end

    // Test case 18: bin_i = 18
    bin_i = 5'b10010; #10;
    if (one_hot_o !== 32'b00000000000001000000000000000000) begin
      $display("FAIL: Test case 18 failed");
      $finish;
    end

    // Test case 19: bin_i = 19
    bin_i = 5'b10011; #10;
    if (one_hot_o !== 32'b00000000000010000000000000000000) begin
      $display("FAIL: Test case 19 failed");
      $finish;
    end

    // Test case 20: bin_i = 20
    bin_i = 5'b10100; #10;
    if (one_hot_o !== 32'b00000000000100000000000000000000) begin
      $display("FAIL: Test case 20 failed");
      $finish;
    end

    // Test case 21: bin_i = 21
    bin_i = 5'b10101; #10;
    if (one_hot_o !== 32'b00000000001000000000000000000000) begin
      $display("FAIL: Test case 21 failed");
      $finish;
    end

    // Test case 22: bin_i = 22
    bin_i = 5'b10110; #10;
    if (one_hot_o !== 32'b00000000010000000000000000000000) begin
      $display("FAIL: Test case 22 failed");
      $finish;
    end

    // Test case 23: bin_i = 23
    bin_i = 5'b10111; #10;
    if (one_hot_o !== 32'b00000000100000000000000000000000) begin
      $display("FAIL: Test case 23 failed");
      $finish;
    end

    // Test case 24: bin_i = 24
    bin_i = 5'b11000; #10;
    if (one_hot_o !== 32'b00000001000000000000000000000000) begin
      $display("FAIL: Test case 24 failed");
      $finish;
    end

    // Test case 25: bin_i = 25
    bin_i = 5'b11001; #10;
    if (one_hot_o !== 32'b00000010000000000000000000000000) begin
      $display("FAIL: Test case 25 failed");
      $finish;
    end

    // Test case 26: bin_i = 26
    bin_i = 5'b11010; #10;
    if (one_hot_o !== 32'b00000100000000000000000000000000) begin
      $display("FAIL: Test case 26 failed");
      $finish;
    end

    // Test case 27: bin_i = 27
    bin_i = 5'b11011; #10;
    if (one_hot_o !== 32'b00001000000000000000000000000000) begin
      $display("FAIL: Test case 27 failed");
      $finish;
    end

    // Test case 28: bin_i = 28
    bin_i = 5'b11100; #10;
    if (one_hot_o !== 32'b00010000000000000000000000000000) begin
      $display("FAIL: Test case 28 failed");
      $finish;
    end

    // Test case 29: bin_i = 29
    bin_i = 5'b11101; #10;
    if (one_hot_o !== 32'b00100000000000000000000000000000) begin
      $display("FAIL: Test case 29 failed");
      $finish;
    end

    // Test case 30: bin_i = 30
    bin_i = 5'b11110; #10;
    if (one_hot_o !== 32'b01000000000000000000000000000000) begin
      $display("FAIL: Test case 30 failed");
      $finish;
    end

    // Test case 31: bin_i = 31
    bin_i = 5'b11111; #10;
    if (one_hot_o !== 32'b10000000000000000000000000000000) begin
      $display("FAIL: Test case 31 failed");
      $finish;
    end

    $display("PASS");
    $finish;
  end

endmodule