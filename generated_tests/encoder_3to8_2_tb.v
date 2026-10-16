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
        // Test case 1: Only the first bit is high
        a = 8'b00000001; // Expect y = 3'b000
        #10;
        if (y !== 3'b000) $display("FAIL: Test case 1 failed, expected 000 but got %b", y);

        // Test case 2: Only the second bit is high
        a = 8'b00000010; // Expect y = 3'b000
        #10;
        if (y !== 3'b000) $display("FAIL: Test case 2 failed, expected 000 but got %b", y);

        // Test case 3: Only the third bit is high
        a = 8'b00000100; // Expect y = 3'b000
        #10;
        if (y !== 3'b000) $display("FAIL: Test case 3 failed, expected 000 but got %b", y);

        // Test case 4: Only the fourth bit is high
        a = 8'b00001000; // Expect y = 3'b000
        #10;
        if (y !== 3'b000) $display("FAIL: Test case 4 failed, expected 000 but got %b", y);

        // Test case 5: High bits in the upper half
        a = 8'b11110000; // Expect y = 3'b100
        #10;
        if (y !== 3'b100) $display("FAIL: Test case 5 failed, expected 100 but got %b", y);

        // Test case 6: High bits in the middle
        a = 8'b00001111; // Expect y = 3'b011
        #10;
        if (y !== 3'b011) $display("FAIL: Test case 6 failed, expected 011 but got %b", y);

        // Test case 7: High bits in the lower half
        a = 8'b11111111; // Expect y = 3'b111
        #10;
        if (y !== 3'b111) $display("FAIL: Test case 7 failed, expected 111 but got %b", y);

        // Test case 8: No bits high
        a = 8'b00000000; // Expect y = 3'b000
        #10;
        if (y !== 3'b000) $display("FAIL: Test case 8 failed, expected 000 but got %b", y);

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule