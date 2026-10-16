`timescale 1ns/1ps

module tb_decoder_3to8_b;

    reg a, b, c;
    wire [7:0] out;

    // Instantiate the module under test (uut)
    decoder_3to8_b uut (
        .a(a),
        .b(b),
        .c(c),
        .out(out)
    );

    initial begin
        // Test all combinations of a, b, c
        // Expected outputs are checked against the actual outputs
        a = 0; b = 0; c = 0; #10;
        if (out !== 8'b00000001) begin
            $display("FAIL: Expected 8'b00000001 for input 3'b000, got %b", out);
            $finish;
        end

        a = 0; b = 0; c = 1; #10;
        if (out !== 8'b00000010) begin
            $display("FAIL: Expected 8'b00000010 for input 3'b001, got %b", out);
            $finish;
        end

        a = 0; b = 1; c = 0; #10;
        if (out !== 8'b00000100) begin
            $display("FAIL: Expected 8'b00000100 for input 3'b010, got %b", out);
            $finish;
        end

        a = 0; b = 1; c = 1; #10;
        if (out !== 8'b00001000) begin
            $display("FAIL: Expected 8'b00001000 for input 3'b011, got %b", out);
            $finish;
        end

        a = 1; b = 0; c = 0; #10;
        if (out !== 8'b00010000) begin
            $display("FAIL: Expected 8'b00010000 for input 3'b100, got %b", out);
            $finish;
        end

        a = 1; b = 0; c = 1; #10;
        if (out !== 8'b00100000) begin
            $display("FAIL: Expected 8'b00100000 for input 3'b101, got %b", out);
            $finish;
        end

        a = 1; b = 1; c = 0; #10;
        if (out !== 8'b01000000) begin
            $display("FAIL: Expected 8'b01000000 for input 3'b110, got %b", out);
            $finish;
        end

        a = 1; b = 1; c = 1; #10;
        if (out !== 8'b10000000) begin
            $display("FAIL: Expected 8'b10000000 for input 3'b111, got %b", out);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule