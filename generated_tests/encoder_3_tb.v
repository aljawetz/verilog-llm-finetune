`timescale 1ns/1ps

module tb_encoder;

    reg [7:0] in;
    wire [2:0] out;

    // Instantiate the encoder module
    encoder uut (
        .in(in),
        .out(out)
    );

    initial begin
        // Test case 1: Valid input
        in = 8'b00000001; #10;
        if (out !== 3'b000) $display("FAIL: Test case 1 failed, expected 000, got %b", out);

        // Test case 2: Valid input
        in = 8'b00000010; #10;
        if (out !== 3'b001) $display("FAIL: Test case 2 failed, expected 001, got %b", out);

        // Test case 3: Valid input
        in = 8'b00000100; #10;
        if (out !== 3'b010) $display("FAIL: Test case 3 failed, expected 010, got %b", out);

        // Test case 4: Valid input
        in = 8'b00001000; #10;
        if (out !== 3'b011) $display("FAIL: Test case 4 failed, expected 011, got %b", out);

        // Test case 5: Valid input
        in = 8'b00010000; #10;
        if (out !== 3'b100) $display("FAIL: Test case 5 failed, expected 100, got %b", out);

        // Test case 6: Valid input
        in = 8'b00100000; #10;
        if (out !== 3'b101) $display("FAIL: Test case 6 failed, expected 101, got %b", out);

        // Test case 7: Valid input
        in = 8'b01000000; #10;
        if (out !== 3'b110) $display("FAIL: Test case 7 failed, expected 110, got %b", out);

        // Test case 8: Valid input
        in = 8'b10000000; #10;
        if (out !== 3'b111) $display("FAIL: Test case 8 failed, expected 111, got %b", out);

        // Test case 9: Invalid input (multiple bits set)
        in = 8'b00000011; #10;
        if (out !== 3'bxxx) $display("FAIL: Test case 9 failed, expected xxx, got %b", out);

        // Test case 10: Invalid input (no bits set)
        in = 8'b00000000; #10;
        if (out !== 3'bxxx) $display("FAIL: Test case 10 failed, expected xxx, got %b", out);

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule