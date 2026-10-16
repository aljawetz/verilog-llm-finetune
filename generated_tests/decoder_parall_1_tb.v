`timescale 1ns/1ps

module tb_decoder_parall;

    reg [2:0] in;
    wire [7:0] out;

    // Instantiate the module under test
    decoder_parall uut (
        .in(in),
        .out(out)
    );

    initial begin
        // Test all possible input values
        in = 3'd0; #10;
        if (out !== 8'b00000001) begin
            $display("FAIL: Expected output for in=0 is 00000001, got %b", out);
            $finish;
        end

        in = 3'd1; #10;
        if (out !== 8'b00000010) begin
            $display("FAIL: Expected output for in=1 is 00000010, got %b", out);
            $finish;
        end

        in = 3'd2; #10;
        if (out !== 8'b00000100) begin
            $display("FAIL: Expected output for in=2 is 00000100, got %b", out);
            $finish;
        end

        in = 3'd3; #10;
        if (out !== 8'b00001000) begin
            $display("FAIL: Expected output for in=3 is 00001000, got %b", out);
            $finish;
        end

        in = 3'd4; #10;
        if (out !== 8'b00010000) begin
            $display("FAIL: Expected output for in=4 is 00010000, got %b", out);
            $finish;
        end

        in = 3'd5; #10;
        if (out !== 8'b00100000) begin
            $display("FAIL: Expected output for in=5 is 00100000, got %b", out);
            $finish;
        end

        in = 3'd6; #10;
        if (out !== 8'b01000000) begin
            $display("FAIL: Expected output for in=6 is 01000000, got %b", out);
            $finish;
        end

        in = 3'd7; #10;
        if (out !== 8'b10000000) begin
            $display("FAIL: Expected output for in=7 is 10000000, got %b", out);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule