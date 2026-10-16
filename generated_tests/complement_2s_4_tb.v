`timescale 1ns/1ps

module tb_complement_2s;
    reg [3:0] data;
    wire [3:0] out;

    // Instantiate the module under test (uut)
    complement_2s uut (
        .data(data),
        .out(out)
    );

    initial begin
        // Test cases
        // Test case 1: 0 -> 0
        data = 4'b0000; #10;
        if (out !== 4'b0000) $display("FAIL: Test case 1 failed, expected 0000, got %b", out);

        // Test case 2: 1 -> -1 (1111)
        data = 4'b0001; #10;
        if (out !== 4'b1111) $display("FAIL: Test case 2 failed, expected 1111, got %b", out);

        // Test case 3: 2 -> -2 (1110)
        data = 4'b0010; #10;
        if (out !== 4'b1110) $display("FAIL: Test case 3 failed, expected 1110, got %b", out);

        // Test case 4: 3 -> -3 (1101)
        data = 4'b0011; #10;
        if (out !== 4'b1101) $display("FAIL: Test case 4 failed, expected 1101, got %b", out);

        // Test case 5: 4 -> -4 (1100)
        data = 4'b0100; #10;
        if (out !== 4'b1100) $display("FAIL: Test case 5 failed, expected 1100, got %b", out);

        // Test case 6: 5 -> -5 (1011)
        data = 4'b0101; #10;
        if (out !== 4'b1011) $display("FAIL: Test case 6 failed, expected 1011, got %b", out);

        // Test case 7: 6 -> -6 (1010)
        data = 4'b0110; #10;
        if (out !== 4'b1010) $display("FAIL: Test case 7 failed, expected 1010, got %b", out);

        // Test case 8: 7 -> -7 (1001)
        data = 4'b0111; #10;
        if (out !== 4'b1001) $display("FAIL: Test case 8 failed, expected 1001, got %b", out);

        // Test case 9: 8 -> -8 (1000)
        data = 4'b1000; #10;
        if (out !== 4'b1000) $display("FAIL: Test case 9 failed, expected 1000, got %b", out);

        // Test case 10: 9 -> -9 (0111)
        data = 4'b1001; #10;
        if (out !== 4'b0111) $display("FAIL: Test case 10 failed, expected 0111, got %b", out);

        // Test case 11: 10 -> -10 (0110)
        data = 4'b1010; #10;
        if (out !== 4'b0110) $display("FAIL: Test case 11 failed, expected 0110, got %b", out);

        // Test case 12: 11 -> -11 (0101)
        data = 4'b1011; #10;
        if (out !== 4'b0101) $display("FAIL: Test case 12 failed, expected 0101, got %b", out);

        // Test case 13: 12 -> -12 (0100)
        data = 4'b1100; #10;
        if (out !== 4'b0100) $display("FAIL: Test case 13 failed, expected 0100, got %b", out);

        // Test case 14: 13 -> -13 (0011)
        data = 4'b1101; #10;
        if (out !== 4'b0011) $display("FAIL: Test case 14 failed, expected 0011, got %b", out);

        // Test case 15: 14 -> -14 (0010)
        data = 4'b1110; #10;
        if (out !== 4'b0010) $display("FAIL: Test case 15 failed, expected 0010, got %b", out);

        // Test case 16: 15 -> -15 (0001)
        data = 4'b1111; #10;
        if (out !== 4'b0001) $display("FAIL: Test case 16 failed, expected 0001, got %b", out);

        // If all tests pass
        $display("PASS");
        $finish;
    end
endmodule