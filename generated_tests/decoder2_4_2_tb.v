`timescale 1ns/1ps

module tb_decoder2_4;

  reg [1:0] in;
  wire [3:0] out;

  // Instantiate the module under test
  decoder2_4 uut (
    .in(in),
    .out(out)
  );

  initial begin
    // Test case 1: Check output for in = 00
    in = 2'b00; #10;
    if (out !== 4'b0001) begin
      $display("FAIL: Expected out = 0001 for in = 00, got out = %b", out);
      $finish;
    end

    // Test case 2: Check output for in = 01
    in = 2'b01; #10;
    if (out !== 4'b0010) begin
      $display("FAIL: Expected out = 0010 for in = 01, got out = %b", out);
      $finish;
    end

    // Test case 3: Check output for in = 10
    in = 2'b10; #10;
    if (out !== 4'b0100) begin
      $display("FAIL: Expected out = 0100 for in = 10, got out = %b", out);
      $finish;
    end

    // Test case 4: Check output for in = 11
    in = 2'b11; #10;
    if (out !== 4'b1000) begin
      $display("FAIL: Expected out = 1000 for in = 11, got out = %b", out);
      $finish;
    end

    $display("PASS");
    $finish;
  end

endmodule