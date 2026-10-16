`timescale 1ns/1ps

module tb_bi_decoder;

  reg [2:0] D;
  wire [7:0] y;

  // Instantiate the module under test (uut)
  bi_decoder uut (
    .D(D),
    .y(y)
  );

  initial begin
    // Test cases
    D = 3'b000; #10;
    if (y !== 8'b00000001) begin
      $display("FAIL: Expected y = 00000001 for D = 000, got y = %b", y);
      $finish;
    end

    D = 3'b001; #10;
    if (y !== 8'b00000010) begin
      $display("FAIL: Expected y = 00000010 for D = 001, got y = %b", y);
      $finish;
    end

    D = 3'b010; #10;
    if (y !== 8'b00000100) begin
      $display("FAIL: Expected y = 00000100 for D = 010, got y = %b", y);
      $finish;
    end

    D = 3'b011; #10;
    if (y !== 8'b00001000) begin
      $display("FAIL: Expected y = 00001000 for D = 011, got y = %b", y);
      $finish;
    end

    D = 3'b100; #10;
    if (y !== 8'b00010000) begin
      $display("FAIL: Expected y = 00010000 for D = 100, got y = %b", y);
      $finish;
    end

    D = 3'b101; #10;
    if (y !== 8'b00100000) begin
      $display("FAIL: Expected y = 00100000 for D = 101, got y = %b", y);
      $finish;
    end

    D = 3'b110; #10;
    if (y !== 8'b01000000) begin
      $display("FAIL: Expected y = 01000000 for D = 110, got y = %b", y);
      $finish;
    end

    D = 3'b111; #10;
    if (y !== 8'b10000000) begin
      $display("FAIL: Expected y = 10000000 for D = 111, got y = %b", y);
      $finish;
    end

    $display("PASS");
    $finish;
  end

endmodule