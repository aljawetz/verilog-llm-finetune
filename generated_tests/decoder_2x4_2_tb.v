`timescale 1ns/1ps

module tb_decoder_2x4;

  reg [1:0] a;
  reg enable;
  wire [3:0] d;

  // Instantiate the decoder module
  decoder_2x4 uut (
    .a(a),
    .enable(enable),
    .d(d)
  );

  initial begin
    // Initialize inputs
    a = 2'b00;
    enable = 0;

    // Test case 1: Enable is low, all outputs should be 0
    #10;
    if (d !== 4'b0000) begin
      $display("FAIL: Test case 1 failed, expected 0000, got %b", d);
      $finish;
    end

    // Test case 2: Enable is high, a = 00, d[0] should be high
    enable = 1;
    a = 2'b00;
    #10;
    if (d !== 4'b0001) begin
      $display("FAIL: Test case 2 failed, expected 0001, got %b", d);
      $finish;
    end

    // Test case 3: a = 01, d[1] should be high
    a = 2'b01;
    #10;
    if (d !== 4'b0010) begin
      $display("FAIL: Test case 3 failed, expected 0010, got %b", d);
      $finish;
    end

    // Test case 4: a = 10, d[2] should be high
    a = 2'b10;
    #10;
    if (d !== 4'b0100) begin
      $display("FAIL: Test case 4 failed, expected 0100, got %b", d);
      $finish;
    end

    // Test case 5: a = 11, d[3] should be high
    a = 2'b11;
    #10;
    if (d !== 4'b1000) begin
      $display("FAIL: Test case 5 failed, expected 1000, got %b", d);
      $finish;
    end

    // Test case 6: Enable is low again, all outputs should be 0
    enable = 0;
    #10;
    if (d !== 4'b0000) begin
      $display("FAIL: Test case 6 failed, expected 0000, got %b", d);
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule