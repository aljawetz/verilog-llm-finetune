`timescale 1ns/1ps

module tb_decoder2_4;

  reg [1:0] in;
  wire [3:0] out;

  // Instantiate the module under test (uut)
  decoder2_4 uut (
    .in(in),
    .out(out)
  );

  initial begin
    // Test sequence
    // Test case 0: in = 00, expect out = 0001
    in = 2'b00; #10;
    if (out !== 4'b0001) begin
      $display("FAIL: Test case 0 failed, expected 0001, got %b", out);
      $finish;
    end

    // Test case 1: in = 01, expect out = 0010
    in = 2'b01; #10;
    if (out !== 4'b0010) begin
      $display("FAIL: Test case 1 failed, expected 0010, got %b", out);
      $finish;
    end

    // Test case 2: in = 10, expect out = 0100
    in = 2'b10; #10;
    if (out !== 4'b0100) begin
      $display("FAIL: Test case 2 failed, expected 0100, got %b", out);
      $finish;
    end

    // Test case 3: in = 11, expect out = 1000
    in = 2'b11; #10;
    if (out !== 4'b1000) begin
      $display("FAIL: Test case 3 failed, expected 1000, got %b", out);
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule