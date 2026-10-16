`timescale 1ns/1ps

module tb_encoder_8x3_new;

    reg [7:0] I;
    wire [2:0] y;

    // Instantiate the module under test
    encoder_8x3_new uut (
        .I(I),
        .y(y)
    );

    initial begin
        // Test case 1: Single input bit set (0)
        I = 8'b00000001; #10;
        if (y !== 3'b000) $display("FAIL: Test case 1 failed, expected 000, got %b", y);

        // Test case 2: Second input bit set (1)
        I = 8'b00000010; #10;
        if (y !== 3'b001) $display("FAIL: Test case 2 failed, expected 001, got %b", y);

        // Test case 3: Third input bit set (2)
        I = 8'b00000100; #10;
        if (y !== 3'b010) $display("FAIL: Test case 3 failed, expected 010, got %b", y);

        // Test case 4: Fourth input bit set (3)
        I = 8'b00001000; #10;
        if (y !== 3'b011) $display("FAIL: Test case 4 failed, expected 011, got %b", y);

        // Test case 5: Fifth input bit set (4)
        I = 8'b00010000; #10;
        if (y !== 3'b100) $display("FAIL: Test case 5 failed, expected 100, got %b", y);

        // Test case 6: Sixth input bit set (5)
        I = 8'b00100000; #10;
        if (y !== 3'b101) $display("FAIL: Test case 6 failed, expected 101, got %b", y);

        // Test case 7: Seventh input bit set (6)
        I = 8'b01000000; #10;
        if (y !== 3'b110) $display("FAIL: Test case 7 failed, expected 110, got %b", y);

        // Test case 8: Eighth input bit set (7)
        I = 8'b10000000; #10;
        if (y !== 3'b111) $display("FAIL: Test case 8 failed, expected 111, got %b", y);

        // Test case 9: Multiple bits set (should return the highest priority)
        I = 8'b11000000; #10;
        if (y !== 3'b111) $display("FAIL: Test case 9 failed, expected 111, got %b", y);

        // Test case 10: No bits set (default case)
        I = 8'b00000000; #10;
        if (y !== 3'bxxx) $display("FAIL: Test case 10 failed, expected xxx, got %b", y);

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule