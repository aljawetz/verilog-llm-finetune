`timescale 1ns/1ps

module tb_encoder_8_3;

    reg [7:0] in;
    wire [2:0] out;

    // Instantiate the module under test (uut)
    encoder_8_3 uut (
        .in(in),
        .out(out)
    );

    initial begin
        // Test case 1: Only the highest bit is active
        in = 8'b10000000; // Expected output: 3'b111
        #10;
        if (out !== 3'b111) $display("FAIL: Test case 1 failed, expected 3'b111 but got %b", out);

        // Test case 2: Second highest bit is active
        in = 8'b01000000; // Expected output: 3'b110
        #10;
        if (out !== 3'b110) $display("FAIL: Test case 2 failed, expected 3'b110 but got %b", out);

        // Test case 3: Middle bit is active
        in = 8'b00100000; // Expected output: 3'b101
        #10;
        if (out !== 3'b101) $display("FAIL: Test case 3 failed, expected 3'b101 but got %b", out);

        // Test case 4: Lower middle bit is active
        in = 8'b00010000; // Expected output: 3'b100
        #10;
        if (out !== 3'b100) $display("FAIL: Test case 4 failed, expected 3'b100 but got %b", out);

        // Test case 5: Lower bit is active
        in = 8'b00001000; // Expected output: 3'b011
        #10;
        if (out !== 3'b011) $display("FAIL: Test case 5 failed, expected 3'b011 but got %b", out);

        // Test case 6: Second lowest bit is active
        in = 8'b00000100; // Expected output: 3'b010
        #10;
        if (out !== 3'b010) $display("FAIL: Test case 6 failed, expected 3'b010 but got %b", out);

        // Test case 7: Second lowest bit is active
        in = 8'b00000010; // Expected output: 3'b001
        #10;
        if (out !== 3'b001) $display("FAIL: Test case 7 failed, expected 3'b001 but got %b", out);

        // Test case 8: No bits are active
        in = 8'b00000000; // Expected output: 3'b000
        #10;
        if (out !== 3'b000) $display("FAIL: Test case 8 failed, expected 3'b000 but got %b", out);

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule