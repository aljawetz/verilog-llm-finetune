`timescale 1ns/1ps

module tb_bcd_to_binary;

    reg [7:0] bcd;
    wire [3:0] binary;

    // Instantiate the module under test
    bcd_to_binary uut (
        .bcd(bcd),
        .binary(binary)
    );

    initial begin
        // Test case 1: BCD 0000 0000 (0 in binary)
        bcd = 8'b00000000; #10;
        if (binary !== 4'b0000) $display("FAIL: Test case 1 failed, expected 0000, got %b", binary);

        // Test case 2: BCD 0000 0001 (1 in binary)
        bcd = 8'b00000001; #10;
        if (binary !== 4'b0001) $display("FAIL: Test case 2 failed, expected 0001, got %b", binary);

        // Test case 3: BCD 0000 0010 (2 in binary)
        bcd = 8'b00000010; #10;
        if (binary !== 4'b0010) $display("FAIL: Test case 3 failed, expected 0010, got %b", binary);

        // Test case 4: BCD 0000 0011 (3 in binary)
        bcd = 8'b00000011; #10;
        if (binary !== 4'b0011) $display("FAIL: Test case 4 failed, expected 0011, got %b", binary);

        // Test case 5: BCD 0000 0100 (4 in binary)
        bcd = 8'b00000100; #10;
        if (binary !== 4'b0100) $display("FAIL: Test case 5 failed, expected 0100, got %b", binary);

        // Test case 6: BCD 0000 1000 (8 in binary)
        bcd = 8'b00001000; #10;
        if (binary !== 4'b1000) $display("FAIL: Test case 6 failed, expected 1000, got %b", binary);

        // Test case 7: BCD 0000 1001 (9 in binary)
        bcd = 8'b00001001; #10;
        if (binary !== 4'b1001) $display("FAIL: Test case 7 failed, expected 1001, got %b", binary);

        // Test case 8: BCD 0000 1010 (10 in binary, invalid BCD)
        bcd = 8'b00001010; #10;
        if (binary !== 4'b1010) $display("FAIL: Test case 8 failed, expected 1010, got %b", binary);

        // Test case 9: BCD 0000 1111 (15 in binary, invalid BCD)
        bcd = 8'b00001111; #10;
        if (binary !== 4'b1111) $display("FAIL: Test case 9 failed, expected 1111, got %b", binary);

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule