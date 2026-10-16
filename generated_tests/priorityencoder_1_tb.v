`timescale 1ns/1ps

module tb_priorityencoder;

  reg en;
  reg [7:0] i;
  wire [2:0] y;

  // Instantiate the module under test (uut)
  priorityencoder uut (
    .en(en),
    .i(i),
    .y(y)
  );

  initial begin
    // Test case 1: Enable with highest bit set
    en = 1;
    i = 8'b10000000; // Input: 128
    #10;
    if (y !== 3'b111) begin
      $display("FAIL: Expected y = 3'b111 for input 8'b10000000");
      $finish;
    end

    // Test case 2: Enable with second highest bit set
    i = 8'b01000000; // Input: 64
    #10;
    if (y !== 3'b110) begin
      $display("FAIL: Expected y = 3'b110 for input 8'b01000000");
      $finish;
    end

    // Test case 3: Enable with third highest bit set
    i = 8'b00100000; // Input: 32
    #10;
    if (y !== 3'b101) begin
      $display("FAIL: Expected y = 3'b101 for input 8'b00100000");
      $finish;
    end

    // Test case 4: Enable with fourth highest bit set
    i = 8'b00010000; // Input: 16
    #10;
    if (y !== 3'b100) begin
      $display("FAIL: Expected y = 3'b100 for input 8'b00010000");
      $finish;
    end

    // Test case 5: Enable with fifth highest bit set
    i = 8'b00001000; // Input: 8
    #10;
    if (y !== 3'b011) begin
      $display("FAIL: Expected y = 3'b011 for input 8'b00001000");
      $finish;
    end

    // Test case 6: Enable with sixth highest bit set
    i = 8'b00000100; // Input: 4
    #10;
    if (y !== 3'b010) begin
      $display("FAIL: Expected y = 3'b010 for input 8'b00000100");
      $finish;
    end

    // Test case 7: Enable with seventh highest bit set
    i = 8'b00000010; // Input: 2
    #10;
    if (y !== 3'b001) begin
      $display("FAIL: Expected y = 3'b001 for input 8'b00000010");
      $finish;
    end

    // Test case 8: Enable with no bits set
    i = 8'b00000000; // Input: 0
    #10;
    if (y !== 3'b000) begin
      $display("FAIL: Expected y = 3'b000 for input 8'b00000000");
      $finish;
    end

    // Test case 9: Disable the encoder
    en = 0;
    #10;
    if (y !== 3'bzzz) begin
      $display("FAIL: Expected y = 3'bzzz when disabled");
      $finish;
    end

    $display("PASS");
    $finish;
  end

endmodule