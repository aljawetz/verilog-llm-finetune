`timescale 1ns/1ps

module tb_encoder8_3;

    reg [7:0] d;
    wire [2:0] y;

    // Instantiate the module under test (uut)
    encoder8_3 uut (
        .d(d),
        .y(y)
    );

    initial begin
        // Test case 1: Input = 00000000, Expected Output = 000
        d = 8'b00000000;
        #10;
        if (y !== 3'b000) $display("FAIL: Test case 1 failed, expected 000 but got %b", y);

        // Test case 2: Input = 00000001, Expected Output = 000
        d = 8'b00000001;
        #10;
        if (y !== 3'b000) $display("FAIL: Test case 2 failed, expected 000 but got %b", y);

        // Test case 3: Input = 00000010, Expected Output = 000
        d = 8'b00000010;
        #10;
        if (y !== 3'b000) $display("FAIL: Test case 3 failed, expected 000 but got %b", y);

        // Test case 4: Input = 00000100, Expected Output = 000
        d = 8'b00000100;
        #10;
        if (y !== 3'b000) $display("FAIL: Test case 4 failed, expected 000 but got %b", y);

        // Test case 5: Input = 00001000, Expected Output = 000
        d = 8'b00001000;
        #10;
        if (y !== 3'b000) $display("FAIL: Test case 5 failed, expected 000 but got %b", y);

        // Test case 6: Input = 00010000, Expected Output = 000
        d = 8'b00010000;
        #10;
        if (y !== 3'b000) $display("FAIL: Test case 6 failed, expected 000 but got %b", y);

        // Test case 7: Input = 00100000, Expected Output = 000
        d = 8'b00100000;
        #10;
        if (y !== 3'b000) $display("FAIL: Test case 7 failed, expected 000 but got %b", y);

        // Test case 8: Input = 01000000, Expected Output = 000
        d = 8'b01000000;
        #10;
        if (y !== 3'b000) $display("FAIL: Test case 8 failed, expected 000 but got %b", y);

        // Test case 9: Input = 10000000, Expected Output = 000
        d = 8'b10000000;
        #10;
        if (y !== 3'b000) $display("FAIL: Test case 9 failed, expected 000 but got %b", y);

        // Test case 10: Input = 11111111, Expected Output = 111
        d = 8'b11111111;
        #10;
        if (y !== 3'b111) $display("FAIL: Test case 10 failed, expected 111 but got %b", y);

        // Test case 11: Input = 01111111, Expected Output = 111
        d = 8'b01111111;
        #10;
        if (y !== 3'b111) $display("FAIL: Test case 11 failed, expected 111 but got %b", y);

        // Test case 12: Input = 00001111, Expected Output = 111
        d = 8'b00001111;
        #10;
        if (y !== 3'b111) $display("FAIL: Test case 12 failed, expected 111 but got %b", y);

        // Test case 13: Input = 00011111, Expected Output = 111
        d = 8'b00011111;
        #10;
        if (y !== 3'b111) $display("FAIL: Test case 13 failed, expected 111 but got %b", y);

        // Test case 14: Input = 00111111, Expected Output = 111
        d = 8'b00111111;
        #10;
        if (y !== 3'b111) $display("FAIL: Test case 14 failed, expected 111 but got %b", y);

        // Test case 15: Input = 01111111, Expected Output = 111
        d = 8'b01111111;
        #10;
        if (y !== 3'b111) $display("FAIL: Test case 15 failed, expected 111 but got %b", y);

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule