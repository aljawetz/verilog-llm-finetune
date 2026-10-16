`timescale 1ns/1ps

module tb_decoder_2x4_df;

  // Inputs
  reg [1:0] a;
  reg en;

  // Outputs
  wire d0, d1, d2, d3;

  // Instantiate the Unit Under Test (UUT)
  decoder_2x4_df uut (
    .d0(d0),
    .d1(d1),
    .d2(d2),
    .d3(d3),
    .a(a),
    .en(en)
  );

  initial begin
    // Initialize inputs
    en = 0;
    a = 2'b00;

    // Wait for global reset
    #10;

    // Test case 1: Enable is low, all outputs should be low
    en = 0; a = 2'b00; #10;
    if (d0 !== 0 || d1 !== 0 || d2 !== 0 || d3 !== 0) begin
      $display("FAIL: Test case 1 failed");
      $finish;
    end

    // Test case 2: Enable is high, a = 00, d0 should be high
    en = 1; a = 2'b00; #10;
    if (d0 !== 1 || d1 !== 0 || d2 !== 0 || d3 !== 0) begin
      $display("FAIL: Test case 2 failed");
      $finish;
    end

    // Test case 3: Enable is high, a = 01, d1 should be high
    a = 2'b01; #10;
    if (d0 !== 0 || d1 !== 1 || d2 !== 0 || d3 !== 0) begin
      $display("FAIL: Test case 3 failed");
      $finish;
    end

    // Test case 4: Enable is high, a = 10, d2 should be high
    a = 2'b10; #10;
    if (d0 !== 0 || d1 !== 0 || d2 !== 1 || d3 !== 0) begin
      $display("FAIL: Test case 4 failed");
      $finish;
    end

    // Test case 5: Enable is high, a = 11, d3 should be high
    a = 2'b11; #10;
    if (d0 !== 0 || d1 !== 0 || d2 !== 0 || d3 !== 1) begin
      $display("FAIL: Test case 5 failed");
      $finish;
    end

    // Test case 6: Enable is low again, all outputs should be low
    en = 0; a = 2'b11; #10;
    if (d0 !== 0 || d1 !== 0 || d2 !== 0 || d3 !== 0) begin
      $display("FAIL: Test case 6 failed");
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule