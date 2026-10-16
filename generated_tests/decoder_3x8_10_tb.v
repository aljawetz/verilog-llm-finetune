`timescale 1ns/1ps

module tb_decoder_3x8;

  reg en;
  reg [4:0] i1;
  wire [7:0] y;

  // Instantiate the module under test
  decoder_3x8 uut (
    .en(en),
    .i1(i1),
    .y(y)
  );

  initial begin
    // Test case 1: Enable decoder and input 0
    en = 1;
    i1 = 5'b00000; // 3'b000
    #10;
    if (y !== 8'b00000001) begin
      $display("FAIL: Test case 1 failed, expected 00000001, got %b", y);
      $finish;
    end

    // Test case 2: Enable decoder and input 1
    i1 = 5'b00001; // 3'b001
    #10;
    if (y !== 8'b00000010) begin
      $display("FAIL: Test case 2 failed, expected 00000010, got %b", y);
      $finish;
    end

    // Test case 3: Enable decoder and input 2
    i1 = 5'b00010; // 3'b010
    #10;
    if (y !== 8'b00000100) begin
      $display("FAIL: Test case 3 failed, expected 00000100, got %b", y);
      $finish;
    end

    // Test case 4: Enable decoder and input 3
    i1 = 5'b00011; // 3'b011
    #10;
    if (y !== 8'b00001000) begin
      $display("FAIL: Test case 4 failed, expected 00001000, got %b", y);
      $finish;
    end

    // Test case 5: Enable decoder and input 4
    i1 = 5'b00100; // 3'b100
    #10;
    if (y !== 8'b00010000) begin
      $display("FAIL: Test case 5 failed, expected 00010000, got %b", y);
      $finish;
    end

    // Test case 6: Enable decoder and input 5
    i1 = 5'b00101; // 3'b101
    #10;
    if (y !== 8'b00100000) begin
      $display("FAIL: Test case 6 failed, expected 00100000, got %b", y);
      $finish;
    end

    // Test case 7: Enable decoder and input 6
    i1 = 5'b00110; // 3'b110
    #10;
    if (y !== 8'b01000000) begin
      $display("FAIL: Test case 7 failed, expected 01000000, got %b", y);
      $finish;
    end

    // Test case 8: Enable decoder and input 7
    i1 = 5'b00111; // 3'b111
    #10;
    if (y !== 8'b10000000) begin
      $display("FAIL: Test case 8 failed, expected 10000000, got %b", y);
      $finish;
    end

    // Test case 9: Disable decoder
    en = 0;
    i1 = 5'b00000; // Any input
    #10;
    if (y !== 8'b00000000) begin
      $display("FAIL: Test case 9 failed, expected 00000000, got %b", y);
      $finish;
    end

    // Test case 10: Disable decoder with a different input
    i1 = 5'b00101; // Any input
    #10;
    if (y !== 8'b00000000) begin
      $display("FAIL: Test case 10 failed, expected 00000000, got %b", y);
      $finish;
    end

    $display("PASS");
    $finish;
  end

endmodule