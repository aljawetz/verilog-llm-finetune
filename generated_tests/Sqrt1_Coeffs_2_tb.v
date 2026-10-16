`timescale 1ns/1ps

module tb_Sqrt1_Coeffs;

reg [5:0] address;
wire [31:0] data;

// Instantiate the module under test
Sqrt1_Coeffs uut (
    .address(address),
    .data(data)
);

initial begin
    // Test all address values from 0 to 63
    address = 6'b000000; // Start with address 0
    #10; // Wait for data to settle
    if (data !== 32'b00010110100000101101011011100010) begin
        $display("FAIL: Address 0 data mismatch");
        $finish;
    end

    address = 6'b000001; // Address 1
    #10;
    if (data !== 32'b00010110010100101101110001111111) begin
        $display("FAIL: Address 1 data mismatch");
        $finish;
    end

    address = 6'b000010; // Address 2
    #10;
    if (data !== 32'b00010110001100101110001000010001) begin
        $display("FAIL: Address 2 data mismatch");
        $finish;
    end

    address = 6'b000011; // Address 3
    #10;
    if (data !== 32'b00010110000000101110011110011000) begin
        $display("FAIL: Address 3 data mismatch");
        $finish;
    end

    address = 6'b000100; // Address 4
    #10;
    if (data !== 32'b00010101110100101110110100010101) begin
        $display("FAIL: Address 4 data mismatch");
        $finish;
    end

    address = 6'b000101; // Address 5
    #10;
    if (data !== 32'b00010101101100101111001010001000) begin
        $display("FAIL: Address 5 data mismatch");
        $finish;
    end

    address = 6'b000110; // Address 6
    #10;
    if (data !== 32'b00010101100000101111011111110001) begin
        $display("FAIL: Address 6 data mismatch");
        $finish;
    end

    address = 6'b000111; // Address 7
    #10;
    if (data !== 32'b00010101011000101111110101010000) begin
        $display("FAIL: Address 7 data mismatch");
        $finish;
    end

    address = 6'b001000; // Address 8
    #10;
    if (data !== 32'b00010101010000110000001010100101) begin
        $display("FAIL: Address 8 data mismatch");
        $finish;
    end

    address = 6'b001001; // Address 9
    #10;
    if (data !== 32'b00010101000100110000011111110001) begin
        $display("FAIL: Address 9 data mismatch");
        $finish;
    end

    address = 6'b001010; // Address 10
    #10;
    if (data !== 32'b00010100111100110000110100110100) begin
        $display("FAIL: Address 10 data mismatch");
        $finish;
    end

    address = 6'b001011; // Address 11
    #10;
    if (data !== 32'b00010100110100110001001001101110) begin
        $display("FAIL: Address 11 data mismatch");
        $finish;
    end

    address = 6'b001100; // Address 12
    #10;
    if (data !== 32'b00010100101100110001011110011111) begin
        $display("FAIL: Address 12 data mismatch");
        $finish;
    end

    address = 6'b001101; // Address 13
    #10;
    if (data !== 32'b00010100100100110001110011000111) begin
        $display("FAIL: Address 13 data mismatch");
        $finish;
    end

    address = 6'b001110; // Address 14
    #10;
    if (data !== 32'b00010100011000110010000111100111) begin
        $display("FAIL: Address 14 data mismatch");
        $finish;
    end

    address = 6'b001111; // Address 15
    #10;
    if (data !== 32'b00010100010000110010011011111111) begin
        $display("FAIL: Address 15 data mismatch");
        $finish;
    end

    address = 6'b010000; // Address 16
    #10;
    if (data !== 32'b00010100001000110010110000001110) begin
        $display("FAIL: Address 16 data mismatch");
        $finish;
    end

    address = 6'b010001; // Address 17
    #10;
    if (data !== 32'b00010100000000110011000100010101) begin
        $display("FAIL: Address 17 data mismatch");
        $finish;
    end

    address = 6'b010010; // Address 18
    #10;
    if (data !== 32'b00010011111000110011011000010101) begin
        $display("FAIL: Address 18 data mismatch");
        $finish;
    end

    address = 6'b010011; // Address 19
    #10;
    if (data !== 32'b00010011110000110011101100001101) begin
        $display("FAIL: Address 19 data mismatch");
        $finish;
    end

    address = 6'b010100; // Address 20
    #10;
    if (data !== 32'b00010011101100110011111111111101) begin
        $display("FAIL: Address 20 data mismatch");
        $finish;
    end

    address = 6'b010101; // Address 21
    #10;
    if (data !== 32'b00010011100100110100010011100101) begin
        $display("FAIL: Address 21 data mismatch");
        $finish;
    end

    address = 6'b010110; // Address 22
    #10;
    if (data !== 32'b00010011011100110100100111000111) begin
        $display("FAIL: Address 22 data mismatch");
        $finish;
    end

    address = 6'b010111; // Address 23
    #10;
    if (data !== 32'b00010011010100110100111010100001) begin
        $display("FAIL: Address 23 data mismatch");
        $finish;
    end

    address = 6'b011000; // Address 24
    #10;
    if (data !== 32'b00010011001100110101001101110100) begin
        $display("FAIL: Address 24 data mismatch");
        $finish;
    end

    address = 6'b011001; // Address 25
    #10;
    if (data !== 32'b00010011001000110101100001000000) begin
        $display("FAIL: Address 25 data mismatch");
        $finish;
    end

    address = 6'b011010; // Address 26
    #10;
    if (data !== 32'b00010011000000110101110100000101) begin
        $display("FAIL: Address 26 data mismatch");
        $finish;
    end

    address = 6'b011011; // Address 27
    #10;
    if (data !== 32'b00010010111000110110000111000100) begin
        $display("FAIL: Address 27 data mismatch");
        $finish;
    end

    address = 6'b011100; // Address 28
    #10;
    if (data !== 32'b00010010110100110110011001111100) begin
        $display("FAIL: Address 28 data mismatch");
        $finish;
    end

    address = 6'b011101; // Address 29
    #10;
    if (data !== 32'b00010010101100110110101100101101) begin
        $display("FAIL: Address 29 data mismatch");
        $finish;
    end

    address = 6'b011110; // Address 30
    #10;
    if (data !== 32'b00010010100100110110111111011000) begin
        $display("FAIL: Address 30 data mismatch");
        $finish;
    end

    address = 6'b011111; // Address 31
    #10;
    if (data !== 32'b00010010100000110111010001111101) begin
        $display("FAIL: Address 31 data mismatch");
        $finish;
    end

    address = 6'b100000; // Address 32
    #10;
    if (data !== 32'b00010010011000110111100100011011) begin
        $display("FAIL: Address 32 data mismatch");
        $finish;
    end

    address = 6'b100001; // Address 33
    #10;
    if (data !== 32'b00010010010100110111110110110011) begin
        $display("FAIL: Address 33 data mismatch");
        $finish;
    end

    address = 6'b100010; // Address 34
    #10;
    if (data !== 32'b00010010001100111000001001000110) begin
        $display("FAIL: Address 34 data mismatch");
        $finish;
    end

    address = 6'b100011; // Address 35
    #10;
    if (data !== 32'b00010010001000111000011011010010) begin
        $display("FAIL: Address 35 data mismatch");
        $finish;
    end

    address = 6'b100100; // Address 36
    #10;
    if (data !== 32'b00010010000000111000101101011001) begin
        $display("FAIL: Address 36 data mismatch");
        $finish;
    end

    address = 6'b100101; // Address 37
    #10;
    if (data !== 32'b00010001111100111000111111011001) begin
        $display("FAIL: Address 37 data mismatch");
        $finish;
    end

    address = 6'b100110; // Address 38
    #10;
    if (data !== 32'b00010001111000111001010001010101) begin
        $display("FAIL: Address 38 data mismatch");
        $finish;
    end

    address = 6'b100111; // Address 39
    #10;
    if (data !== 32'b00010001110000111001100011001010) begin
        $display("FAIL: Address 39 data mismatch");
        $finish;
    end

    address = 6'b101000; // Address 40
    #10;
    if (data !== 32'b00010001101100111001110100111010) begin
        $display("FAIL: Address 40 data mismatch");
        $finish;
    end

    address = 6'b101001; // Address 41
    #10;
    if (data !== 32'b00010001100100111010000110100101) begin
        $display("FAIL: Address 41 data mismatch");
        $finish;
    end

    address = 6'b101010; // Address 42
    #10;
    if (data !== 32'b00010001100000111010011000001010) begin
        $display("FAIL: Address 42 data mismatch");
        $finish;
    end

    address = 6'b101011; // Address 43
    #10;
    if (data !== 32'b00010001011100111010101001101010) begin
        $display("FAIL: Address 43 data mismatch");
        $finish;
    end

    address = 6'b101100; // Address 44
    #10;
    if (data !== 32'b00010001011000111010111011000101) begin
        $display("FAIL: Address 44 data mismatch");
        $finish;
    end

    address = 6'b101101; // Address 45
    #10;
    if (data !== 32'b00010001010000111011001100011011) begin
        $display("FAIL: Address 45 data mismatch");
        $finish;
    end

    address = 6'b101110; // Address 46
    #10;
    if (data !== 32'b00010001001100111011011101101011) begin
        $display("FAIL: Address 46 data mismatch");
        $finish;
    end

    address = 6'b101111; // Address 47
    #10;
    if (data !== 32'b00010001001000111011101110110111) begin
        $display("FAIL: Address 47 data mismatch");
        $finish;
    end

    address = 6'b110000; // Address 48
    #10;
    if (data !== 32'b00010001000100111011111111111110) begin
        $display("FAIL: Address 48 data mismatch");
        $finish;
    end

    address = 6'b110001; // Address 49
    #10;
    if (data !== 32'b00010000111100111100010001000000) begin
        $display("FAIL: Address 49 data mismatch");
        $finish;
    end

    address = 6'b110010; // Address 50
    #10;
    if (data !== 32'b00010000111000111100100001111101) begin
        $display("FAIL: Address 50 data mismatch");
        $finish;
    end

    address = 6'b110011; // Address 51
    #10;
    if (data !== 32'b00010000110100111100110010110101) begin
        $display("FAIL: Address 51 data mismatch");
        $finish;
    end

    address = 6'b110100; // Address 52
    #10;
    if (data !== 32'b00010000110000111101000011101001) begin
        $display("FAIL: Address 52 data mismatch");
        $finish;
    end

    address = 6'b110101; // Address 53
    #10;
    if (data !== 32'b00010000101100111101010100011000) begin
        $display("FAIL: Address 53 data mismatch");
        $finish;
    end

    address = 6'b110110; // Address 54
    #10;
    if (data !== 32'b00010000101000111101100101000010) begin
        $display("FAIL: Address 54 data mismatch");
        $finish;
    end

    address = 6'b110111; // Address 55
    #10;
    if (data !== 32'b00010000100000111101110101101000) begin
        $display("FAIL: Address 55 data mismatch");
        $finish;
    end

    address = 6'b111000; // Address 56
    #10;
    if (data !== 32'b00010000011100111110000110001010) begin
        $display("FAIL: Address 56 data mismatch");
        $finish;
    end

    address = 6'b111001; // Address 57
    #10;
    if (data !== 32'b00010000011000111110010110100111) begin
        $display("FAIL: Address 57 data mismatch");
        $finish;
    end

    address = 6'b111010; // Address 58
    #10;
    if (data !== 32'b00010000010100111110100111000000) begin
        $display("FAIL: Address 58 data mismatch");
        $finish;
    end

    address = 6'b111011; // Address 59
    #10;
    if (data !== 32'b00010000010000111110110111010101) begin
        $display("FAIL: Address 59 data mismatch");
        $finish;
    end

    address = 6'b111100; // Address 60
    #10;
    if (data !== 32'b00010000001100111111000111100101) begin
        $display("FAIL: Address 60 data mismatch");
        $finish;
    end

    address = 6'b111101; // Address 61
    #10;
    if (data !== 32'b00010000001000111111010111110001) begin
        $display("FAIL: Address 61 data mismatch");
        $finish;
    end

    address = 6'b111110; // Address 62
    #10;
    if (data !== 32'b00010000000100111111100111111001) begin
        $display("FAIL: Address 62 data mismatch");
        $finish;
    end

    address = 6'b111111; // Address 63
    #10;
    if (data !== 32'b00010000000000111111110111111101) begin
        $display("FAIL: Address 63 data mismatch");
        $finish;
    end

    $display("PASS");
    $finish;
end

endmodule