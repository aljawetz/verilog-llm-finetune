`timescale 1ns/1ps

module tb_sevenSegDisplayDecoder;

reg [3:0] fourbit_in;
wire [6:0] sevenbit_out;

// Instantiate the module under test (uut)
sevenSegDisplayDecoder uut (
    .fourbit_in(fourbit_in),
    .sevenbit_out(sevenbit_out)
);

initial begin
    // Test all possible 4-bit inputs
    fourbit_in = 4'b0000; #10;
    if (sevenbit_out !== 7'b1000000) $display("FAIL: Input 0x0 expected 0x40, got %b", sevenbit_out);

    fourbit_in = 4'b0001; #10;
    if (sevenbit_out !== 7'b1001111) $display("FAIL: Input 0x1 expected 0x7A, got %b", sevenbit_out);

    fourbit_in = 4'b0010; #10;
    if (sevenbit_out !== 7'b0100100) $display("FAIL: Input 0x2 expected 0x34, got %b", sevenbit_out);

    fourbit_in = 4'b0011; #10;
    if (sevenbit_out !== 7'b0110000) $display("FAIL: Input 0x3 expected 0x30, got %b", sevenbit_out);

    fourbit_in = 4'b0100; #10;
    if (sevenbit_out !== 7'b0011001) $display("FAIL: Input 0x4 expected 0x19, got %b", sevenbit_out);

    fourbit_in = 4'b0101; #10;
    if (sevenbit_out !== 7'b0010010) $display("FAIL: Input 0x5 expected 0x12, got %b", sevenbit_out);

    fourbit_in = 4'b0110; #10;
    if (sevenbit_out !== 7'b0000010) $display("FAIL: Input 0x6 expected 0x02, got %b", sevenbit_out);

    fourbit_in = 4'b0111; #10;
    if (sevenbit_out !== 7'b1111000) $display("FAIL: Input 0x7 expected 0x78, got %b", sevenbit_out);

    fourbit_in = 4'b1000; #10;
    if (sevenbit_out !== 7'b0000000) $display("FAIL: Input 0x8 expected 0x00, got %b", sevenbit_out);

    fourbit_in = 4'b1001; #10;
    if (sevenbit_out !== 7'b0010000) $display("FAIL: Input 0x9 expected 0x20, got %b", sevenbit_out);

    fourbit_in = 4'b1010; #10;
    if (sevenbit_out !== 7'b0001000) $display("FAIL: Input 0xA expected 0x10, got %b", sevenbit_out);

    fourbit_in = 4'b1011; #10;
    if (sevenbit_out !== 7'b0000011) $display("FAIL: Input 0xB expected 0x03, got %b", sevenbit_out);

    fourbit_in = 4'b1100; #10;
    if (sevenbit_out !== 7'b1000110) $display("FAIL: Input 0xC expected 0x66, got %b", sevenbit_out);

    fourbit_in = 4'b1101; #10;
    if (sevenbit_out !== 7'b0100001) $display("FAIL: Input 0xD expected 0x41, got %b", sevenbit_out);

    fourbit_in = 4'b1110; #10;
    if (sevenbit_out !== 7'b0000110) $display("FAIL: Input 0xE expected 0x06, got %b", sevenbit_out);

    fourbit_in = 4'b1111; #10;
    if (sevenbit_out !== 7'b0001110) $display("FAIL: Input 0xF expected 0x0E, got %b", sevenbit_out);

    // If all tests pass
    $display("PASS");
    $finish;
end

endmodule