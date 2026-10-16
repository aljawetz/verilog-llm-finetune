`timescale 1ns/1ps

module tb_decoder_3to8;

  reg [2:0] in;
  wire [7:0] y;

  // Instantiate the module under test (uut)
  decoder_3to8 uut (
    .in(in),
    .y(y)
  );

  initial begin
    // Test all input combinations
    in = 3'b000; #10;
    if (y !== 8'b00000001) begin
      $display("FAIL: Expected y = 00000001 for in = 000");
      $finish;
    end

    in = 3'b001; #10;
    if (y !== 8'b00000010) begin
      $display("FAIL: Expected y = 00000010 for in = 001");
      $finish;
    end

    in = 3'b010; #10;
    if (y !== 8'b00000100) begin
      $display("FAIL: Expected y = 00000100 for in = 010");
      $finish;
    end

    in = 3'b011; #10;
    if (y !== 8'b00001000) begin
      $display("FAIL: Expected y = 00001000 for in = 011");
      $finish;
    end

    in = 3'b100; #10;
    if (y !== 8'b00010000) begin
      $display("FAIL: Expected y = 00010000 for in = 100");
      $finish;
    end

    in = 3'b101; #10;
    if (y !== 8'b00100000) begin
      $display("FAIL: Expected y = 00100000 for in = 101");
      $finish;
    end

    in = 3'b110; #10;
    if (y !== 8'b01000000) begin
      $display("FAIL: Expected y = 01000000 for in = 110");
      $finish;
    end

    in = 3'b111; #10;
    if (y !== 8'b10000000) begin
      $display("FAIL: Expected y = 10000000 for in = 111");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule