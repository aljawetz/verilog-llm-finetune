`timescale 1ns/1ps

module tb_decoder3_8;

  reg [2:0] in;
  wire [7:0] y;

  // Instantiate the decoder3_8 module
  decoder3_8 uut (
    .in(in),
    .y(y)
  );

  initial begin
    // Test all possible inputs
    in = 3'b000; #10;
    if (y !== 8'b00000001) begin
      $display("FAIL: Expected 8'b00000001 for input 3'b000, got %b", y);
      $finish;
    end

    in = 3'b001; #10;
    if (y !== 8'b00000010) begin
      $display("FAIL: Expected 8'b00000010 for input 3'b001, got %b", y);
      $finish;
    end

    in = 3'b010; #10;
    if (y !== 8'b00000100) begin
      $display("FAIL: Expected 8'b00000100 for input 3'b010, got %b", y);
      $finish;
    end

    in = 3'b011; #10;
    if (y !== 8'b00001000) begin
      $display("FAIL: Expected 8'b00001000 for input 3'b011, got %b", y);
      $finish;
    end

    in = 3'b100; #10;
    if (y !== 8'b00010000) begin
      $display("FAIL: Expected 8'b00010000 for input 3'b100, got %b", y);
      $finish;
    end

    in = 3'b101; #10;
    if (y !== 8'b00100000) begin
      $display("FAIL: Expected 8'b00100000 for input 3'b101, got %b", y);
      $finish;
    end

    in = 3'b110; #10;
    if (y !== 8'b01000000) begin
      $display("FAIL: Expected 8'b01000000 for input 3'b110, got %b", y);
      $finish;
    end

    in = 3'b111; #10;
    if (y !== 8'b10000000) begin
      $display("FAIL: Expected 8'b10000000 for input 3'b111, got %b", y);
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule