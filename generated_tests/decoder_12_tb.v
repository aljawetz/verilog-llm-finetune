`timescale 1ns/1ps

module tb_decoder;

  reg [2:0] digit;
  wire [7:0] vector;

  // Instantiate the module under test (uut)
  decoder uut (
    .digit(digit),
    .vector(vector)
  );

  initial begin
    // Test all possible inputs
    digit = 3'b000; #10;
    if (vector !== 8'b00000001) begin
      $display("FAIL: Expected 00000001 for input 000, got %b", vector);
      $finish;
    end

    digit = 3'b001; #10;
    if (vector !== 8'b00000010) begin
      $display("FAIL: Expected 00000010 for input 001, got %b", vector);
      $finish;
    end

    digit = 3'b010; #10;
    if (vector !== 8'b00000100) begin
      $display("FAIL: Expected 00000100 for input 010, got %b", vector);
      $finish;
    end

    digit = 3'b011; #10;
    if (vector !== 8'b00001000) begin
      $display("FAIL: Expected 00001000 for input 011, got %b", vector);
      $finish;
    end

    digit = 3'b100; #10;
    if (vector !== 8'b00010000) begin
      $display("FAIL: Expected 00010000 for input 100, got %b", vector);
      $finish;
    end

    digit = 3'b101; #10;
    if (vector !== 8'b00100000) begin
      $display("FAIL: Expected 00100000 for input 101, got %b", vector);
      $finish;
    end

    digit = 3'b110; #10;
    if (vector !== 8'b01000000) begin
      $display("FAIL: Expected 01000000 for input 110, got %b", vector);
      $finish;
    end

    digit = 3'b111; #10;
    if (vector !== 8'b10000000) begin
      $display("FAIL: Expected 10000000 for input 111, got %b", vector);
      $finish;
    end

    $display("PASS");
    $finish;
  end

endmodule