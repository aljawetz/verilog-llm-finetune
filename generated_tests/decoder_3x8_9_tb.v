`timescale 1ns/1ps

module tb_decoder_3x8;
  reg [2:0] a;
  reg en;
  wire [7:0] y;

  // Instantiate the module under test
  decoder_3x8 uut (
    .a(a),
    .en(en),
    .y(y)
  );

  initial begin
    // Test case 1: Enable is low, all outputs should be low
    en = 0; a = 3'b000; #10;
    if (y !== 8'b00000000) begin
      $display("FAIL: Test case 1 failed, expected 00000000, got %b", y);
      $finish;
    end

    // Test case 2: Enable is high, input is 000, output should be 00000001
    en = 1; a = 3'b000; #10;
    if (y !== 8'b00000001) begin
      $display("FAIL: Test case 2 failed, expected 00000001, got %b", y);
      $finish;
    end

    // Test case 3: Enable is high, input is 001, output should be 00000010
    a = 3'b001; #10;
    if (y !== 8'b00000010) begin
      $display("FAIL: Test case 3 failed, expected 00000010, got %b", y);
      $finish;
    end

    // Test case 4: Enable is high, input is 010, output should be 00000100
    a = 3'b010; #10;
    if (y !== 8'b00000100) begin
      $display("FAIL: Test case 4 failed, expected 00000100, got %b", y);
      $finish;
    end

    // Test case 5: Enable is high, input is 011, output should be 00001000
    a = 3'b011; #10;
    if (y !== 8'b00001000) begin
      $display("FAIL: Test case 5 failed, expected 00001000, got %b", y);
      $finish;
    end

    // Test case 6: Enable is high, input is 100, output should be 00010000
    a = 3'b100; #10;
    if (y !== 8'b00010000) begin
      $display("FAIL: Test case 6 failed, expected 00010000, got %b", y);
      $finish;
    end

    // Test case 7: Enable is high, input is 101, output should be 00100000
    a = 3'b101; #10;
    if (y !== 8'b00100000) begin
      $display("FAIL: Test case 7 failed, expected 00100000, got %b", y);
      $finish;
    end

    // Test case 8: Enable is high, input is 110, output should be 01000000
    a = 3'b110; #10;
    if (y !== 8'b01000000) begin
      $display("FAIL: Test case 8 failed, expected 01000000, got %b", y);
      $finish;
    end

    // Test case 9: Enable is high, input is 111, output should be 10000000
    a = 3'b111; #10;
    if (y !== 8'b10000000) begin
      $display("FAIL: Test case 9 failed, expected 10000000, got %b", y);
      $finish;
    end

    $display("PASS");
    $finish;
  end
endmodule