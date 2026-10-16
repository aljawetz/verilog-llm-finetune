`timescale 1ns/1ps

module tb_gray_to_binary;

  reg [3:0] gray;
  wire [3:0] bin;

  // Instantiate the module under test (uut)
  gray_to_binary uut (
    .gray(gray),
    .bin(bin)
  );

  initial begin
    // Test cases
    // Gray to Binary conversion
    // gray = 0000 -> bin = 0000
    gray = 4'b0000; #10;
    if (bin !== 4'b0000) $display("FAIL: Expected 0000 for gray 0000, got %b", bin);

    // gray = 0001 -> bin = 0001
    gray = 4'b0001; #10;
    if (bin !== 4'b0001) $display("FAIL: Expected 0001 for gray 0001, got %b", bin);

    // gray = 0011 -> bin = 0010
    gray = 4'b0011; #10;
    if (bin !== 4'b0010) $display("FAIL: Expected 0010 for gray 0011, got %b", bin);

    // gray = 0111 -> bin = 0100
    gray = 4'b0111; #10;
    if (bin !== 4'b0100) $display("FAIL: Expected 0100 for gray 0111, got %b", bin);

    // gray = 1111 -> bin = 1000
    gray = 4'b1111; #10;
    if (bin !== 4'b1000) $display("FAIL: Expected 1000 for gray 1111, got %b", bin);

    // gray = 1010 -> bin = 0110
    gray = 4'b1010; #10;
    if (bin !== 4'b0110) $display("FAIL: Expected 0110 for gray 1010, got %b", bin);

    // gray = 1000 -> bin = 1100
    gray = 4'b1000; #10;
    if (bin !== 4'b1100) $display("FAIL: Expected 1100 for gray 1000, got %b", bin);

    // gray = 0100 -> bin = 1101
    gray = 4'b0100; #10;
    if (bin !== 4'b1101) $display("FAIL: Expected 1101 for gray 0100, got %b", bin);

    // If all tests pass
    $display("PASS");
    $finish;
  end

endmodule