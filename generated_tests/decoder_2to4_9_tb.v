`timescale 1ns/1ps

module tb_decoder_2to4;

  reg [1:0] in;
  wire [3:0] out;

  // Instantiate the module under test (uut)
  decoder_2to4 uut (
    .in(in),
    .out(out)
  );

  initial begin
    // Test case 1: Input 00
    in = 2'b00; #10;
    if (out !== 4'b0001) begin
      $display("FAIL: Expected out = 4'b0001 for in = 2'b00, got out = %b", out);
      $finish;
    end

    // Test case 2: Input 01
    in = 2'b01; #10;
    if (out !== 4'b0010) begin
      $display("FAIL: Expected out = 4'b0010 for in = 2'b01, got out = %b", out);
      $finish;
    end

    // Test case 3: Input 10
    in = 2'b10; #10;
    if (out !== 4'b0100) begin
      $display("FAIL: Expected out = 4'b0100 for in = 2'b10, got out = %b", out);
      $finish;
    end

    // Test case 4: Input 11
    in = 2'b11; #10;
    if (out !== 4'b1000) begin
      $display("FAIL: Expected out = 4'b1000 for in = 2'b11, got out = %b", out);
      $finish;
    end

    // Test case 5: Default case (not applicable for 2-bit input)
    in = 2'bxx; #10; // This is just to test the default case
    if (out !== 4'b0000) begin
      $display("FAIL: Expected out = 4'b0000 for in = 2'bxx, got out = %b", out);
      $finish;
    end

    $display("PASS");
    $finish;
  end

endmodule