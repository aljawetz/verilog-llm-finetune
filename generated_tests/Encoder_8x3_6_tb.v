`timescale 1ns/1ps

module tb_Encoder_8x3;

  reg en;
  reg [7:0] i;
  wire [2:0] y;

  // Instantiate the Encoder_8x3 module
  Encoder_8x3 uut (
    .en(en),
    .i(i),
    .y(y)
  );

  initial begin
    // Test case 1: Enable with highest bit set
    en = 1;
    i = 8'b00000001; // Expect output 000
    #10;
    if (y !== 3'b000) begin
      $display("FAIL: Test case 1 failed, expected 000, got %b", y);
      $finish;
    end

    // Test case 2: Enable with second highest bit set
    i = 8'b00000010; // Expect output 001
    #10;
    if (y !== 3'b001) begin
      $display("FAIL: Test case 2 failed, expected 001, got %b", y);
      $finish;
    end

    // Test case 3: Enable with third highest bit set
    i = 8'b00000100; // Expect output 010
    #10;
    if (y !== 3'b010) begin
      $display("FAIL: Test case 3 failed, expected 010, got %b", y);
      $finish;
    end

    // Test case 4: Enable with fourth highest bit set
    i = 8'b00001000; // Expect output 011
    #10;
    if (y !== 3'b011) begin
      $display("FAIL: Test case 4 failed, expected 011, got %b", y);
      $finish;
    end

    // Test case 5: Enable with fifth highest bit set
    i = 8'b00010000; // Expect output 100
    #10;
    if (y !== 3'b100) begin
      $display("FAIL: Test case 5 failed, expected 100, got %b", y);
      $finish;
    end

    // Test case 6: Enable with sixth highest bit set
    i = 8'b00100000; // Expect output 101
    #10;
    if (y !== 3'b101) begin
      $display("FAIL: Test case 6 failed, expected 101, got %b", y);
      $finish;
    end

    // Test case 7: Enable with seventh highest bit set
    i = 8'b01000000; // Expect output 110
    #10;
    if (y !== 3'b110) begin
      $display("FAIL: Test case 7 failed, expected 110, got %b", y);
      $finish;
    end

    // Test case 8: Enable with highest bit set
    i = 8'b10000000; // Expect output 111
    #10;
    if (y !== 3'b111) begin
      $display("FAIL: Test case 8 failed, expected 111, got %b", y);
      $finish;
    end

    // Test case 9: Disable the encoder
    en = 0;
    i = 8'b00000000; // Expect output ZZZ
    #10;
    if (y !== 3'bzzz) begin
      $display("FAIL: Test case 9 failed, expected ZZZ, got %b", y);
      $finish;
    end

    // Test case 10: Enable with no active bits
    en = 1;
    i = 8'b00000000; // Expect output 000
    #10;
    if (y !== 3'b000) begin
      $display("FAIL: Test case 10 failed, expected 000, got %b", y);
      $finish;
    end

    $display("PASS");
    $finish;
  end

endmodule