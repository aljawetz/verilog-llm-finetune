`timescale 1ns/1ps

module tb_one_hot;

  parameter BIN_W = 4;
  parameter ONE_HOT_W = 16;

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
    bin_i = 4'b0000; #10;
    if (one_hot_o !== 16'b0000000000000001) begin
      $display("FAIL: Test case 0 failed, expected 0000000000000001, got %b", one_hot_o);
      $finish;
    end

    // Test case 1: bin_i = 1
    bin_i = 4'b0001; #10;
    if (one_hot_o !== 16'b0000000000000010) begin
      $display("FAIL: Test case 1 failed, expected 0000000000000010, got %b", one_hot_o);
      $finish;
    end

    // Test case 2: bin_i = 2
    bin_i = 4'b0010; #10;
    if (one_hot_o !== 16'b0000000000000100) begin
      $display("FAIL: Test case 2 failed, expected 0000000000000100, got %b", one_hot_o);
      $finish;
    end

    // Test case 3: bin_i = 3
    bin_i = 4'b0011; #10;
    if (one_hot_o !== 16'b0000000000001000) begin
      $display("FAIL: Test case 3 failed, expected 0000000000001000, got %b", one_hot_o);
      $finish;
    end

    // Test case 4: bin_i = 4
    bin_i = 4'b0100; #10;
    if (one_hot_o !== 16'b0000000000010000) begin
      $display("FAIL: Test case 4 failed, expected 0000000000010000, got %b", one_hot_o);
      $finish;
    end

    // Test case 5: bin_i = 5
    bin_i = 4'b0101; #10;
    if (one_hot_o !== 16'b0000000000100000) begin
      $display("FAIL: Test case 5 failed, expected 0000000000100000, got %b", one_hot_o);
      $finish;
    end

    // Test case 6: bin_i = 6
    bin_i = 4'b0110; #10;
    if (one_hot_o !== 16'b0000000001000000) begin
      $display("FAIL: Test case 6 failed, expected 0000000001000000, got %b", one_hot_o);
      $finish;
    end

    // Test case 7: bin_i = 7
    bin_i = 4'b0111; #10;
    if (one_hot_o !== 16'b0000000010000000) begin
      $display("FAIL: Test case 7 failed, expected 0000000010000000, got %b", one_hot_o);
      $finish;
    end

    // Test case 8: bin_i = 8
    bin_i = 4'b1000; #10;
    if (one_hot_o !== 16'b0000000100000000) begin
      $display("FAIL: Test case 8 failed, expected 0000000100000000, got %b", one_hot_o);
      $finish;
    end

    // Test case 9: bin_i = 9
    bin_i = 4'b1001; #10;
    if (one_hot_o !== 16'b0000001000000000) begin
      $display("FAIL: Test case 9 failed, expected 0000001000000000, got %b", one_hot_o);
      $finish;
    end

    // Test case 10: bin_i = 10
    bin_i = 4'b1010; #10;
    if (one_hot_o !== 16'b0000010000000000) begin
      $display("FAIL: Test case 10 failed, expected 0000010000000000, got %b", one_hot_o);
      $finish;
    end

    // Test case 11: bin_i = 11
    bin_i = 4'b1011; #10;
    if (one_hot_o !== 16'b0000100000000000) begin
      $display("FAIL: Test case 11 failed, expected 0000100000000000, got %b", one_hot_o);
      $finish;
    end

    // Test case 12: bin_i = 12
    bin_i = 4'b1100; #10;
    if (one_hot_o !== 16'b0001000000000000) begin
      $display("FAIL: Test case 12 failed, expected 0001000000000000, got %b", one_hot_o);
      $finish;
    end

    // Test case 13: bin_i = 13
    bin_i = 4'b1101; #10;
    if (one_hot_o !== 16'b0010000000000000) begin
      $display("FAIL: Test case 13 failed, expected 0010000000000000, got %b", one_hot_o);
      $finish;
    end

    // Test case 14: bin_i = 14
    bin_i = 4'b1110; #10;
    if (one_hot_o !== 16'b0100000000000000) begin
      $display("FAIL: Test case 14 failed, expected 0100000000000000, got %b", one_hot_o);
      $finish;
    end

    // Test case 15: bin_i = 15
    bin_i = 4'b1111; #10;
    if (one_hot_o !== 16'b1000000000000000) begin
      $display("FAIL: Test case 15 failed, expected 1000000000000000, got %b", one_hot_o);
      $finish;
    end

    $display("PASS");
    $finish;
  end

endmodule