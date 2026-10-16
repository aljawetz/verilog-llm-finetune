`timescale 1ns/1ps

module tb_base_decoder;

  reg [1:0] in;
  reg en;
  wire [3:0] out;

  // Instantiate the module under test (uut)
  base_decoder uut (
    .in(in),
    .en(en),
    .out(out)
  );

  initial begin
    // Test case 1: Enable decoder and input 00
    en = 1;
    in = 2'b00;
    #10;
    if (out !== 4'b0001) begin
      $display("FAIL: Expected out = 0001 for in = 00 and en = 1, got out = %b", out);
      $finish;
    end

    // Test case 2: Enable decoder and input 01
    in = 2'b01;
    #10;
    if (out !== 4'b0010) begin
      $display("FAIL: Expected out = 0010 for in = 01 and en = 1, got out = %b", out);
      $finish;
    end

    // Test case 3: Enable decoder and input 10
    in = 2'b10;
    #10;
    if (out !== 4'b0100) begin
      $display("FAIL: Expected out = 0100 for in = 10 and en = 1, got out = %b", out);
      $finish;
    end

    // Test case 4: Enable decoder and input 11
    in = 2'b11;
    #10;
    if (out !== 4'b1000) begin
      $display("FAIL: Expected out = 1000 for in = 11 and en = 1, got out = %b", out);
      $finish;
    end

    // Test case 5: Disable decoder
    en = 0;
    in = 2'b01; // Input should not matter when disabled
    #10;
    if (out !== 4'b0000) begin
      $display("FAIL: Expected out = 0000 for any in when en = 0, got out = %b", out);
      $finish;
    end

    // Test case 6: Check for invalid input when enabled
    en = 1;
    in = 2'bxx; // Invalid input
    #10;
    if (out !== 4'bxxxx) begin
      $display("FAIL: Expected out = xxxx for invalid input when en = 1, got out = %b", out);
      $finish;
    end

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule