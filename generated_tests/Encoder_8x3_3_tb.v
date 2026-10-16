`timescale 1ns/1ps

module tb_Encoder_8x3;

    reg [7:0] i;
    wire [2:0] b;

    // Instantiate the module under test
    Encoder_8x3 uut (
        .i(i),
        .b(b)
    );

    initial begin
        // Test case 1: Input is 00000001 (binary) -> Output should be 000 (0)
        i = 8'b00000001; #10;
        if (b !== 3'b000) $display("FAIL: Test case 1 failed, expected 000, got %b", b);

        // Test case 2: Input is 00000010 (binary) -> Output should be 001 (1)
        i = 8'b00000010; #10;
        if (b !== 3'b001) $display("FAIL: Test case 2 failed, expected 001, got %b", b);

        // Test case 3: Input is 00000100 (binary) -> Output should be 010 (2)
        i = 8'b00000100; #10;
        if (b !== 3'b010) $display("FAIL: Test case 3 failed, expected 010, got %b", b);

        // Test case 4: Input is 00001000 (binary) -> Output should be 011 (3)
        i = 8'b00001000; #10;
        if (b !== 3'b011) $display("FAIL: Test case 4 failed, expected 011, got %b", b);

        // Test case 5: Input is 00010000 (binary) -> Output should be 100 (4)
        i = 8'b00010000; #10;
        if (b !== 3'b100) $display("FAIL: Test case 5 failed, expected 100, got %b", b);

        // Test case 6: Input is 00100000 (binary) -> Output should be 101 (5)
        i = 8'b00100000; #10;
        if (b !== 3'b101) $display("FAIL: Test case 6 failed, expected 101, got %b", b);

        // Test case 7: Input is 01000000 (binary) -> Output should be 110 (6)
        i = 8'b01000000; #10;
        if (b !== 3'b110) $display("FAIL: Test case 7 failed, expected 110, got %b", b);

        // Test case 8: Input is 10000000 (binary) -> Output should be 111 (7)
        i = 8'b10000000; #10;
        if (b !== 3'b111) $display("FAIL: Test case 8 failed, expected 111, got %b", b);

        // Test case 9: Input is 11111111 (binary) -> Output should be 111 (7)
        i = 8'b11111111; #10;
        if (b !== 3'b111) $display("FAIL: Test case 9 failed, expected 111, got %b", b);

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule