`timescale 1ns/1ps

module tb_decoder_2_to_4;

  reg [1:0] a;
  wire [3:0] y;

  // Instantiate the module under test (uut)
  decoder_2_to_4 uut (
    .a(a),
    .y(y)
  );

  initial begin
    // Test case 1: Input = 00, Expected Output = 0001
    a = 2'b00; #10;
    if (y !== 4'b0001) begin
      $display("FAIL: Test case 1 failed. Expected 0001, got %b", y);
      $finish;
    end

    // Test case 2: Input = 01, Expected Output = 0010
    a = 2'b01; #10;
    if (y !== 4'b0010) begin
      $display("FAIL: Test case 2 failed. Expected 0010, got %b", y);
      $finish;
    end

    // Test case 3: Input = 10, Expected Output = 0100
    a = 2'b10; #10;
    if (y !== 4'b0100) begin
      $display("FAIL: Test case 3 failed. Expected 0100, got %b", y);
      $finish;
    end

    // Test case 4: Input = 11, Expected Output = 1000
    a = 2'b11; #10;
    if (y !== 4'b1000) begin
      $display("FAIL: Test case 4 failed. Expected 1000, got %b", y);
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule