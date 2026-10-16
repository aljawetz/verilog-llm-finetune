`timescale 1ns/1ps

module tb_bcd_to_bin;
    reg [7:0] bcd;
    wire [3:0] bin;

    // Instantiate the module under test (uut)
    bcd_to_bin uut (
        .bcd(bcd),
        .bin(bin)
    );

    initial begin
        // Test case 1: BCD 0000 0000 (0 in binary)
        bcd = 8'b00000000; #10;
        if (bin !== 4'b0000) $display("FAIL: Expected 0000 for BCD 0000 0000, got %b", bin);

        // Test case 2: BCD 0000 0001 (1 in binary)
        bcd = 8'b00000001; #10;
        if (bin !== 4'b0001) $display("FAIL: Expected 0001 for BCD 0000 0001, got %b", bin);

        // Test case 3: BCD 0000 0010 (2 in binary)
        bcd = 8'b00000010; #10;
        if (bin !== 4'b0010) $display("FAIL: Expected 0010 for BCD 0000 0010, got %b", bin);

        // Test case 4: BCD 0000 0011 (3 in binary)
        bcd = 8'b00000011; #10;
        if (bin !== 4'b0011) $display("FAIL: Expected 0011 for BCD 0000 0011, got %b", bin);

        // Test case 5: BCD 0000 0100 (4 in binary)
        bcd = 8'b00000100; #10;
        if (bin !== 4'b0100) $display("FAIL: Expected 0100 for BCD 0000 0100, got %b", bin);

        // Test case 6: BCD 0000 1000 (8 in binary)
        bcd = 8'b00001000; #10;
        if (bin !== 4'b1000) $display("FAIL: Expected 1000 for BCD 0000 1000, got %b", bin);

        // Test case 7: BCD 0000 1001 (9 in binary)
        bcd = 8'b00001001; #10;
        if (bin !== 4'b1001) $display("FAIL: Expected 1001 for BCD 0000 1001, got %b", bin);

        // Test case 8: BCD 0000 1010 (10 in binary, should not be valid BCD)
        bcd = 8'b00001010; #10;
        if (bin !== 4'b1010) $display("FAIL: Expected 1010 for BCD 0000 1010, got %b", bin);

        // Test case 9: BCD 0000 1111 (15 in binary, should not be valid BCD)
        bcd = 8'b00001111; #10;
        if (bin !== 4'b1111) $display("FAIL: Expected 1111 for BCD 0000 1111, got %b", bin);

        // If all tests pass
        $display("PASS");
        $finish;
    end
endmodule