`timescale 1ns/1ps

module tb_deco_3_8;

    reg [2:0] in;
    wire [7:0] out;

    // Instantiate the module under test (uut)
    deco_3_8 uut (
        .in(in),
        .out(out)
    );

    initial begin
        // Test cases
        in = 3'b000; #10;
        if (out !== 8'b00000001) begin
            $display("FAIL: Test case in=000 failed, expected 00000001, got %b", out);
            $finish;
        end

        in = 3'b001; #10;
        if (out !== 8'b00000010) begin
            $display("FAIL: Test case in=001 failed, expected 00000010, got %b", out);
            $finish;
        end

        in = 3'b010; #10;
        if (out !== 8'b00000100) begin
            $display("FAIL: Test case in=010 failed, expected 00000100, got %b", out);
            $finish;
        end

        in = 3'b011; #10;
        if (out !== 8'b00001000) begin
            $display("FAIL: Test case in=011 failed, expected 00001000, got %b", out);
            $finish;
        end

        in = 3'b100; #10;
        if (out !== 8'b00010000) begin
            $display("FAIL: Test case in=100 failed, expected 00010000, got %b", out);
            $finish;
        end

        in = 3'b101; #10;
        if (out !== 8'b00100000) begin
            $display("FAIL: Test case in=101 failed, expected 00100000, got %b", out);
            $finish;
        end

        in = 3'b110; #10;
        if (out !== 8'b01000000) begin
            $display("FAIL: Test case in=110 failed, expected 01000000, got %b", out);
            $finish;
        end

        in = 3'b111; #10;
        if (out !== 8'b10000000) begin
            $display("FAIL: Test case in=111 failed, expected 10000000, got %b", out);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end
endmodule