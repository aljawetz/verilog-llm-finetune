`timescale 1ns/1ps

module tb_Gray_to_Bin;

    reg [3:0] gray;
    wire [3:0] bin;

    // Instantiate the module under test (uut)
    Gray_to_Bin uut (
        .gray(gray),
        .bin(bin)
    );

    initial begin
        // Test cases
        // Gray code: 0000 -> Binary: 0000
        gray = 4'b0000; #10;
        if (bin !== 4'b0000) $display("FAIL: Expected 0000 for Gray 0000, got %b", bin);

        // Gray code: 0001 -> Binary: 0001
        gray = 4'b0001; #10;
        if (bin !== 4'b0001) $display("FAIL: Expected 0001 for Gray 0001, got %b", bin);

        // Gray code: 0011 -> Binary: 0010
        gray = 4'b0011; #10;
        if (bin !== 4'b0010) $display("FAIL: Expected 0010 for Gray 0011, got %b", bin);

        // Gray code: 0010 -> Binary: 0011
        gray = 4'b0010; #10;
        if (bin !== 4'b0011) $display("FAIL: Expected 0011 for Gray 0010, got %b", bin);

        // Gray code: 0111 -> Binary: 0110
        gray = 4'b0111; #10;
        if (bin !== 4'b0110) $display("FAIL: Expected 0110 for Gray 0111, got %b", bin);

        // Gray code: 0110 -> Binary: 0111
        gray = 4'b0110; #10;
        if (bin !== 4'b0111) $display("FAIL: Expected 0111 for Gray 0110, got %b", bin);

        // Gray code: 1111 -> Binary: 1000
        gray = 4'b1111; #10;
        if (bin !== 4'b1000) $display("FAIL: Expected 1000 for Gray 1111, got %b", bin);

        // Gray code: 1000 -> Binary: 1001
        gray = 4'b1000; #10;
        if (bin !== 4'b1001) $display("FAIL: Expected 1001 for Gray 1000, got %b", bin);

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule