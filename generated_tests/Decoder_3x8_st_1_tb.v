`timescale 1ns/1ps

module tb_Decoder_3x8_st;

    reg [2:0] i;
    wire [7:0] y;

    // Instantiate the module under test (uut)
    Decoder_3x8_st uut (
        .y(y),
        .i(i)
    );

    initial begin
        // Test all input combinations
        // Expected outputs for each input
        // i = 3'b000 -> y = 8'b00000001
        // i = 3'b001 -> y = 8'b00000010
        // i = 3'b010 -> y = 8'b00000100
        // i = 3'b011 -> y = 8'b00001000
        // i = 3'b100 -> y = 8'b00010000
        // i = 3'b101 -> y = 8'b00100000
        // i = 3'b110 -> y = 8'b01000000
        // i = 3'b111 -> y = 8'b10000000

        // Test case 0
        i = 3'b000; #10;
        if (y !== 8'b00000001) $display("FAIL: Test case 0 failed, expected 00000001, got %b", y);

        // Test case 1
        i = 3'b001; #10;
        if (y !== 8'b00000010) $display("FAIL: Test case 1 failed, expected 00000010, got %b", y);

        // Test case 2
        i = 3'b010; #10;
        if (y !== 8'b00000100) $display("FAIL: Test case 2 failed, expected 00000100, got %b", y);

        // Test case 3
        i = 3'b011; #10;
        if (y !== 8'b00001000) $display("FAIL: Test case 3 failed, expected 00001000, got %b", y);

        // Test case 4
        i = 3'b100; #10;
        if (y !== 8'b00010000) $display("FAIL: Test case 4 failed, expected 00010000, got %b", y);

        // Test case 5
        i = 3'b101; #10;
        if (y !== 8'b00100000) $display("FAIL: Test case 5 failed, expected 00100000, got %b", y);

        // Test case 6
        i = 3'b110; #10;
        if (y !== 8'b01000000) $display("FAIL: Test case 6 failed, expected 01000000, got %b", y);

        // Test case 7
        i = 3'b111; #10;
        if (y !== 8'b10000000) $display("FAIL: Test case 7 failed, expected 10000000, got %b", y);

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule