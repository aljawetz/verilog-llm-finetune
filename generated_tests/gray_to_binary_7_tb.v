`timescale 1ns/1ps

module tb_gray_to_binary;

reg [3:0] gray_in;
wire [3:0] binary_out;

// Instantiate the module under test (uut)
gray_to_binary uut (
    .gray_in(gray_in),
    .binary_out(binary_out)
);

initial begin
    // Test cases
    gray_in = 4'b0000; #10;
    if (binary_out !== 4'b0000) $display("FAIL: gray_in=0000, expected binary_out=0000, got %b", binary_out);

    gray_in = 4'b0001; #10;
    if (binary_out !== 4'b0001) $display("FAIL: gray_in=0001, expected binary_out=0001, got %b", binary_out);

    gray_in = 4'b0011; #10;
    if (binary_out !== 4'b0010) $display("FAIL: gray_in=0011, expected binary_out=0010, got %b", binary_out);

    gray_in = 4'b0010; #10;
    if (binary_out !== 4'b0011) $display("FAIL: gray_in=0010, expected binary_out=0011, got %b", binary_out);

    gray_in = 4'b0111; #10;
    if (binary_out !== 4'b0110) $display("FAIL: gray_in=0111, expected binary_out=0110, got %b", binary_out);

    gray_in = 4'b0110; #10;
    if (binary_out !== 4'b0111) $display("FAIL: gray_in=0110, expected binary_out=0111, got %b", binary_out);

    gray_in = 4'b1111; #10;
    if (binary_out !== 4'b1000) $display("FAIL: gray_in=1111, expected binary_out=1000, got %b", binary_out);

    gray_in = 4'b1000; #10;
    if (binary_out !== 4'b1001) $display("FAIL: gray_in=1000, expected binary_out=1001, got %b", binary_out);

    gray_in = 4'b1010; #10;
    if (binary_out !== 4'b1011) $display("FAIL: gray_in=1010, expected binary_out=1011, got %b", binary_out);

    gray_in = 4'b1011; #10;
    if (binary_out !== 4'b1010) $display("FAIL: gray_in=1011, expected binary_out=1010, got %b", binary_out);

    gray_in = 4'b1100; #10;
    if (binary_out !== 4'b1110) $display("FAIL: gray_in=1100, expected binary_out=1110, got %b", binary_out);

    gray_in = 4'b1101; #10;
    if (binary_out !== 4'b1111) $display("FAIL: gray_in=1101, expected binary_out=1111, got %b", binary_out);

    gray_in = 4'b1110; #10;
    if (binary_out !== 4'b1101) $display("FAIL: gray_in=1110, expected binary_out=1101, got %b", binary_out);

    gray_in = 4'b1111; #10;
    if (binary_out !== 4'b1000) $display("FAIL: gray_in=1111, expected binary_out=1000, got %b", binary_out);

    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule