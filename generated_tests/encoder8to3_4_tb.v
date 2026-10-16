`timescale 1ns/1ps

module tb_encoder8to3;
  reg [7:0] i;
  wire [2:0] y;

  // Instantiate the module under test (uut)
  encoder8to3 uut (
    .y(y),
    .i(i)
  );

  initial begin
    // Test case 1: Valid one-hot input
    i = 8'b00000001; #10;
    if (y !== 3'b000) begin
      $display("FAIL: Test case 1 failed, expected 3'b000, got %b", y);
      $finish;
    end

    // Test case 2: Valid one-hot input
    i = 8'b00000010; #10;
    if (y !== 3'b001) begin
      $display("FAIL: Test case 2 failed, expected 3'b001, got %b", y);
      $finish;
    end

    // Test case 3: Valid one-hot input
    i = 8'b00000100; #10;
    if (y !== 3'b010) begin
      $display("FAIL: Test case 3 failed, expected 3'b010, got %b", y);
      $finish;
    end

    // Test case 4: Valid one-hot input
    i = 8'b00001000; #10;
    if (y !== 3'b011) begin
      $display("FAIL: Test case 4 failed, expected 3'b011, got %b", y);
      $finish;
    end

    // Test case 5: Valid one-hot input
    i = 8'b00010000; #10;
    if (y !== 3'b100) begin
      $display("FAIL: Test case 5 failed, expected 3'b100, got %b", y);
      $finish;
    end

    // Test case 6: Valid one-hot input
    i = 8'b00100000; #10;
    if (y !== 3'b101) begin
      $display("FAIL: Test case 6 failed, expected 3'b101, got %b", y);
      $finish;
    end

    // Test case 7: Valid one-hot input
    i = 8'b01000000; #10;
    if (y !== 3'b110) begin
      $display("FAIL: Test case 7 failed, expected 3'b110, got %b", y);
      $finish;
    end

    // Test case 8: Valid one-hot input
    i = 8'b10000000; #10;
    if (y !== 3'b111) begin
      $display("FAIL: Test case 8 failed, expected 3'b111, got %b", y);
      $finish;
    end

    // Test case 9: Invalid input (not one-hot)
    i = 8'b00000000; #10;
    if (y !== 3'bxxx) begin
      $display("FAIL: Test case 9 failed, expected 3'bxxx, got %b", y);
      $finish;
    end

    // Test case 10: Invalid input (not one-hot)
    i = 8'b00001100; #10;
    if (y !== 3'bxxx) begin
      $display("FAIL: Test case 10 failed, expected 3'bxxx, got %b", y);
      $finish;
    end

    $display("PASS");
    $finish;
  end
endmodule