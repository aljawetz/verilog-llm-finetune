`timescale 1ns/1ps

module tb_nor_nand;

    reg [3:0] in;
    wire out;

    // Instantiate the module under test
    nor_nand uut (
        .in(in),
        .out(out)
    );

    initial begin
        // Test case 1: in = 4'b0000
        in = 4'b0000; #10;
        if (out !== 1'b1) $display("FAIL: Test case 1 failed (in = 0000, out = %b)", out);

        // Test case 2: in = 4'b0001
        in = 4'b0001; #10;
        if (out !== 1'b1) $display("FAIL: Test case 2 failed (in = 0001, out = %b)", out);

        // Test case 3: in = 4'b0010
        in = 4'b0010; #10;
        if (out !== 1'b1) $display("FAIL: Test case 3 failed (in = 0010, out = %b)", out);

        // Test case 4: in = 4'b0011
        in = 4'b0011; #10;
        if (out !== 1'b0) $display("FAIL: Test case 4 failed (in = 0011, out = %b)", out);

        // Test case 5: in = 4'b0100
        in = 4'b0100; #10;
        if (out !== 1'b1) $display("FAIL: Test case 5 failed (in = 0100, out = %b)", out);

        // Test case 6: in = 4'b0101
        in = 4'b0101; #10;
        if (out !== 1'b0) $display("FAIL: Test case 6 failed (in = 0101, out = %b)", out);

        // Test case 7: in = 4'b0110
        in = 4'b0110; #10;
        if (out !== 1'b0) $display("FAIL: Test case 7 failed (in = 0110, out = %b)", out);

        // Test case 8: in = 4'b0111
        in = 4'b0111; #10;
        if (out !== 1'b0) $display("FAIL: Test case 8 failed (in = 0111, out = %b)", out);

        // Test case 9: in = 4'b1000
        in = 4'b1000; #10;
        if (out !== 1'b1) $display("FAIL: Test case 9 failed (in = 1000, out = %b)", out);

        // Test case 10: in = 4'b1001
        in = 4'b1001; #10;
        if (out !== 1'b0) $display("FAIL: Test case 10 failed (in = 1001, out = %b)", out);

        // Test case 11: in = 4'b1010
        in = 4'b1010; #10;
        if (out !== 1'b0) $display("FAIL: Test case 11 failed (in = 1010, out = %b)", out);

        // Test case 12: in = 4'b1011
        in = 4'b1011; #10;
        if (out !== 1'b0) $display("FAIL: Test case 12 failed (in = 1011, out = %b)", out);

        // Test case 13: in = 4'b1100
        in = 4'b1100; #10;
        if (out !== 1'b0) $display("FAIL: Test case 13 failed (in = 1100, out = %b)", out);

        // Test case 14: in = 4'b1101
        in = 4'b1101; #10;
        if (out !== 1'b0) $display("FAIL: Test case 14 failed (in = 1101, out = %b)", out);

        // Test case 15: in = 4'b1110
        in = 4'b1110; #10;
        if (out !== 1'b0) $display("FAIL: Test case 15 failed (in = 1110, out = %b)", out);

        // Test case 16: in = 4'b1111
        in = 4'b1111; #10;
        if (out !== 1'b0) $display("FAIL: Test case 16 failed (in = 1111, out = %b)", out);

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule