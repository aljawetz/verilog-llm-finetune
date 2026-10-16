`timescale 1ns/1ps

module tb_decoder_2x4;

  reg en;
  reg [1:0] i;
  wire [3:0] y;

  // Instantiate the module under test
  decoder_2x4 uut (
    .y(y),
    .en(en),
    .i(i)
  );

  initial begin
    // Test case 1: Enable and input 00
    en = 1;
    i = 2'b00;
    #10;
    if (y !== 4'b0001) begin
      $display("FAIL: Test case 1 failed, expected 0001, got %b", y);
      $finish;
    end

    // Test case 2: Enable and input 01
    i = 2'b01;
    #10;
    if (y !== 4'b0010) begin
      $display("FAIL: Test case 2 failed, expected 0010, got %b", y);
      $finish;
    end

    // Test case 3: Enable and input 10
    i = 2'b10;
    #10;
    if (y !== 4'b0100) begin
      $display("FAIL: Test case 3 failed, expected 0100, got %b", y);
      $finish;
    end

    // Test case 4: Enable and input 11
    i = 2'b11;
    #10;
    if (y !== 4'b1000) begin
      $display("FAIL: Test case 4 failed, expected 1000, got %b", y);
      $finish;
    end

    // Test case 5: Disable the decoder
    en = 0;
    i = 2'b01; // Input should not matter when disabled
    #10;
    if (y !== 4'b0000) begin
      $display("FAIL: Test case 5 failed, expected 0000, got %b", y);
      $finish;
    end

    // Test case 6: Check all outputs when disabled
    i = 2'b10; // Input should not matter when disabled
    #10;
    if (y !== 4'b0000) begin
      $display("FAIL: Test case 6 failed, expected 0000, got %b", y);
      $finish;
    end

    // Test case 7: Check all outputs when disabled
    i = 2'b11; // Input should not matter when disabled
    #10;
    if (y !== 4'b0000) begin
      $display("FAIL: Test case 7 failed, expected 0000, got %b", y);
      $finish;
    end

    $display("PASS");
    $finish;
  end

endmodule