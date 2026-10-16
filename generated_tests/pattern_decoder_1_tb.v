`timescale 1ns/1ps

module tb_pattern_decoder;

  reg [1:0] in;
  reg en;
  wire [3:0] out;

  // Instantiate the module under test (uut)
  pattern_decoder uut (
    .in(in),
    .en(en),
    .out(out)
  );

  initial begin
    // Test case 1: Enable and input 0
    en = 1;
    in = 2'b00;
    #10;
    if (out !== 4'b0001) begin
      $display("FAIL: Test case 1 failed, expected 0001, got %b", out);
      $finish;
    end

    // Test case 2: Enable and input 1
    in = 2'b01;
    #10;
    if (out !== 4'b0010) begin
      $display("FAIL: Test case 2 failed, expected 0010, got %b", out);
      $finish;
    end

    // Test case 3: Enable and input 2
    in = 2'b10;
    #10;
    if (out !== 4'b0100) begin
      $display("FAIL: Test case 3 failed, expected 0100, got %b", out);
      $finish;
    end

    // Test case 4: Enable and input 3 (default case)
    in = 2'b11;
    #10;
    if (out !== 4'bxxxx) begin
      $display("FAIL: Test case 4 failed, expected xxxx, got %b", out);
      $finish;
    end

    // Test case 5: Disable the decoder
    en = 0;
    in = 2'b01; // Input should not matter when en is 0
    #10;
    if (out !== 4'b0000) begin
      $display("FAIL: Test case 5 failed, expected 0000, got %b", out);
      $finish;
    end

    // Test case 6: Disable the decoder with input 2
    in = 2'b10; // Input should not matter when en is 0
    #10;
    if (out !== 4'b0000) begin
      $display("FAIL: Test case 6 failed, expected 0000, got %b", out);
      $finish;
    end

    // All tests passed
    $display("PASS");
    $finish;
  end

endmodule