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
    i = 8'b10000000; // Input 7
    #10;
    if (y !== 3'b111) begin
      $display("FAIL: Expected y=111 for input 10000000, got y=%b", y);
      $finish;
    end

    // Test case 2: Enable with second highest bit set
    i = 8'b01000000; // Input 6
    #10;
    if (y !== 3'b110) begin
      $display("FAIL: Expected y=110 for input 01000000, got y=%b", y);
      $finish;
    end

    // Test case 3: Enable with middle bit set
    i = 8'b00100000; // Input 5
    #10;
    if (y !== 3'b101) begin
      $display("FAIL: Expected y=101 for input 00100000, got y=%b", y);
      $finish;
    end

    // Test case 4: Enable with lower bit set
    i = 8'b00000010; // Input 1
    #10;
    if (y !== 3'b001) begin
      $display("FAIL: Expected y=001 for input 00000010, got y=%b", y);
      $finish;
    end

    // Test case 5: Enable with no bits set
    i = 8'b00000000; // No input
    #10;
    if (y !== 3'b000) begin
      $display("FAIL: Expected y=000 for input 00000000, got y=%b", y);
      $finish;
    end

    // Test case 6: Disable the encoder
    en = 0;
    #10;
    if (y !== 3'bzzz) begin
      $display("FAIL: Expected y=zzz when disabled, got y=%b", y);
      $finish;
    end

    // Test case 7: Enable again with multiple bits set
    en = 1;
    i = 8'b01100000; // Inputs 6 and 5
    #10;
    if (y !== 3'b110) begin
      $display("FAIL: Expected y=110 for input 01100000, got y=%b", y);
      $finish;
    end

    // Test case 8: Enable with highest bit set again
    i = 8'b10000001; // Inputs 7 and 0
    #10;
    if (y !== 3'b111) begin
      $display("FAIL: Expected y=111 for input 10000001, got y=%b", y);
      $finish;
    end

    $display("PASS");
    $finish;
  end

endmodule