`timescale 1ns/1ps

module tb_encoder8to3;
  reg [7:0] i;
  wire [2:0] y;

  // Instantiate the encoder module
  encoder8to3 uut (
    .y(y),
    .i(i)
  );

  initial begin
    // Test case 1: Input 00000001 should output 000
    i = 8'b00000001; #10;
    if (y !== 3'b000) begin
      $display("FAIL: Expected y=000 for i=00000001, got y=%b", y);
      $finish;
    end

    // Test case 2: Input 00000010 should output 001
    i = 8'b00000010; #10;
    if (y !== 3'b001) begin
      $display("FAIL: Expected y=001 for i=00000010, got y=%b", y);
      $finish;
    end

    // Test case 3: Input 00000100 should output 010
    i = 8'b00000100; #10;
    if (y !== 3'b010) begin
      $display("FAIL: Expected y=010 for i=00000100, got y=%b", y);
      $finish;
    end

    // Test case 4: Input 00001000 should output 011
    i = 8'b00001000; #10;
    if (y !== 3'b011) begin
      $display("FAIL: Expected y=011 for i=00001000, got y=%b", y);
      $finish;
    end

    // Test case 5: Input 00010000 should output 100
    i = 8'b00010000; #10;
    if (y !== 3'b100) begin
      $display("FAIL: Expected y=100 for i=00010000, got y=%b", y);
      $finish;
    end

    // Test case 6: Input 00100000 should output 101
    i = 8'b00100000; #10;
    if (y !== 3'b101) begin
      $display("FAIL: Expected y=101 for i=00100000, got y=%b", y);
      $finish;
    end

    // Test case 7: Input 01000000 should output 110
    i = 8'b01000000; #10;
    if (y !== 3'b110) begin
      $display("FAIL: Expected y=110 for i=01000000, got y=%b", y);
      $finish;
    end

    // Test case 8: Input 10000000 should output 111
    i = 8'b10000000; #10;
    if (y !== 3'b111) begin
      $display("FAIL: Expected y=111 for i=10000000, got y=%b", y);
      $finish;
    end

    // Test case 9: Input 00000000 should output xxx (invalid case)
    i = 8'b00000000; #10;
    if (y !== 3'bxxx) begin
      $display("FAIL: Expected y=xxx for i=00000000, got y=%b", y);
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end
endmodule