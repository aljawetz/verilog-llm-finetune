`timescale 1ns/1ps

module tb_encoder8to3S;

    reg [7:0] i;
    wire [2:0] y;

    // Instantiate the module under test (uut)
    encoder8to3S uut (
        .i(i),
        .y(y)
    );

    initial begin
        // Test case 1: Only the first bit is high
        i = 8'b00000001; // Expect y = 3'b000
        #10;
        if (y !== 3'b000) $display("FAIL: Test case 1 failed, expected 000, got %b", y);

        // Test case 2: Second bit is high
        i = 8'b00000010; // Expect y = 3'b001
        #10;
        if (y !== 3'b001) $display("FAIL: Test case 2 failed, expected 001, got %b", y);

        // Test case 3: Third bit is high
        i = 8'b00000100; // Expect y = 3'b010
        #10;
        if (y !== 3'b010) $display("FAIL: Test case 3 failed, expected 010, got %b", y);

        // Test case 4: Fourth bit is high
        i = 8'b00001000; // Expect y = 3'b011
        #10;
        if (y !== 3'b011) $display("FAIL: Test case 4 failed, expected 011, got %b", y);

        // Test case 5: Fifth bit is high
        i = 8'b00010000; // Expect y = 3'b100
        #10;
        if (y !== 3'b100) $display("FAIL: Test case 5 failed, expected 100, got %b", y);

        // Test case 6: Sixth bit is high
        i = 8'b00100000; // Expect y = 3'b101
        #10;
        if (y !== 3'b101) $display("FAIL: Test case 6 failed, expected 101, got %b", y);

        // Test case 7: Seventh bit is high
        i = 8'b01000000; // Expect y = 3'b110
        #10;
        if (y !== 3'b110) $display("FAIL: Test case 7 failed, expected 110, got %b", y);

        // Test case 8: Eighth bit is high
        i = 8'b10000000; // Expect y = 3'b111
        #10;
        if (y !== 3'b111) $display("FAIL: Test case 8 failed, expected 111, got %b", y);

        // Test case 9: Multiple bits high (e.g., 5th and 7th)
        i = 8'b10100000; // Expect y = 3'b111
        #10;
        if (y !== 3'b111) $display("FAIL: Test case 9 failed, expected 111, got %b", y);

        // Test case 10: All bits low
        i = 8'b00000000; // Expect y = 3'b000
        #10;
        if (y !== 3'b000) $display("FAIL: Test case 10 failed, expected 000, got %b", y);

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule