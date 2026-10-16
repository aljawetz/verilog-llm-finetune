`timescale 1ns/1ps

module tb_encoder;
  reg [7:0] D;
  wire [2:0] y;

  // Instantiate the encoder module
  encoder uut (
    .D(D),
    .y(y)
  );

  initial begin
    // Test case 1: Input is 8'b10000000
    D = 8'b10000000; #10;
    if (y !== 3'b111) begin
      $display("FAIL: Expected y = 3'b111 for D = 8'b10000000, got y = %b", y);
      $finish;
    end

    // Test case 2: Input is 8'b01000000
    D = 8'b01000000; #10;
    if (y !== 3'b110) begin
      $display("FAIL: Expected y = 3'b110 for D = 8'b01000000, got y = %b", y);
      $finish;
    end

    // Test case 3: Input is 8'b00100000
    D = 8'b00100000; #10;
    if (y !== 3'b101) begin
      $display("FAIL: Expected y = 3'b101 for D = 8'b00100000, got y = %b", y);
      $finish;
    end

    // Test case 4: Input is 8'b00010000
    D = 8'b00010000; #10;
    if (y !== 3'b100) begin
      $display("FAIL: Expected y = 3'b100 for D = 8'b00010000, got y = %b", y);
      $finish;
    end

    // Test case 5: Input is 8'b00001000
    D = 8'b00001000; #10;
    if (y !== 3'b011) begin
      $display("FAIL: Expected y = 3'b011 for D = 8'b00001000, got y = %b", y);
      $finish;
    end

    // Test case 6: Input is 8'b00000100
    D = 8'b00000100; #10;
    if (y !== 3'b010) begin
      $display("FAIL: Expected y = 3'b010 for D = 8'b00000100, got y = %b", y);
      $finish;
    end

    // Test case 7: Input is 8'b00000010
    D = 8'b00000010; #10;
    if (y !== 3'b001) begin
      $display("FAIL: Expected y = 3'b001 for D = 8'b00000010, got y = %b", y);
      $finish;
    end

    // Test case 8: Input is 8'b00000001
    D = 8'b00000001; #10;
    if (y !== 3'b000) begin
      $display("FAIL: Expected y = 3'b000 for D = 8'b00000001, got y = %b", y);
      $finish;
    end

    // Test case 9: Input is 8'b00000000 (default case)
    D = 8'b00000000; #10;
    if (y !== 3'b000) begin
      $display("FAIL: Expected y = 3'b000 for D = 8'b00000000, got y = %b", y);
      $finish;
    end

    $display("PASS");
    $finish;
  end
endmodule