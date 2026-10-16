`timescale 1ns/1ps

module tb_sbox7;

    reg [1:6] addr;
    wire [1:4] dout;

    // Instantiate the module under test (uut)
    sbox7 uut (
        .addr(addr),
        .dout(dout)
    );

    initial begin
        // Test cases
        addr = 6'b000000; #10; // addr = 0
        if (dout !== 4'b0100) $display("FAIL: Expected dout = 4 for addr = 0, got dout = %b", dout);

        addr = 6'b000001; #10; // addr = 1
        if (dout !== 4'b1011) $display("FAIL: Expected dout = 11 for addr = 1, got dout = %b", dout);

        addr = 6'b000010; #10; // addr = 2
        if (dout !== 4'b0010) $display("FAIL: Expected dout = 2 for addr = 2, got dout = %b", dout);

        addr = 6'b000011; #10; // addr = 3
        if (dout !== 4'b1110) $display("FAIL: Expected dout = 14 for addr = 3, got dout = %b", dout);

        addr = 6'b000100; #10; // addr = 4
        if (dout !== 4'b1111) $display("FAIL: Expected dout = 15 for addr = 4, got dout = %b", dout);

        addr = 6'b000101; #10; // addr = 5
        if (dout !== 4'b0000) $display("FAIL: Expected dout = 0 for addr = 5, got dout = %b", dout);

        addr = 6'b000110; #10; // addr = 6
        if (dout !== 4'b1000) $display("FAIL: Expected dout = 8 for addr = 6, got dout = %b", dout);

        addr = 6'b000111; #10; // addr = 7
        if (dout !== 4'b1101) $display("FAIL: Expected dout = 13 for addr = 7, got dout = %b", dout);

        addr = 6'b001000; #10; // addr = 8
        if (dout !== 4'b0011) $display("FAIL: Expected dout = 3 for addr = 8, got dout = %b", dout);

        addr = 6'b001001; #10; // addr = 9
        if (dout !== 4'b1100) $display("FAIL: Expected dout = 12 for addr = 9, got dout = %b", dout);

        addr = 6'b001010; #10; // addr = 10
        if (dout !== 4'b1001) $display("FAIL: Expected dout = 9 for addr = 10, got dout = %b", dout);

        addr = 6'b001011; #10; // addr = 11
        if (dout !== 4'b0111) $display("FAIL: Expected dout = 7 for addr = 11, got dout = %b", dout);

        addr = 6'b001100; #10; // addr = 12
        if (dout !== 4'b0101) $display("FAIL: Expected dout = 5 for addr = 12, got dout = %b", dout);

        addr = 6'b001101; #10; // addr = 13
        if (dout !== 4'b1010) $display("FAIL: Expected dout = 10 for addr = 13, got dout = %b", dout);

        addr = 6'b001110; #10; // addr = 14
        if (dout !== 4'b0110) $display("FAIL: Expected dout = 6 for addr = 14, got dout = %b", dout);

        addr = 6'b001111; #10; // addr = 15
        if (dout !== 4'b0001) $display("FAIL: Expected dout = 1 for addr = 15, got dout = %b", dout);

        // Additional tests for higher addresses
        addr = 6'b010000; #10; // addr = 16
        if (dout !== 4'b1101) $display("FAIL: Expected dout = 13 for addr = 16, got dout = %b", dout);

        addr = 6'b010001; #10; // addr = 17
        if (dout !== 4'b0000) $display("FAIL: Expected dout = 0 for addr = 17, got dout = %b", dout);

        addr = 6'b010010; #10; // addr = 18
        if (dout !== 4'b1011) $display("FAIL: Expected dout = 11 for addr = 18, got dout = %b", dout);

        addr = 6'b010011; #10; // addr = 19
        if (dout !== 4'b0111) $display("FAIL: Expected dout = 7 for addr = 19, got dout = %b", dout);

        addr = 6'b010100; #10; // addr = 20
        if (dout !== 4'b0100) $display("FAIL: Expected dout = 4 for addr = 20, got dout = %b", dout);

        addr = 6'b010101; #10; // addr = 21
        if (dout !== 4'b1001) $display("FAIL: Expected dout = 9 for addr = 21, got dout = %b", dout);

        addr = 6'b010110; #10; // addr = 22
        if (dout !== 4'b0001) $display("FAIL: Expected dout = 1 for addr = 22, got dout = %b", dout);

        addr = 6'b010111; #10; // addr = 23
        if (dout !== 4'b1010) $display("FAIL: Expected dout = 10 for addr = 23, got dout = %b", dout);

        addr = 6'b011000; #10; // addr = 24
        if (dout !== 4'b1110) $display("FAIL: Expected dout = 14 for addr = 24, got dout = %b", dout);

        addr = 6'b011001; #10; // addr = 25
        if (dout !== 4'b0011) $display("FAIL: Expected dout = 3 for addr = 25, got dout = %b", dout);

        addr = 6'b011010; #10; // addr = 26
        if (dout !== 4'b0101) $display("FAIL: Expected dout = 5 for addr = 26, got dout = %b", dout);

        addr = 6'b011011; #10; // addr = 27
        if (dout !== 4'b1100) $display("FAIL: Expected dout = 12 for addr = 27, got dout = %b", dout);

        addr = 6'b011100; #10; // addr = 28
        if (dout !== 4'b0010) $display("FAIL: Expected dout = 2 for addr = 28, got dout = %b", dout);

        addr = 6'b011101; #10; // addr = 29
        if (dout !== 4'b1111) $display("FAIL: Expected dout = 15 for addr = 29, got dout = %b", dout);

        addr = 6'b011110; #10; // addr = 30
        if (dout !== 4'b1000) $display("FAIL: Expected dout = 8 for addr = 30, got dout = %b", dout);

        addr = 6'b011111; #10; // addr = 31
        if (dout !== 4'b0110) $display("FAIL: Expected dout = 6 for addr = 31, got dout = %b", dout);

        // Final check
        $display("PASS");
        $finish;
    end

endmodule