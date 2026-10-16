`timescale 1ns/1ps

module tb_decoder_3to8_b;

    reg a, b, c;
    wire [7:0] out;

    // Instantiate the module under test
    decoder_3to8_b uut (
        .a(a),
        .b(b),
        .c(c),
        .out(out)
    );

    initial begin
        // Test all combinations of a, b, c
        // Test case 1: a=0, b=0, c=0
        a = 0; b = 0; c = 0; #10;
        if (out !== 8'b00000001) begin
            $display("FAIL: Test case 1 failed, expected 00000001, got %b", out);
            $finish;
        end

        // Test case 2: a=0, b=0, c=1
        a = 0; b = 0; c = 1; #10;
        if (out !== 8'b00000010) begin
            $display("FAIL: Test case 2 failed, expected 00000010, got %b", out);
            $finish;
        end

        // Test case 3: a=0, b=1, c=0
        a = 0; b = 1; c = 0; #10;
        if (out !== 8'b00000100) begin
            $display("FAIL: Test case 3 failed, expected 00000100, got %b", out);
            $finish;
        end

        // Test case 4: a=0, b=1, c=1
        a = 0; b = 1; c = 1; #10;
        if (out !== 8'b00001000) begin
            $display("FAIL: Test case 4 failed, expected 00001000, got %b", out);
            $finish;
        end

        // Test case 5: a=1, b=0, c=0
        a = 1; b = 0; c = 0; #10;
        if (out !== 8'b00010000) begin
            $display("FAIL: Test case 5 failed, expected 00010000, got %b", out);
            $finish;
        end

        // Test case 6: a=1, b=0, c=1
        a = 1; b = 0; c = 1; #10;
        if (out !== 8'b00100000) begin
            $display("FAIL: Test case 6 failed, expected 00100000, got %b", out);
            $finish;
        end

        // Test case 7: a=1, b=1, c=0
        a = 1; b = 1; c = 0; #10;
        if (out !== 8'b01000000) begin
            $display("FAIL: Test case 7 failed, expected 01000000, got %b", out);
            $finish;
        end

        // Test case 8: a=1, b=1, c=1
        a = 1; b = 1; c = 1; #10;
        if (out !== 8'b10000000) begin
            $display("FAIL: Test case 8 failed, expected 10000000, got %b", out);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule