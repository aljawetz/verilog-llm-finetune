`timescale 1ns/1ps

module tb_binToHot;

    parameter BIN_W = 4;
    parameter ONE_HOT_W = 16;

    reg [BIN_W-1:0] bin;
    wire [ONE_HOT_W-1:0] out;

    // Instantiate the module under test (uut)
    binToHot #(BIN_W, ONE_HOT_W) uut (
        .bin(bin),
        .out(out)
    );

    initial begin
        // Test case 1: bin = 0
        bin = 4'b0000; #10;
        if (out !== 16'b0000000000000001) begin
            $display("FAIL: Test case 1 failed for bin = %b, got out = %b", bin, out);
            $finish;
        end

        // Test case 2: bin = 1
        bin = 4'b0001; #10;
        if (out !== 16'b0000000000000010) begin
            $display("FAIL: Test case 2 failed for bin = %b, got out = %b", bin, out);
            $finish;
        end

        // Test case 3: bin = 2
        bin = 4'b0010; #10;
        if (out !== 16'b0000000000000100) begin
            $display("FAIL: Test case 3 failed for bin = %b, got out = %b", bin, out);
            $finish;
        end

        // Test case 4: bin = 3
        bin = 4'b0011; #10;
        if (out !== 16'b0000000000001000) begin
            $display("FAIL: Test case 4 failed for bin = %b, got out = %b", bin, out);
            $finish;
        end

        // Test case 5: bin = 4
        bin = 4'b0100; #10;
        if (out !== 16'b0000000000010000) begin
            $display("FAIL: Test case 5 failed for bin = %b, got out = %b", bin, out);
            $finish;
        end

        // Test case 6: bin = 5
        bin = 4'b0101; #10;
        if (out !== 16'b0000000000100000) begin
            $display("FAIL: Test case 6 failed for bin = %b, got out = %b", bin, out);
            $finish;
        end

        // Test case 7: bin = 6
        bin = 4'b0110; #10;
        if (out !== 16'b0000000001000000) begin
            $display("FAIL: Test case 7 failed for bin = %b, got out = %b", bin, out);
            $finish;
        end

        // Test case 8: bin = 7
        bin = 4'b0111; #10;
        if (out !== 16'b0000000010000000) begin
            $display("FAIL: Test case 8 failed for bin = %b, got out = %b", bin, out);
            $finish;
        end

        // Test case 9: bin = 8
        bin = 4'b1000; #10;
        if (out !== 16'b0000000100000000) begin
            $display("FAIL: Test case 9 failed for bin = %b, got out = %b", bin, out);
            $finish;
        end

        // Test case 10: bin = 9
        bin = 4'b1001; #10;
        if (out !== 16'b0000001000000000) begin
            $display("FAIL: Test case 10 failed for bin = %b, got out = %b", bin, out);
            $finish;
        end

        // Test case 11: bin = 10
        bin = 4'b1010; #10;
        if (out !== 16'b0000010000000000) begin
            $display("FAIL: Test case 11 failed for bin = %b, got out = %b", bin, out);
            $finish;
        end

        // Test case 12: bin = 11
        bin = 4'b1011; #10;
        if (out !== 16'b0000100000000000) begin
            $display("FAIL: Test case 12 failed for bin = %b, got out = %b", bin, out);
            $finish;
        end

        // Test case 13: bin = 12
        bin = 4'b1100; #10;
        if (out !== 16'b0001000000000000) begin
            $display("FAIL: Test case 13 failed for bin = %b, got out = %b", bin, out);
            $finish;
        end

        // Test case 14: bin = 13
        bin = 4'b1101; #10;
        if (out !== 16'b0010000000000000) begin
            $display("FAIL: Test case 14 failed for bin = %b, got out = %b", bin, out);
            $finish;
        end

        // Test case 15: bin = 14
        bin = 4'b1110; #10;
        if (out !== 16'b0100000000000000) begin
            $display("FAIL: Test case 15 failed for bin = %b, got out = %b", bin, out);
            $finish;
        end

        // Test case 16: bin = 15
        bin = 4'b1111; #10;
        if (out !== 16'b1000000000000000) begin
            $display("FAIL: Test case 16 failed for bin = %b, got out = %b", bin, out);
            $finish;
        end

        $display("PASS");
        $finish;
    end

endmodule