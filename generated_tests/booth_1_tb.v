`timescale 1ns/1ps

module tb_booth;

    reg [3:0] in;
    reg signed [5:0] tx; // 4 bits + 2 for sign extension
    reg signed [3:0] x;
    wire signed [5:0] out;

    // Instantiate the module under test
    booth uut (
        .in(in),
        .tx(tx),
        .x(x),
        .out(out)
    );

    initial begin
        // Test case 1: in = 0000
        in = 4'b0000; tx = 6'sb000000; x = 4'b0000; #10;
        if (out !== 6'sb000000) $display("FAIL: Test case 1 failed, expected 0, got %d", out);

        // Test case 2: in = 0001
        in = 4'b0001; tx = 6'sb000000; x = 4'b0001; #10;
        if (out !== 6'sb000001) $display("FAIL: Test case 2 failed, expected 1, got %d", out);

        // Test case 3: in = 0010
        in = 4'b0010; tx = 6'sb000000; x = 4'b0010; #10;
        if (out !== 6'sb000010) $display("FAIL: Test case 3 failed, expected 2, got %d", out);

        // Test case 4: in = 0011
        in = 4'b0011; tx = 6'sb000000; x = 4'b0001; #10;
        if (out !== 6'sb000010) $display("FAIL: Test case 4 failed, expected 2, got %d", out);

        // Test case 5: in = 0100
        in = 4'b0100; tx = 6'sb000000; x = 4'b0001; #10;
        if (out !== 6'sb000010) $display("FAIL: Test case 5 failed, expected 2, got %d", out);

        // Test case 6: in = 0101
        in = 4'b0101; tx = 6'sb000011; x = 4'b0000; #10;
        if (out !== 6'sb000011) $display("FAIL: Test case 6 failed, expected 3, got %d", out);

        // Test case 7: in = 0110
        in = 4'b0110; tx = 6'sb000011; x = 4'b0000; #10;
        if (out !== 6'sb000011) $display("FAIL: Test case 7 failed, expected 3, got %d", out);

        // Test case 8: in = 0111
        in = 4'b0111; tx = 6'sb000000; x = 4'b0001; #10;
        if (out !== 6'sb000100) $display("FAIL: Test case 8 failed, expected 4, got %d", out);

        // Test case 9: in = 1000
        in = 4'b1000; tx = 6'sb000000; x = 4'b0001; #10;
        if (out !== 6'sb111100) $display("FAIL: Test case 9 failed, expected -4, got %d", out);

        // Test case 10: in = 1001
        in = 4'b1001; tx = 6'sb000011; x = 4'b0000; #10;
        if (out !== 6'sb111101) $display("FAIL: Test case 10 failed, expected -3, got %d", out);

        // Test case 11: in = 1010
        in = 4'b1010; tx = 6'sb000011; x = 4'b0000; #10;
        if (out !== 6'sb111101) $display("FAIL: Test case 11 failed, expected -3, got %d", out);

        // Test case 12: in = 1011
        in = 4'b1011; tx = 6'sb000000; x = 4'b0001; #10;
        if (out !== 6'sb111110) $display("FAIL: Test case 12 failed, expected -2, got %d", out);

        // Test case 13: in = 1100
        in = 4'b1100; tx = 6'sb000000; x = 4'b0001; #10;
        if (out !== 6'sb111110) $display("FAIL: Test case 13 failed, expected -2, got %d", out);

        // Test case 14: in = 1101
        in = 4'b1101; tx = 6'sb000000; x = 4'b0001; #10;
        if (out !== 6'sb111111) $display("FAIL: Test case 14 failed, expected -1, got %d", out);

        // Test case 15: in = 1110
        in = 4'b1110; tx = 6'sb000000; x = 4'b0001; #10;
        if (out !== 6'sb111111) $display("FAIL: Test case 15 failed, expected -1, got %d", out);

        // Test case 16: in = 1111
        in = 4'b1111; tx = 6'sb000000; x = 4'b0000; #10;
        if (out !== 6'sb000000) $display("FAIL: Test case 16 failed, expected 0, got %d", out);

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule