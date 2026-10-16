`timescale 1ns/1ps

module tb_encoder8_3;

  reg [7:0] in_data;
  wire [2:0] out_data;

  // Instantiate the module under test (uut)
  encoder8_3 uut (
      .in_data(in_data),
      .out_data(out_data)
  );

  initial begin
    // Test case 1: Input is 00000001, expect output 000
    in_data = 8'b00000001;
    #10;
    if (out_data !== 3'b000) begin
      $display("FAIL: Test case 1 failed, expected 000, got %b", out_data);
      $finish;
    end

    // Test case 2: Input is 00000010, expect output 001
    in_data = 8'b00000010;
    #10;
    if (out_data !== 3'b001) begin
      $display("FAIL: Test case 2 failed, expected 001, got %b", out_data);
      $finish;
    end

    // Test case 3: Input is 00000100, expect output 010
    in_data = 8'b00000100;
    #10;
    if (out_data !== 3'b010) begin
      $display("FAIL: Test case 3 failed, expected 010, got %b", out_data);
      $finish;
    end

    // Test case 4: Input is 00001000, expect output 011
    in_data = 8'b00001000;
    #10;
    if (out_data !== 3'b011) begin
      $display("FAIL: Test case 4 failed, expected 011, got %b", out_data);
      $finish;
    end

    // Test case 5: Input is 00010000, expect output 100
    in_data = 8'b00010000;
    #10;
    if (out_data !== 3'b100) begin
      $display("FAIL: Test case 5 failed, expected 100, got %b", out_data);
      $finish;
    end

    // Test case 6: Input is 00100000, expect output 101
    in_data = 8'b00100000;
    #10;
    if (out_data !== 3'b101) begin
      $display("FAIL: Test case 6 failed, expected 101, got %b", out_data);
      $finish;
    end

    // Test case 7: Input is 01000000, expect output 110
    in_data = 8'b01000000;
    #10;
    if (out_data !== 3'b110) begin
      $display("FAIL: Test case 7 failed, expected 110, got %b", out_data);
      $finish;
    end

    // Test case 8: Input is 10000000, expect output 111
    in_data = 8'b10000000;
    #10;
    if (out_data !== 3'b111) begin
      $display("FAIL: Test case 8 failed, expected 111, got %b", out_data);
      $finish;
    end

    // Test case 9: Input is 00000000, expect output 000 (default case)
    in_data = 8'b00000000;
    #10;
    if (out_data !== 3'b000) begin
      $display("FAIL: Test case 9 failed, expected 000, got %b", out_data);
      $finish;
    end

    // Test case 10: Input is 11111111, expect output 000 (non-one-hot input)
    in_data = 8'b11111111;
    #10;
    if (out_data !== 3'b000) begin
      $display("FAIL: Test case 10 failed, expected 000, got %b", out_data);
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule