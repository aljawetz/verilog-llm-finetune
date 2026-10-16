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
        if ({a, b, c, d, e, f, g} !== 7'b0000001) $display("FAIL: hex=0, expected=0000001, got=%b", {a, b, c, d, e, f, g});

        hex = 4'h1; #10;
        if ({a, b, c, d, e, f, g} !== 7'b1001111) $display("FAIL: hex=1, expected=1001111, got=%b", {a, b, c, d, e, f, g});

        hex = 4'h2; #10;
        if ({a, b, c, d, e, f, g} !== 7'b0010010) $display("FAIL: hex=2, expected=0010010, got=%b", {a, b, c, d, e, f, g});

        hex = 4'h3; #10;
        if ({a, b, c, d, e, f, g} !== 7'b0000110) $display("FAIL: hex=3, expected=0000110, got=%b", {a, b, c, d, e, f, g});

        hex = 4'h4; #10;
        if ({a, b, c, d, e, f, g} !== 7'b1001100) $display("FAIL: hex=4, expected=1001100, got=%b", {a, b, c, d, e, f, g});

        hex = 4'h5; #10;
        if ({a, b, c, d, e, f, g} !== 7'b0100100) $display("FAIL: hex=5, expected=0100100, got=%b", {a, b, c, d, e, f, g});

        hex = 4'h6; #10;
        if ({a, b, c, d, e, f, g} !== 7'b0100000) $display("FAIL: hex=6, expected=0100000, got=%b", {a, b, c, d, e, f, g});

        hex = 4'h7; #10;
        if ({a, b, c, d, e, f, g} !== 7'b0001111) $display("FAIL: hex=7, expected=0001111, got=%b", {a, b, c, d, e, f, g});

        hex = 4'h8; #10;
        if ({a, b, c, d, e, f, g} !== 7'b0000000) $display("FAIL: hex=8, expected=0000000, got=%b", {a, b, c, d, e, f, g});

        hex = 4'h9; #10;
        if ({a, b, c, d, e, f, g} !== 7'b0000100) $display("FAIL: hex=9, expected=0000100, got=%b", {a, b, c, d, e, f, g});

        hex = 4'hA; #10;
        if ({a, b, c, d, e, f, g} !== 7'b0001000) $display("FAIL: hex=A, expected=0001000, got=%b", {a, b, c, d, e, f, g});

        hex = 4'hB; #10;
        if ({a, b, c, d, e, f, g} !== 7'b1100000) $display("FAIL: hex=B, expected=1100000, got=%b", {a, b, c, d, e, f, g});

        hex = 4'hC; #10;
        if ({a, b, c, d, e, f, g} !== 7'b0110001) $display("FAIL: hex=C, expected=0110001, got=%b", {a, b, c, d, e, f, g});

        hex = 4'hD; #10;
        if ({a, b, c, d, e, f, g} !== 7'b1000010) $display("FAIL: hex=D, expected=1000010, got=%b", {a, b, c, d, e, f, g});

        hex = 4'hE; #10;
        if ({a, b, c, d, e, f, g} !== 7'b0110000) $display("FAIL: hex=E, expected=0110000, got=%b", {a, b, c, d, e, f, g});

        hex = 4'hF; #10;
        if ({a, b, c, d, e, f, g} !== 7'b0111000) $display("FAIL: hex=F, expected=0111000, got=%b", {a, b, c, d, e, f, g});

        $display("PASS");
        $finish;
    end

endmodule