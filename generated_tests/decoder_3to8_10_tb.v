`timescale 1ns/1ps

module tb_decoder_3to8;

    reg [2:0] in;
    wire [7:0] out;

    // Instantiate the module under test (uut)
    decoder_3to8 uut (
        .in(in),
        .out(out)
    );

    initial begin
        // Test all input combinations
        in = 3'b000; #10;
        if (out !== 8'b0000_0001) begin
            $display("FAIL: Expected out = 8'b0000_0001 for in = 3'b000, got out = %b", out);
            $finish;
        end

        in = 3'b001; #10;
        if (out !== 8'b0000_0010) begin
            $display("FAIL: Expected out = 8'b0000_0010 for in = 3'b001, got out = %b", out);
            $finish;
        end

        in = 3'b010; #10;
        if (out !== 8'b0000_0100) begin
            $display("FAIL: Expected out = 8'b0000_0100 for in = 3'b010, got out = %b", out);
            $finish;
        end

        in = 3'b011; #10;
        if (out !== 8'b0000_1000) begin
            $display("FAIL: Expected out = 8'b0000_1000 for in = 3'b011, got out = %b", out);
            $finish;
        end

        in = 3'b100; #10;
        if (out !== 8'b0001_0000) begin
            $display("FAIL: Expected out = 8'b0001_0000 for in = 3'b100, got out = %b", out);
            $finish;
        end

        in = 3'b101; #10;
        if (out !== 8'b0010_0000) begin
            $display("FAIL: Expected out = 8'b0010_0000 for in = 3'b101, got out = %b", out);
            $finish;
        end

        in = 3'b110; #10;
        if (out !== 8'b0100_0000) begin
            $display("FAIL: Expected out = 8'b0100_0000 for in = 3'b110, got out = %b", out);
            $finish;
        end

        in = 3'b111; #10;
        if (out !== 8'b1000_0000) begin
            $display("FAIL: Expected out = 8'b1000_0000 for in = 3'b111, got out = %b", out);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule