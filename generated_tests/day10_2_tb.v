`timescale 1ns/1ps

module tb_day10;

  parameter BIT_WIDTH = 3;
  parameter ONE_HOT_WIDTH = 8;

  reg [BIT_WIDTH - 1:0] bin_i;
  wire [ONE_HOT_WIDTH - 1:0] one_hot_o;

  // Instantiate the module under test (uut)
  day10 #(
    .BIT_WIDTH(BIT_WIDTH),
    .ONE_HOT_WIDTH(ONE_HOT_WIDTH)
  ) uut (
    .bin_i(bin_i),
    .one_hot_o(one_hot_o)
  );

  initial begin
    // Test cases
    // Test case 0: bin_i = 0
    bin_i = 3'b000; #10;
    if (one_hot_o !== 8'b00000001) begin
      $display("FAIL: Test case 0 failed, expected 00000001, got %b", one_hot_o);
      $finish;
    end

    // Test case 1: bin_i = 1
    bin_i = 3'b001; #10;
    if (one_hot_o !== 8'b00000010) begin
      $display("FAIL: Test case 1 failed, expected 00000010, got %b", one_hot_o);
      $finish;
    end

    // Test case 2: bin_i = 2
    bin_i = 3'b010; #10;
    if (one_hot_o !== 8'b00000100) begin
      $display("FAIL: Test case 2 failed, expected 00000100, got %b", one_hot_o);
      $finish;
    end

    // Test case 3: bin_i = 3
    bin_i = 3'b011; #10;
    if (one_hot_o !== 8'b00001000) begin
      $display("FAIL: Test case 3 failed, expected 00001000, got %b", one_hot_o);
      $finish;
    end

    // Test case 4: bin_i = 4 (out of range for 3-bit input)
    bin_i = 3'b100; #10;
    if (one_hot_o !== 8'b00010000) begin
      $display("FAIL: Test case 4 failed, expected 00010000, got %b", one_hot_o);
      $finish;
    end

    // Test case 5: bin_i = 5 (out of range for 3-bit input)
    bin_i = 3'b101; #10;
    if (one_hot_o !== 8'b00100000) begin
      $display("FAIL: Test case 5 failed, expected 00100000, got %b", one_hot_o);
      $finish;
    end

    // Test case 6: bin_i = 6 (out of range for 3-bit input)
    bin_i = 3'b110; #10;
    if (one_hot_o !== 8'b01000000) begin
      $display("FAIL: Test case 6 failed, expected 01000000, got %b", one_hot_o);
      $finish;
    end

    // Test case 7: bin_i = 7 (out of range for 3-bit input)
    bin_i = 3'b111; #10;
    if (one_hot_o !== 8'b10000000) begin
      $display("FAIL: Test case 7 failed, expected 10000000, got %b", one_hot_o);
      $finish;
    end

    $display("PASS");
    $finish;
  end

endmodule