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
    // Test case 1: a = 00
    a = 2'b00;
    #10;
    if (y !== 4'b0001) begin
      $display("FAIL: Test case 1 failed, expected y = 0001, got y = %b", y);
      $finish;
    end

    // Test case 2: a = 01
    a = 2'b01;
    #10;
    if (y !== 4'b0010) begin
      $display("FAIL: Test case 2 failed, expected y = 0010, got y = %b", y);
      $finish;
    end

    // Test case 3: a = 10
    a = 2'b10;
    #10;
    if (y !== 4'b0100) begin
      $display("FAIL: Test case 3 failed, expected y = 0100, got y = %b", y);
      $finish;
    end

    // Test case 4: a = 11
    a = 2'b11;
    #10;
    if (y !== 4'b1000) begin
      $display("FAIL: Test case 4 failed, expected y = 1000, got y = %b", y);
      $finish;
    end

    $display("PASS");
    $finish;
  end

endmodule