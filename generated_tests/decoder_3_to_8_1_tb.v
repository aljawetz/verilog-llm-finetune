`timescale 1ns/1ps

module tb_decoder_3_to_8;

  reg [2:0] in;
  reg en;
  wire [7:0] out;

  // Instantiate the module under test (uut)
  decoder_3_to_8 uut (
    .in(in),
    .en(en),
    .out(out)
  );

  initial begin
    // Test case 1: Enable decoder and input 000
    en = 1;
    in = 3'b000;
    #10;
    if (out !== 8'b00000001) begin
      $display("FAIL: Test case 1 failed, expected 00000001, got %b", out);
      $finish;
    end

    // Test case 2: Enable decoder and input 001
    in = 3'b001;
    #10;
    if (out !== 8'b00000010) begin
      $display("FAIL: Test case 2 failed, expected 00000010, got %b", out);
      $finish;
    end

    // Test case 3: Enable decoder and input 010
    in = 3'b010;
    #10;
    if (out !== 8'b00000100) begin
      $display("FAIL: Test case 3 failed, expected 00000100, got %b", out);
      $finish;
    end

    // Test case 4: Enable decoder and input 011
    in = 3'b011;
    #10;
    if (out !== 8'b00001000) begin
      $display("FAIL: Test case 4 failed, expected 00001000, got %b", out);
      $finish;
    end

    // Test case 5: Enable decoder and input 100
    in = 3'b100;
    #10;
    if (out !== 8'b00010000) begin
      $display("FAIL: Test case 5 failed, expected 00010000, got %b", out);
      $finish;
    end

    // Test case 6: Enable decoder and input 101
    in = 3'b101;
    #10;
    if (out !== 8'b00100000) begin
      $display("FAIL: Test case 6 failed, expected 00100000, got %b", out);
      $finish;
    end

    // Test case 7: Enable decoder and input 110
    in = 3'b110;
    #10;
    if (out !== 8'b01000000) begin
      $display("FAIL: Test case 7 failed, expected 01000000, got %b", out);
      $finish;
    end

    // Test case 8: Enable decoder and input 111
    in = 3'b111;
    #10;
    if (out !== 8'b10000000) begin
      $display("FAIL: Test case 8 failed, expected 10000000, got %b", out);
      $finish;
    end

    // Test case 9: Disable decoder
    en = 0;
    in = 3'b101; // Input should not matter when disabled
    #10;
    if (out !== 8'b00000000) begin
      $display("FAIL: Test case 9 failed, expected 00000000, got %b", out);
      $finish;
    end

    // Test case 10: Check default case when enabled
    en = 1;
    in = 3'bxxx; // Invalid input
    #10;
    if (out !== 8'b00000000) begin
      $display("FAIL: Test case 10 failed, expected 00000000, got %b", out);
      $finish;
    end

    $display("PASS");
    $finish;
  end

endmodule