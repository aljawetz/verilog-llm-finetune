`timescale 1ns/1ps

module tb_encoder_3to8;

    reg [7:0] a;
    wire [2:0] y;

    // Instantiate the module under test (uut)
    encoder_3to8 uut (
        .a(a),
        .y(y)
    );

    initial begin
        // Test case 1: Only the first bit is high (00000001)
        a = 8'b00000001; #10;
        if (y !== 3'b000) $display("FAIL: Test case 1 failed, expected 000, got %b", y);

        // Test case 2: Second bit is high (00000010)
        a = 8'b00000010; #10;
        if (y !== 3'b001) $display("FAIL: Test case 2 failed, expected 001, got %b", y);

        // Test case 3: Third bit is high (00000100)
        a = 8'b00000100; #10;
        if (y !== 3'b010) $display("FAIL: Test case 3 failed, expected 010, got %b", y);

        // Test case 4: Fourth bit is high (00001000)
        a = 8'b00001000; #10;
        if (y !== 3'b011) $display("FAIL: Test case 4 failed, expected 011, got %b", y);

        // Test case 5: Fifth bit is high (00010000)
        a = 8'b00010000; #10;
        if (y !== 3'b100) $display("FAIL: Test case 5 failed, expected 100, got %b", y);

        // Test case 6: Sixth bit is high (00100000)
        a = 8'b00100000; #10;
        if (y !== 3'b101) $display("FAIL: Test case 6 failed, expected 101, got %b", y);

        // Test case 7: Seventh bit is high (01000000)
        a = 8'b01000000; #10;
        if (y !== 3'b110) $display("FAIL: Test case 7 failed, expected 110, got %b", y);

        // Test case 8: Eighth bit is high (10000000)
        a = 8'b10000000; #10;
        if (y !== 3'b111) $display("FAIL: Test case 8 failed, expected 111, got %b", y);

        // Test case 9: Multiple bits high (11111111)
        a = 8'b11111111; #10;
        if (y !== 3'b111) $display("FAIL: Test case 9 failed, expected 111, got %b", y);

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule