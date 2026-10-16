`timescale 1ns/1ps

module tb_hex2seg;

    reg [3:0] hex;
    wire [7:0] seg;

    // Instantiate the module under test (uut)
    hex2seg uut (
        .hex(hex),
        .seg(seg)
    );

    initial begin
        // Test cases
        hex = 4'h0; #10;
        if (seg !== 8'b11000000) $display("FAIL: Test case hex=0 failed");

        hex = 4'h1; #10;
        if (seg !== 8'b11111001) $display("FAIL: Test case hex=1 failed");

        hex = 4'h2; #10;
        if (seg !== 8'b10100100) $display("FAIL: Test case hex=2 failed");

        hex = 4'h3; #10;
        if (seg !== 8'b10110000) $display("FAIL: Test case hex=3 failed");

        hex = 4'h4; #10;
        if (seg !== 8'b10011001) $display("FAIL: Test case hex=4 failed");

        hex = 4'h5; #10;
        if (seg !== 8'b10010110) $display("FAIL: Test case hex=5 failed");

        hex = 4'h6; #10;
        if (seg !== 8'b10001110) $display("FAIL: Test case hex=6 failed");

        hex = 4'h7; #10;
        if (seg !== 8'b11111000) $display("FAIL: Test case hex=7 failed");

        hex = 4'h8; #10;
        if (seg !== 8'b10000000) $display("FAIL: Test case hex=8 failed");

        hex = 4'h9; #10;
        if (seg !== 8'b10010100) $display("FAIL: Test case hex=9 failed");

        hex = 4'hA; #10;
        if (seg !== 8'b10001100) $display("FAIL: Test case hex=A failed");

        hex = 4'hB; #10;
        if (seg !== 8'b10000010) $display("FAIL: Test case hex=B failed");

        hex = 4'hC; #10;
        if (seg !== 8'b11000110) $display("FAIL: Test case hex=C failed");

        hex = 4'hD; #10;
        if (seg !== 8'b10100010) $display("FAIL: Test case hex=D failed");

        hex = 4'hE; #10;
        if (seg !== 8'b10000110) $display("FAIL: Test case hex=E failed");

        hex = 4'hF; #10;
        if (seg !== 8'b10001110) $display("FAIL: Test case hex=F failed");

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule