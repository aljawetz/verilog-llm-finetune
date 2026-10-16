`timescale 1ns/1ps

module tb_encoder_3to8;

    reg [7:0] a;
    wire [2:0] y;

    // Instantiate the module under test
    encoder_3to8 uut (
        .a(a),
        .y(y)
    );

    initial begin
        // Test case 1: Only the first bit is high
        a = 8'b00000001; // Expected output: 000
        #10;
        if (y !== 3'b000) $display("FAIL: Test case 1 failed, a = %b, y = %b", a, y);

        // Test case 2: Only the second bit is high
        a = 8'b00000010; // Expected output: 000
        #10;
        if (y !== 3'b000) $display("FAIL: Test case 2 failed, a = %b, y = %b", a, y);

        // Test case 3: Only the third bit is high
        a = 8'b00000100; // Expected output: 000
        #10;
        if (y !== 3'b000) $display("FAIL: Test case 3 failed, a = %b, y = %b", a, y);

        // Test case 4: Only the fourth bit is high
        a = 8'b00001000; // Expected output: 000
        #10;
        if (y !== 3'b000) $display("FAIL: Test case 4 failed, a = %b, y = %b", a, y);

        // Test case 5: Only the fifth bit is high
        a = 8'b00010000; // Expected output: 000
        #10;
        if (y !== 3'b000) $display("FAIL: Test case 5 failed, a = %b, y = %b", a, y);

        // Test case 6: Only the sixth bit is high
        a = 8'b00100000; // Expected output: 000
        #10;
        if (y !== 3'b000) $display("FAIL: Test case 6 failed, a = %b, y = %b", a, y);

        // Test case 7: Only the seventh bit is high
        a = 8'b01000000; // Expected output: 000
        #10;
        if (y !== 3'b000) $display("FAIL: Test case 7 failed, a = %b, y = %b", a, y);

        // Test case 8: Only the eighth bit is high
        a = 8'b10000000; // Expected output: 000
        #10;
        if (y !== 3'b000) $display("FAIL: Test case 8 failed, a = %b, y = %b", a, y);

        // Test case 9: Multiple bits high
        a = 8'b11111111; // Expected output: 111
        #10;
        if (y !== 3'b111) $display("FAIL: Test case 9 failed, a = %b, y = %b", a, y);

        // Test case 10: Mixed bits high
        a = 8'b10101010; // Expected output: 101
        #10;
        if (y !== 3'b101) $display("FAIL: Test case 10 failed, a = %b, y = %b", a, y);

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule