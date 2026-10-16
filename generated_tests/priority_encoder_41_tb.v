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
        // Test case 1: Input is 8'b00000001
        in = 8'b00000001; #10;
        if (out !== 3'b000) begin
            $display("FAIL: Expected out = 000 for in = 00000001, got out = %b", out);
            $finish;
        end

        // Test case 2: Input is 8'b00000010
        in = 8'b00000010; #10;
        if (out !== 3'b001) begin
            $display("FAIL: Expected out = 001 for in = 00000010, got out = %b", out);
            $finish;
        end

        // Test case 3: Input is 8'b00000100
        in = 8'b00000100; #10;
        if (out !== 3'b010) begin
            $display("FAIL: Expected out = 010 for in = 00000100, got out = %b", out);
            $finish;
        end

        // Test case 4: Input is 8'b00001000
        in = 8'b00001000; #10;
        if (out !== 3'b011) begin
            $display("FAIL: Expected out = 011 for in = 00001000, got out = %b", out);
            $finish;
        end

        // Test case 5: Input is 8'b00010000
        in = 8'b00010000; #10;
        if (out !== 3'b100) begin
            $display("FAIL: Expected out = 100 for in = 00010000, got out = %b", out);
            $finish;
        end

        // Test case 6: Input is 8'b00100000
        in = 8'b00100000; #10;
        if (out !== 3'b101) begin
            $display("FAIL: Expected out = 101 for in = 00100000, got out = %b", out);
            $finish;
        end

        // Test case 7: Input is 8'b01000000
        in = 8'b01000000; #10;
        if (out !== 3'b110) begin
            $display("FAIL: Expected out = 110 for in = 01000000, got out = %b", out);
            $finish;
        end

        // Test case 8: Input is 8'b10000000
        in = 8'b10000000; #10;
        if (out !== 3'b111) begin
            $display("FAIL: Expected out = 111 for in = 10000000, got out = %b", out);
            $finish;
        end

        // Test case 9: Input is 8'b00000000 (no valid input)
        in = 8'b00000000; #10;
        if (out !== 3'b000) begin
            $display("FAIL: Expected out = 000 for in = 00000000, got out = %b", out);
            $finish;
        end

        $display("PASS");
        $finish;
    end

endmodule