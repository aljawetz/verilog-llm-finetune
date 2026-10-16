`timescale 1ns/1ps

module tb_priority_encoder;

    reg [7:0] in;
    wire [2:0] out;

    // Instantiate the module under test
    priority_encoder uut (
        .in(in),
        .out(out)
    );

    initial begin
        // Test cases
        // Test case 1: Input is 00000001, expected output is 000
        in = 8'b00000001; #10;
        if (out !== 3'b000) begin
            $display("FAIL: Expected output 000 for input 00000001, got %b", out);
            $finish;
        end

        // Test case 2: Input is 00000010, expected output is 001
        in = 8'b00000010; #10;
        if (out !== 3'b001) begin
            $display("FAIL: Expected output 001 for input 00000010, got %b", out);
            $finish;
        end

        // Test case 3: Input is 00000100, expected output is 010
        in = 8'b00000100; #10;
        if (out !== 3'b010) begin
            $display("FAIL: Expected output 010 for input 00000100, got %b", out);
            $finish;
        end

        // Test case 4: Input is 00001000, expected output is 011
        in = 8'b00001000; #10;
        if (out !== 3'b011) begin
            $display("FAIL: Expected output 011 for input 00001000, got %b", out);
            $finish;
        end

        // Test case 5: Input is 00010000, expected output is 100
        in = 8'b00010000; #10;
        if (out !== 3'b100) begin
            $display("FAIL: Expected output 100 for input 00010000, got %b", out);
            $finish;
        end

        // Test case 6: Input is 00100000, expected output is 101
        in = 8'b00100000; #10;
        if (out !== 3'b101) begin
            $display("FAIL: Expected output 101 for input 00100000, got %b", out);
            $finish;
        end

        // Test case 7: Input is 01000000, expected output is 110
        in = 8'b01000000; #10;
        if (out !== 3'b110) begin
            $display("FAIL: Expected output 110 for input 01000000, got %b", out);
            $finish;
        end

        // Test case 8: Input is 10000000, expected output is 111
        in = 8'b10000000; #10;
        if (out !== 3'b111) begin
            $display("FAIL: Expected output 111 for input 10000000, got %b", out);
            $finish;
        end

        // Test case 9: Input is 00000000, expected output is 000
        in = 8'b00000000; #10;
        if (out !== 3'b000) begin
            $display("FAIL: Expected output 000 for input 00000000, got %b", out);
            $finish;
        end

        // Test case 10: Input is 11111111 (invalid one-hot), expected output is 000
        in = 8'b11111111; #10;
        if (out !== 3'b000) begin
            $display("FAIL: Expected output 000 for input 11111111, got %b", out);
            $finish;
        end

        $display("PASS");
        $finish;
    end

endmodule