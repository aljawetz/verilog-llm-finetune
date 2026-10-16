`timescale 1ns/1ps

module tb_encoder_8to3;

  reg [7:0] in_data;
  wire [2:0] out_data;

  // Instantiate the Unit Under Test (UUT)
  encoder_8to3 uut (
    .in_data(in_data),
    .out_data(out_data)
  );

  initial begin
    // Test case 1: One-hot input for the first bit
    in_data = 8'b00000001; #10;
    if (out_data !== 3'b000) begin
      $display("FAIL: Test case 1 failed, expected 000, got %b", out_data);
      $finish;
    end

    // Test case 2: One-hot input for the second bit
    in_data = 8'b00000010; #10;
    if (out_data !== 3'b001) begin
      $display("FAIL: Test case 2 failed, expected 001, got %b", out_data);
      $finish;
    end

    // Test case 3: One-hot input for the third bit
    in_data = 8'b00000100; #10;
    if (out_data !== 3'b010) begin
      $display("FAIL: Test case 3 failed, expected 010, got %b", out_data);
      $finish;
    end

    // Test case 4: One-hot input for the fourth bit
    in_data = 8'b00001000; #10;
    if (out_data !== 3'b011) begin
      $display("FAIL: Test case 4 failed, expected 011, got %b", out_data);
      $finish;
    end

    // Test case 5: One-hot input for the fifth bit
    in_data = 8'b00010000; #10;
    if (out_data !== 3'b100) begin
      $display("FAIL: Test case 5 failed, expected 100, got %b", out_data);
      $finish;
    end

    // Test case 6: One-hot input for the sixth bit
    in_data = 8'b00100000; #10;
    if (out_data !== 3'b101) begin
      $display("FAIL: Test case 6 failed, expected 101, got %b", out_data);
      $finish;
    end

    // Test case 7: One-hot input for the seventh bit
    in_data = 8'b01000000; #10;
    if (out_data !== 3'b110) begin
      $display("FAIL: Test case 7 failed, expected 110, got %b", out_data);
      $finish;
    end

    // Test case 8: One-hot input for the eighth bit
    in_data = 8'b10000000; #10;
    if (out_data !== 3'b111) begin
      $display("FAIL: Test case 8 failed, expected 111, got %b", out_data);
      $finish;
    end

    // Test case 9: Invalid input (no active bit)
    in_data = 8'b00000000; #10;
    if (out_data !== 3'b000) begin
      $display("FAIL: Test case 9 failed, expected 000, got %b", out_data);
      $finish;
    end

    // Test case 10: Invalid input (multiple bits active)
    in_data = 8'b00000011; #10;
    if (out_data !== 3'b000) begin
      $display("FAIL: Test case 10 failed, expected 000, got %b", out_data);
      $finish;
    end

    $display("PASS");
    $finish;
  end

endmodule