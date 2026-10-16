`timescale 1ns/1ps

module tb_disp_dec;

    reg [3:0] disp_dec_in;
    wire [6:0] disp_dec_out;

    // Instantiate the module under test (uut)
    disp_dec uut (
        .disp_dec_in(disp_dec_in),
        .disp_dec_out(disp_dec_out)
    );

    initial begin
        // Test all possible 4-bit inputs
        disp_dec_in = 4'b0000; #10;
        if (disp_dec_out !== 7'b1000000) $display("FAIL: Input 0x0 expected 0x40, got %b", disp_dec_out);

        disp_dec_in = 4'b0001; #10;
        if (disp_dec_out !== 7'b1111001) $display("FAIL: Input 0x1 expected 0x79, got %b", disp_dec_out);

        disp_dec_in = 4'b0010; #10;
        if (disp_dec_out !== 7'b0100100) $display("FAIL: Input 0x2 expected 0x24, got %b", disp_dec_out);

        disp_dec_in = 4'b0011; #10;
        if (disp_dec_out !== 7'b0110000) $display("FAIL: Input 0x3 expected 0x30, got %b", disp_dec_out);

        disp_dec_in = 4'b0100; #10;
        if (disp_dec_out !== 7'b0011001) $display("FAIL: Input 0x4 expected 0x39, got %b", disp_dec_out);

        disp_dec_in = 4'b0101; #10;
        if (disp_dec_out !== 7'b0010010) $display("FAIL: Input 0x5 expected 0x50, got %b", disp_dec_out);

        disp_dec_in = 4'b0110; #10;
        if (disp_dec_out !== 7'b0000010) $display("FAIL: Input 0x6 expected 0x3, got %b", disp_dec_out);

        disp_dec_in = 4'b0111; #10;
        if (disp_dec_out !== 7'b1111000) $display("FAIL: Input 0x7 expected 0x78, got %b", disp_dec_out);

        disp_dec_in = 4'b1000; #10;
        if (disp_dec_out !== 7'b0000000) $display("FAIL: Input 0x8 expected 0x0, got %b", disp_dec_out);

        disp_dec_in = 4'b1001; #10;
        if (disp_dec_out !== 7'b0010000) $display("FAIL: Input 0x9 expected 0x20, got %b", disp_dec_out);

        disp_dec_in = 4'b1010; #10;
        if (disp_dec_out !== 7'b0001000) $display("FAIL: Input 0xA expected 0x8, got %b", disp_dec_out);

        disp_dec_in = 4'b1011; #10;
        if (disp_dec_out !== 7'b0000011) $display("FAIL: Input 0xB expected 0x3, got %b", disp_dec_out);

        disp_dec_in = 4'b1100; #10;
        if (disp_dec_out !== 7'b1000110) $display("FAIL: Input 0xC expected 0x66, got %b", disp_dec_out);

        disp_dec_in = 4'b1101; #10;
        if (disp_dec_out !== 7'b0100001) $display("FAIL: Input 0xD expected 0x41, got %b", disp_dec_out);

        disp_dec_in = 4'b1110; #10;
        if (disp_dec_out !== 7'b0000110) $display("FAIL: Input 0xE expected 0x6, got %b", disp_dec_out);

        disp_dec_in = 4'b1111; #10;
        if (disp_dec_out !== 7'b0001110) $display("FAIL: Input 0xF expected 0xE, got %b", disp_dec_out);

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule