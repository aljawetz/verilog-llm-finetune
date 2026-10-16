`timescale 1ns/1ps

module tb_decoder;
  reg [2:0] j;
  wire [7:0] y;
  
  // Instantiate the decoder module
  decoder uut (
    .j(j),
    .y(y)
  );

  initial begin
    // Test case 1: Input 0
    j = 3'b000; #10;
    if (y !== 8'b00000001) begin
      $display("FAIL: Test case 1 failed, expected 00000001, got %b", y);
      $finish;
    end

    // Test case 2: Input 1
    j = 3'b001; #10;
    if (y !== 8'b00000010) begin
      $display("FAIL: Test case 2 failed, expected 00000010, got %b", y);
      $finish;
    end

    // Test case 3: Input 2
    j = 3'b010; #10;
    if (y !== 8'b00000100) begin
      $display("FAIL: Test case 3 failed, expected 00000100, got %b", y);
      $finish;
    end

    // Test case 4: Input 3
    j = 3'b011; #10;
    if (y !== 8'b00001000) begin
      $display("FAIL: Test case 4 failed, expected 00001000, got %b", y);
      $finish;
    end

    // Test case 5: Input 4
    j = 3'b100; #10;
    if (y !== 8'b00010000) begin
      $display("FAIL: Test case 5 failed, expected 00010000, got %b", y);
      $finish;
    end

    // Test case 6: Input 5
    j = 3'b101; #10;
    if (y !== 8'b00100000) begin
      $display("FAIL: Test case 6 failed, expected 00100000, got %b", y);
      $finish;
    end

    // Test case 7: Input 6
    j = 3'b110; #10;
    if (y !== 8'b01000000) begin
      $display("FAIL: Test case 7 failed, expected 01000000, got %b", y);
      $finish;
    end

    // Test case 8: Input 7
    j = 3'b111; #10;
    if (y !== 8'b10000000) begin
      $display("FAIL: Test case 8 failed, expected 10000000, got %b", y);
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end
endmodule