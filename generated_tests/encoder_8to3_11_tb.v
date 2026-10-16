`timescale 1ns/1ps

module tb_encoder_8to3;

    reg [7:0] in;
    wire [2:0] out;

    // Instantiate the module under test
    encoder_8to3 uut (
        .in(in),
        .out(out)
    );

    initial begin
        // Test case 1: Single bit set (0)
        in = 8'b0000_0001; #10;
        if (out !== 3'b000) $display("FAIL: Test case 1 failed, expected 000, got %b", out);

        // Test case 2: Single bit set (1)
        in = 8'b0000_0010; #10;
        if (out !== 3'b001) $display("FAIL: Test case 2 failed, expected 001, got %b", out);

        // Test case 3: Single bit set (2)
        in = 8'b0000_0100; #10;
        if (out !== 3'b010) $display("FAIL: Test case 3 failed, expected 010, got %b", out);

        // Test case 4: Single bit set (3)
        in = 8'b0000_1000; #10;
        if (out !== 3'b011) $display("FAIL: Test case 4 failed, expected 011, got %b", out);

        // Test case 5: Single bit set (4)
        in = 8'b0001_0000; #10;
        if (out !== 3'b100) $display("FAIL: Test case 5 failed, expected 100, got %b", out);

        // Test case 6: Single bit set (5)
        in = 8'b0010_0000; #10;
        if (out !== 3'b101) $display("FAIL: Test case 6 failed, expected 101, got %b", out);

        // Test case 7: Single bit set (6)
        in = 8'b0100_0000; #10;
        if (out !== 3'b110) $display("FAIL: Test case 7 failed, expected 110, got %b", out);

        // Test case 8: Single bit set (7)
        in = 8'b1000_0000; #10;
        if (out !== 3'b111) $display("FAIL: Test case 8 failed, expected 111, got %b", out);

        // Test case 9: Invalid input (multiple bits set)
        in = 8'b0000_0011; #10;
        if (out !== 3'bxxx) $display("FAIL: Test case 9 failed, expected xxx, got %b", out);

        // Test case 10: Invalid input (no bits set)
        in = 8'b0000_0000; #10;
        if (out !== 3'bxxx) $display("FAIL: Test case 10 failed, expected xxx, got %b", out);

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule