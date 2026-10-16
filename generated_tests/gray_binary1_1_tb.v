`timescale 1ns/1ps

module tb_gray_binary1;

  reg [3:0] G;
  wire [3:0] bin;

  // Instantiate the module under test
  gray_binary1 uut (
    .G(G),
    .bin(bin)
  );

  initial begin
    // Test cases for Gray to Binary conversion
    // Gray code: 0000 -> Binary: 0000
    G = 4'b0000; #10;
    if (bin !== 4'b0000) $display("FAIL: Expected 0000 for Gray 0000, got %b", bin);

    // Gray code: 0001 -> Binary: 0001
    G = 4'b0001; #10;
    if (bin !== 4'b0001) $display("FAIL: Expected 0001 for Gray 0001, got %b", bin);

    // Gray code: 0011 -> Binary: 0010
    G = 4'b0011; #10;
    if (bin !== 4'b0010) $display("FAIL: Expected 0010 for Gray 0011, got %b", bin);

    // Gray code: 0010 -> Binary: 0011
    G = 4'b0010; #10;
    if (bin !== 4'b0011) $display("FAIL: Expected 0011 for Gray 0010, got %b", bin);

    // Gray code: 0111 -> Binary: 0100
    G = 4'b0111; #10;
    if (bin !== 4'b0100) $display("FAIL: Expected 0100 for Gray 0111, got %b", bin);

    // Gray code: 0100 -> Binary: 0111
    G = 4'b0100; #10;
    if (bin !== 4'b0111) $display("FAIL: Expected 0111 for Gray 0100, got %b", bin);

    // Gray code: 1111 -> Binary: 1000
    G = 4'b1111; #10;
    if (bin !== 4'b1000) $display("FAIL: Expected 1000 for Gray 1111, got %b", bin);

    // Gray code: 1000 -> Binary: 1111
    G = 4'b1000; #10;
    if (bin !== 4'b1111) $display("FAIL: Expected 1111 for Gray 1000, got %b", bin);

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule