`timescale 1ns/1ps

module tb_hex_to_7seg;

    // Inputs
    reg [3:0] hex;

    // Outputs
    wire a, b, c, d, e, f, g;

    // Instantiate the Unit Under Test (UUT)
    hex_to_7seg uut (
        .hex(hex),
        .a(a),
        .b(b),
        .c(c),
        .d(d),
        .e(e),
        .f(f),
        .g(g)
    );

    initial begin
        // Test all hex values from 0 to F
        hex = 4'h0; #10;
        if ({a, b, c, d, e, f, g} !== 7'b0000001) $display("FAIL: Test for hex 0 failed");

        hex = 4'h1; #10;
        if ({a, b, c, d, e, f, g} !== 7'b1001111) $display("FAIL: Test for hex 1 failed");

        hex = 4'h2; #10;
        if ({a, b, c, d, e, f, g} !== 7'b0010010) $display("FAIL: Test for hex 2 failed");

        hex = 4'h3; #10;
        if ({a, b, c, d, e, f, g} !== 7'b0000110) $display("FAIL: Test for hex 3 failed");

        hex = 4'h4; #10;
        if ({a, b, c, d, e, f, g} !== 7'b1001100) $display("FAIL: Test for hex 4 failed");

        hex = 4'h5; #10;
        if ({a, b, c, d, e, f, g} !== 7'b0100100) $display("FAIL: Test for hex 5 failed");

        hex = 4'h6; #10;
        if ({a, b, c, d, e, f, g} !== 7'b0100000) $display("FAIL: Test for hex 6 failed");

        hex = 4'h7; #10;
        if ({a, b, c, d, e, f, g} !== 7'b0001111) $display("FAIL: Test for hex 7 failed");

        hex = 4'h8; #10;
        if ({a, b, c, d, e, f, g} !== 7'b0000000) $display("FAIL: Test for hex 8 failed");

        hex = 4'h9; #10;
        if ({a, b, c, d, e, f, g} !== 7'b0000100) $display("FAIL: Test for hex 9 failed");

        hex = 4'hA; #10;
        if ({a, b, c, d, e, f, g} !== 7'b0001000) $display("FAIL: Test for hex A failed");

        hex = 4'hB; #10;
        if ({a, b, c, d, e, f, g} !== 7'b1100000) $display("FAIL: Test for hex B failed");

        hex = 4'hC; #10;
        if ({a, b, c, d, e, f, g} !== 7'b0110001) $display("FAIL: Test for hex C failed");

        hex = 4'hD; #10;
        if ({a, b, c, d, e, f, g} !== 7'b1000010) $display("FAIL: Test for hex D failed");

        hex = 4'hE; #10;
        if ({a, b, c, d, e, f, g} !== 7'b0110000) $display("FAIL: Test for hex E failed");

        hex = 4'hF; #10;
        if ({a, b, c, d, e, f, g} !== 7'b0111000) $display("FAIL: Test for hex F failed");

        $display("PASS");
        $finish;
    end

endmodule