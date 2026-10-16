`timescale 1ns/1ps

module tb_bcd_excess3;

  reg [3:0] b;
  wire [3:0] xs3;

  // Instantiate the module under test (uut)
  bcd_excess3 uut (
    .b(b),
    .xs3(xs3)
  );

  initial begin
    // Test cases
    b = 4'b0000; #10;
    if (xs3 !== 4'b0011) begin
      $display("FAIL: Expected xs3 = 0011 for b = 0000, got xs3 = %b", xs3);
      $finish;
    end

    b = 4'b0001; #10;
    if (xs3 !== 4'b0100) begin
      $display("FAIL: Expected xs3 = 0100 for b = 0001, got xs3 = %b", xs3);
      $finish;
    end

    b = 4'b0010; #10;
    if (xs3 !== 4'b0101) begin
      $display("FAIL: Expected xs3 = 0101 for b = 0010, got xs3 = %b", xs3);
      $finish;
    end

    b = 4'b0011; #10;
    if (xs3 !== 4'b0110) begin
      $display("FAIL: Expected xs3 = 0110 for b = 0011, got xs3 = %b", xs3);
      $finish;
    end

    b = 4'b0100; #10;
    if (xs3 !== 4'b0111) begin
      $display("FAIL: Expected xs3 = 0111 for b = 0100, got xs3 = %b", xs3);
      $finish;
    end

    b = 4'b0101; #10;
    if (xs3 !== 4'b1000) begin
      $display("FAIL: Expected xs3 = 1000 for b = 0101, got xs3 = %b", xs3);
      $finish;
    end

    b = 4'b0110; #10;
    if (xs3 !== 4'b1001) begin
      $display("FAIL: Expected xs3 = 1001 for b = 0110, got xs3 = %b", xs3);
      $finish;
    end

    b = 4'b0111; #10;
    if (xs3 !== 4'b1010) begin
      $display("FAIL: Expected xs3 = 1010 for b = 0111, got xs3 = %b", xs3);
      $finish;
    end

    b = 4'b1000; #10;
    if (xs3 !== 4'b1011) begin
      $display("FAIL: Expected xs3 = 1011 for b = 1000, got xs3 = %b", xs3);
      $finish;
    end

    b = 4'b1001; #10;
    if (xs3 !== 4'b1100) begin
      $display("FAIL: Expected xs3 = 1100 for b = 1001, got xs3 = %b", xs3);
      $finish;
    end

    // Test default case
    b = 4'b1010; #10; // Invalid BCD input
    if (xs3 !== 4'b0000) begin
      $display("FAIL: Expected xs3 = 0000 for invalid b = 1010, got xs3 = %b", xs3);
      $finish;
    end

    $display("PASS");
    $finish;
  end

endmodule