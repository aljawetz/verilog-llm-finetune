`timescale 1ns/1ps

module tb_CodewordMUX;

  reg [15:0] scanned_i;
  reg [2:0] selectBits_i;
  reg [16:0] zeroCodeword_i;
  reg [16:0] singleOneCodeword_i;
  reg [16:0] doubleConsecOnesCodeword_i;
  reg [16:0] frontHalfZerosCodeword_i;
  reg [16:0] backHalfZerosCodeword_i;
  wire [16:0] codeword_o;

  // Instantiate the module under test (uut)
  CodewordMUX uut (
    .scanned_i(scanned_i),
    .selectBits_i(selectBits_i),
    .zeroCodeword_i(zeroCodeword_i),
    .singleOneCodeword_i(singleOneCodeword_i),
    .doubleConsecOnesCodeword_i(doubleConsecOnesCodeword_i),
    .frontHalfZerosCodeword_i(frontHalfZerosCodeword_i),
    .backHalfZerosCodeword_i(backHalfZerosCodeword_i),
    .codeword_o(codeword_o)
  );

  initial begin
    // Initialize inputs
    scanned_i = 16'b0000000000000000;
    selectBits_i = 3'b000;
    zeroCodeword_i = 17'b00000000000000000;
    singleOneCodeword_i = 17'b00000000000000001;
    doubleConsecOnesCodeword_i = 17'b00000000000000011;
    frontHalfZerosCodeword_i = 17'b00000000000011111;
    backHalfZerosCodeword_i = 17'b11111000000000000;

    // Test case 1: Select zeroCodeword
    selectBits_i = 3'b000;
    #10;
    if (codeword_o !== zeroCodeword_i) begin
      $display("FAIL: Test case 1 failed, expected %b, got %b", zeroCodeword_i, codeword_o);
      $finish;
    end

    // Test case 2: Select singleOneCodeword
    selectBits_i = 3'b001;
    #10;
    if (codeword_o !== singleOneCodeword_i) begin
      $display("FAIL: Test case 2 failed, expected %b, got %b", singleOneCodeword_i, codeword_o);
      $finish;
    end

    // Test case 3: Select doubleConsecOnesCodeword
    selectBits_i = 3'b010;
    #10;
    if (codeword_o !== doubleConsecOnesCodeword_i) begin
      $display("FAIL: Test case 3 failed, expected %b, got %b", doubleConsecOnesCodeword_i, codeword_o);
      $finish;
    end

    // Test case 4: Select frontHalfZerosCodeword
    selectBits_i = 3'b011;
    #10;
    if (codeword_o !== frontHalfZerosCodeword_i) begin
      $display("FAIL: Test case 4 failed, expected %b, got %b", frontHalfZerosCodeword_i, codeword_o);
      $finish;
    end

    // Test case 5: Select backHalfZerosCodeword
    selectBits_i = 3'b100;
    #10;
    if (codeword_o !== backHalfZerosCodeword_i) begin
      $display("FAIL: Test case 5 failed, expected %b, got %b", backHalfZerosCodeword_i, codeword_o);
      $finish;
    end

    // Test case 6: Select scanned data with leading one
    scanned_i = 16'b1010101010101010;
    selectBits_i = 3'b101;
    #10;
    if (codeword_o !== {1'b1, scanned_i}) begin
      $display("FAIL: Test case 6 failed, expected %b, got %b", {1'b1, scanned_i}, codeword_o);
      $finish;
    end

    // Test case 7: Default case
    selectBits_i = 3'b110;
    #10;
    if (codeword_o !== 17'd0) begin
      $display("FAIL: Test case 7 failed, expected 0, got %b", codeword_o);
      $finish;
    end

    $display("PASS");
    $finish;
  end

endmodule