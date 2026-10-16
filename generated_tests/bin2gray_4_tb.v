`timescale 1ns/1ps

module tb_bin2gray;

    reg [3:0] bin;
    wire [3:0] gray;

    // Instantiate the module under test (uut)
    bin2gray uut (
        .bin(bin),
        .gray(gray)
    );

    initial begin
        // Test cases
        // Test case 0: bin = 0000
        bin = 4'b0000; #10;
        if (gray !== 4'b0000) begin
            $display("FAIL: Expected gray = 0000 for bin = 0000, got gray = %b", gray);
            $finish;
        end

        // Test case 1: bin = 0001
        bin = 4'b0001; #10;
        if (gray !== 4'b0001) begin
            $display("FAIL: Expected gray = 0001 for bin = 0001, got gray = %b", gray);
            $finish;
        end

        // Test case 2: bin = 0010
        bin = 4'b0010; #10;
        if (gray !== 4'b0011) begin
            $display("FAIL: Expected gray = 0011 for bin = 0010, got gray = %b", gray);
            $finish;
        end

        // Test case 3: bin = 0011
        bin = 4'b0011; #10;
        if (gray !== 4'b0010) begin
            $display("FAIL: Expected gray = 0010 for bin = 0011, got gray = %b", gray);
            $finish;
        end

        // Test case 4: bin = 0100
        bin = 4'b0100; #10;
        if (gray !== 4'b0110) begin
            $display("FAIL: Expected gray = 0110 for bin = 0100, got gray = %b", gray);
            $finish;
        end

        // Test case 5: bin = 0101
        bin = 4'b0101; #10;
        if (gray !== 4'b0111) begin
            $display("FAIL: Expected gray = 0111 for bin = 0101, got gray = %b", gray);
            $finish;
        end

        // Test case 6: bin = 0110
        bin = 4'b0110; #10;
        if (gray !== 4'b0101) begin
            $display("FAIL: Expected gray = 0101 for bin = 0110, got gray = %b", gray);
            $finish;
        end

        // Test case 7: bin = 0111
        bin = 4'b0111; #10;
        if (gray !== 4'b0100) begin
            $display("FAIL: Expected gray = 0100 for bin = 0111, got gray = %b", gray);
            $finish;
        end

        // Test case 8: bin = 1000
        bin = 4'b1000; #10;
        if (gray !== 4'b1100) begin
            $display("FAIL: Expected gray = 1100 for bin = 1000, got gray = %b", gray);
            $finish;
        end

        // Test case 9: bin = 1001
        bin = 4'b1001; #10;
        if (gray !== 4'b1101) begin
            $display("FAIL: Expected gray = 1101 for bin = 1001, got gray = %b", gray);
            $finish;
        end

        // Test case 10: bin = 1010
        bin = 4'b1010; #10;
        if (gray !== 4'b1111) begin
            $display("FAIL: Expected gray = 1111 for bin = 1010, got gray = %b", gray);
            $finish;
        end

        // Test case 11: bin = 1011
        bin = 4'b1011; #10;
        if (gray !== 4'b1110) begin
            $display("FAIL: Expected gray = 1110 for bin = 1011, got gray = %b", gray);
            $finish;
        end

        // Test case 12: bin = 1100
        bin = 4'b1100; #10;
        if (gray !== 4'b1010) begin
            $display("FAIL: Expected gray = 1010 for bin = 1100, got gray = %b", gray);
            $finish;
        end

        // Test case 13: bin = 1101
        bin = 4'b1101; #10;
        if (gray !== 4'b1011) begin
            $display("FAIL: Expected gray = 1011 for bin = 1101, got gray = %b", gray);
            $finish;
        end

        // Test case 14: bin = 1110
        bin = 4'b1110; #10;
        if (gray !== 4'b1001) begin
            $display("FAIL: Expected gray = 1001 for bin = 1110, got gray = %b", gray);
            $finish;
        end

        // Test case 15: bin = 1111
        bin = 4'b1111; #10;
        if (gray !== 4'b1000) begin
            $display("FAIL: Expected gray = 1000 for bin = 1111, got gray = %b", gray);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule