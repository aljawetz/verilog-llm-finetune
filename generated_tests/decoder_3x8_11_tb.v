`timescale 1ns/1ps

module tb_decoder_3x8;
  reg en;
  reg [2:0] i;
  wire [7:0] y;

  // Instantiate the decoder module
  decoder_3x8 uut (
    .y(y),
    .en(en),
    .i(i)
  );

  initial begin
    // Test case 1: Enable and input 000
    en = 1;
    i = 3'b000;
    #10;
    if (y !== 8'b0000_0001) begin
      $display("FAIL: Test case 1 failed, expected 0000_0001, got %b", y);
      $finish;
    end

    // Test case 2: Enable and input 001
    i = 3'b001;
    #10;
    if (y !== 8'b0000_0010) begin
      $display("FAIL: Test case 2 failed, expected 0000_0010, got %b", y);
      $finish;
    end

    // Test case 3: Enable and input 010
    i = 3'b010;
    #10;
    if (y !== 8'b0000_0100) begin
      $display("FAIL: Test case 3 failed, expected 0000_0100, got %b", y);
      $finish;
    end

    // Test case 4: Enable and input 011
    i = 3'b011;
    #10;
    if (y !== 8'b0000_1000) begin
      $display("FAIL: Test case 4 failed, expected 0000_1000, got %b", y);
      $finish;
    end

    // Test case 5: Enable and input 100
    i = 3'b100;
    #10;
    if (y !== 8'b0001_0000) begin
      $display("FAIL: Test case 5 failed, expected 0001_0000, got %b", y);
      $finish;
    end

    // Test case 6: Enable and input 101
    i = 3'b101;
    #10;
    if (y !== 8'b0010_0000) begin
      $display("FAIL: Test case 6 failed, expected 0010_0000, got %b", y);
      $finish;
    end

    // Test case 7: Enable and input 110
    i = 3'b110;
    #10;
    if (y !== 8'b0100_0000) begin
      $display("FAIL: Test case 7 failed, expected 0100_0000, got %b", y);
      $finish;
    end

    // Test case 8: Enable and input 111
    i = 3'b111;
    #10;
    if (y !== 8'b1000_0000) begin
      $display("FAIL: Test case 8 failed, expected 1000_0000, got %b", y);
      $finish;
    end

    // Test case 9: Disable the decoder
    en = 0;
    i = 3'b000; // Input doesn't matter when disabled
    #10;
    if (y !== 8'bxxxx_xxxx) begin
      $display("FAIL: Test case 9 failed, expected xxxx_xxxx, got %b", y);
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end
endmodule