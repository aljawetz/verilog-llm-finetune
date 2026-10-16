`timescale 1ns/1ps

module tb_priorityencoder;

  reg [7:0] A;
  wire [2:0] Y;

  // Instantiate the module under test (uut)
  priorityencoder uut (
    .A(A),
    .Y(Y)
  );

  initial begin
    // Test cases
    // Test case 1: A = 8'b00000001
    A = 8'b00000001; #10;
    if (Y !== 3'b000) begin
      $display("FAIL: Expected Y = 3'b000 for A = 8'b00000001, got Y = %b", Y);
      $finish;
    end

    // Test case 2: A = 8'b00000010
    A = 8'b00000010; #10;
    if (Y !== 3'b001) begin
      $display("FAIL: Expected Y = 3'b001 for A = 8'b00000010, got Y = %b", Y);
      $finish;
    end

    // Test case 3: A = 8'b00000100
    A = 8'b00000100; #10;
    if (Y !== 3'b010) begin
      $display("FAIL: Expected Y = 3'b010 for A = 8'b00000100, got Y = %b", Y);
      $finish;
    end

    // Test case 4: A = 8'b00001000
    A = 8'b00001000; #10;
    if (Y !== 3'b011) begin
      $display("FAIL: Expected Y = 3'b011 for A = 8'b00001000, got Y = %b", Y);
      $finish;
    end

    // Test case 5: A = 8'b00010000
    A = 8'b00010000; #10;
    if (Y !== 3'b100) begin
      $display("FAIL: Expected Y = 3'b100 for A = 8'b00010000, got Y = %b", Y);
      $finish;
    end

    // Test case 6: A = 8'b00100000
    A = 8'b00100000; #10;
    if (Y !== 3'b101) begin
      $display("FAIL: Expected Y = 3'b101 for A = 8'b00100000, got Y = %b", Y);
      $finish;
    end

    // Test case 7: A = 8'b01000000
    A = 8'b01000000; #10;
    if (Y !== 3'b110) begin
      $display("FAIL: Expected Y = 3'b110 for A = 8'b01000000, got Y = %b", Y);
      $finish;
    end

    // Test case 8: A = 8'b10000000
    A = 8'b10000000; #10;
    if (Y !== 3'b111) begin
      $display("FAIL: Expected Y = 3'b111 for A = 8'b10000000, got Y = %b", Y);
      $finish;
    end

    // Test case 9: A = 8'b11111111 (multiple bits set)
    A = 8'b11111111; #10;
    if (Y !== 3'b111) begin
      $display("FAIL: Expected Y = 3'b111 for A = 8'b11111111, got Y = %b", Y);
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule